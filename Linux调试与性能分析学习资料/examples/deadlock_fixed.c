#define _XOPEN_SOURCE 700
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;
static long completed = 0;

static void check(int rc, const char *operation)
{
    if (rc != 0) {
        fprintf(stderr, "%s: %s\n", operation, strerror(rc));
        exit(EXIT_FAILURE);
    }
}

static void *worker(void *unused)
{
    (void)unused;
    for (int i = 0; i < 20000; ++i) {
        /* Every worker uses the same order: A first, then B. */
        check(pthread_mutex_lock(&lock_a), "lock_a");
        check(pthread_mutex_lock(&lock_b), "lock_b");
        ++completed;
        check(pthread_mutex_unlock(&lock_b), "unlock_b");
        check(pthread_mutex_unlock(&lock_a), "unlock_a");
    }
    return NULL;
}

int main(void)
{
    pthread_t a, b;
    /* Do not keep the old barrier while a worker holds lock_a. */
    check(pthread_create(&a, NULL, worker, NULL), "create_a");
    check(pthread_create(&b, NULL, worker, NULL), "create_b");
    check(pthread_join(a, NULL), "join_a");
    check(pthread_join(b, NULL), "join_b");
    printf("completed=%ld (expected 40000)\n", completed);
    return completed == 40000 ? 0 : 1;
}
