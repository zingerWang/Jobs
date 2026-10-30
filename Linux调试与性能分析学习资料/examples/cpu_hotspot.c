#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#if defined(__GNUC__) || defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

/* Volatile prevents the teaching workload from being folded out at -O2.
 * The data is initialized once, then never modified. This is NOT a threading
 * synchronization technique. */
static volatile unsigned char data[32768];

static NOINLINE uint64_t checksum(void)
{
    uint64_t value = UINT64_C(14695981039346656037);
    for (size_t i = 0; i < sizeof(data); ++i) {
        value ^= data[i];
        value *= UINT64_C(1099511628211);
    }
    return value;
}

static double monotonic_seconds(void)
{
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
        perror("clock_gettime");
        exit(EXIT_FAILURE);
    }
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

int main(int argc, char **argv)
{
    uint64_t rounds = UINT64_C(20000);
    if (argc < 2 || argc > 3 ||
        (strcmp(argv[1], "baseline") != 0 && strcmp(argv[1], "cached") != 0)) {
        fprintf(stderr, "Usage: %s baseline|cached [rounds: 1..10000000]\n", argv[0]);
        return EXIT_FAILURE;
    }
    if (argc == 3) {
        char *end = NULL;
        errno = 0;
        unsigned long long parsed = strtoull(argv[2], &end, 10);
        if (argv[2][0] < '0' || argv[2][0] > '9' || errno != 0 ||
            end == argv[2] || *end != '\0' || parsed == 0 || parsed > 10000000ULL) {
            fprintf(stderr, "rounds must be an integer from 1 to 10000000\n");
            return EXIT_FAILURE;
        }
        rounds = (uint64_t)parsed;
    }

    for (size_t i = 0; i < sizeof(data); ++i)
        data[i] = (unsigned char)((i * 17U + 23U) & 255U);

    uint64_t result = 0;
    double start = monotonic_seconds();
    if (strcmp(argv[1], "baseline") == 0) {
        for (uint64_t i = 0; i < rounds; ++i)
            result += checksum() ^ i;
    } else {
        uint64_t saved = checksum();
        for (uint64_t i = 0; i < rounds; ++i)
            result += saved ^ i;
    }
    double elapsed = monotonic_seconds() - start;
    printf("mode=%s rounds=%" PRIu64 " result=%016" PRIx64
           " elapsed=%.6f s\n", argv[1], rounds, result, elapsed);
    return EXIT_SUCCESS;
}
