CC      = cc
CFLAGS  = -Wall -Wextra -O2

all: tcp_server tcp_client

tcp_server: tcp_server.c
	$(CC) $(CFLAGS) -o $@ $<

tcp_client: tcp_client.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f tcp_server tcp_client

.PHONY: all clean
