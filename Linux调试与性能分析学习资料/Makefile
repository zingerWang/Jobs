CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -g -O0
PROGRAMS = crash crash_fixed deadlock deadlock_fixed cpu_hotspot

.PHONY: all check
all: $(PROGRAMS)

crash: examples/crash.c
	$(CC) $(CFLAGS) $< -o $@
crash_fixed: examples/crash_fixed.c
	$(CC) $(CFLAGS) $< -o $@
deadlock: examples/deadlock.c
	$(CC) $(CFLAGS) -pthread $< -o $@
deadlock_fixed: examples/deadlock_fixed.c
	$(CC) $(CFLAGS) -pthread $< -o $@
cpu_hotspot: examples/cpu_hotspot.c
	$(CC) -std=c11 -Wall -Wextra -g -O2 -fno-omit-frame-pointer $< -o $@

check: all
	./crash_fixed 1
	@./crash_fixed 404; result=$$?; test "$$result" -eq 2
	./deadlock_fixed
	@a=$$(./cpu_hotspot baseline 1000 | sed -n 's/.*result=\([^ ]*\).*/\1/p'); b=$$(./cpu_hotspot cached 1000 | sed -n 's/.*result=\([^ ]*\).*/\1/p'); test -n "$$a" && test "$$a" = "$$b" && echo "CPU results match: $$a"
