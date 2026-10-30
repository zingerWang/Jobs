#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unistd.h>

static char output_buffer[4096];
static void cleanup() { std::printf(" + atexit callback\n"); }

int main(int argc, char **argv) {
    if (argc != 2 || (std::strcmp(argv[1], "exit") != 0 &&
                      std::strcmp(argv[1], "_exit") != 0 &&
                      std::strcmp(argv[1], "abort") != 0)) {
        std::fprintf(stderr, "usage: %s exit|_exit|abort\n", argv[0]);
        return 1;
    }
    if (std::setvbuf(stdout, output_buffer, _IOFBF, sizeof output_buffer) != 0) {
        std::fputs("setvbuf failed\n", stderr);
        return 1;
    }
    if (std::atexit(cleanup) != 0) return 1;
    std::printf("buffered text");
    if (std::strcmp(argv[1], "exit") == 0) std::exit(7);
    if (std::strcmp(argv[1], "_exit") == 0) _exit(7);
    std::abort();
}
