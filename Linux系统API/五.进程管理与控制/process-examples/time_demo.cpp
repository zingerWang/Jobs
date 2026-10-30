#define _POSIX_C_SOURCE 200809L
#include <cerrno>
#include <cstdio>
#include <cstring>
#include <ctime>

static double seconds_between(const timespec &a, const timespec &b) {
    return static_cast<double>(b.tv_sec - a.tv_sec)
         + static_cast<double>(b.tv_nsec - a.tv_nsec) / 1000000000.0;
}

int main() {
    time_t now = time(nullptr);
    if (now == static_cast<time_t>(-1)) { std::perror("time"); return 1; }
    std::printf("epoch seconds=%lld\n", static_cast<long long>(now));
    timespec resolution{}, begin{}, cpu_begin{};
    if (clock_getres(CLOCK_MONOTONIC, &resolution) == -1 ||
        clock_gettime(CLOCK_MONOTONIC, &begin) == -1 ||
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &cpu_begin) == -1) {
        std::perror("read clock");
        return 1;
    }
    std::printf("reported resolution=%lld s + %ld ns\n",
        static_cast<long long>(resolution.tv_sec), resolution.tv_nsec);
    timespec deadline = begin;
    for (int i = 1; i <= 3; ++i) {
        // 始终推进原定时间表；没有改成“实际醒来时间 + 周期”。
        deadline.tv_nsec += 200000000L;
        if (deadline.tv_nsec >= 1000000000L) {
            ++deadline.tv_sec;
            deadline.tv_nsec -= 1000000000L;
        }
        int error;
        do {
            error = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME,
                                    &deadline, nullptr);
        } while (error == EINTR);
        if (error != 0) {
            std::fprintf(stderr, "clock_nanosleep: %s\n", std::strerror(error));
            return 1;
        }
        timespec observed{};
        if (clock_gettime(CLOCK_MONOTONIC, &observed) == -1) {
            std::perror("clock_gettime"); return 1;
        }
        std::printf("tick=%d elapsed=%.6f s\n", i, seconds_between(begin, observed));
    }
    timespec end{}, cpu_end{};
    if (clock_gettime(CLOCK_MONOTONIC, &end) == -1 ||
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &cpu_end) == -1) {
        std::perror("clock_gettime"); return 1;
    }
    std::printf("elapsed=%.6f s CPU=%.6f s\n",
        seconds_between(begin, end), seconds_between(cpu_begin, cpu_end));
    return 0;
}
