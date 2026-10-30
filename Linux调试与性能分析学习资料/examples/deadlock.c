#define _XOPEN_SOURCE 700
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;
static pthread_barrier_t both_locked;

static void check(int rc, const char *operation)
{
    if (rc != 0) {
        fprintf(stderr, "%s: %s\n", operation, strerror(rc));
        exit(EXIT_FAILURE);
    }
}

static void wait_for_peer(void)
{
    int rc = pthread_barrier_wait(&both_locked);
    if (rc != 0 && rc != PTHREAD_BARRIER_SERIAL_THREAD)
        check(rc, "pthread_barrier_wait");
}

static void *worker_a(void *unused)
{
    (void)unused;
    check(pthread_mutex_lock(&lock_a), "lock_a");
    puts("A holds lock_a; waiting for B to hold lock_b");
    wait_for_peer();
    check(pthread_mutex_lock(&lock_b), "lock_b"); /* Cannot finish. */
    check(pthread_mutex_unlock(&lock_b), "unlock_b");
    check(pthread_mutex_unlock(&lock_a), "unlock_a");
    return NULL;
}

static void *worker_b(void *unused)
{
    (void)unused;
    check(pthread_mutex_lock(&lock_b), "lock_b");
    puts("B holds lock_b; waiting for A to hold lock_a");
    wait_for_peer();
    check(pthread_mutex_lock(&lock_a), "lock_a"); /* Cannot finish. */
    check(pthread_mutex_unlock(&lock_a), "unlock_a");
    check(pthread_mutex_unlock(&lock_b), "unlock_b");
    return NULL;
}

int main(void)
{
    pthread_t a, b;
    setvbuf(stdout, NULL, _IONBF, 0);
    check(pthread_barrier_init(&both_locked, NULL, 2), "barrier_init");
    check(pthread_create(&a, NULL, worker_a, NULL), "create_a");
    check(pthread_create(&b, NULL, worker_b, NULL), "create_b");
    check(pthread_join(a, NULL), "join_a");
    check(pthread_join(b, NULL), "join_b");
    check(pthread_barrier_destroy(&both_locked), "barrier_destroy");
    return 0;
}
