#!/usr/bin/env python3
"""Local HTTP timing lab; Python 3.7+, standard library only."""

from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import threading
import time


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def do_GET(self):
        started = time.perf_counter()
        print(f"begin path={self.path} thread={threading.get_ident()}", flush=True)
        if self.path == "/slow":
            time.sleep(2)  # Application waiting, NOT simulated network latency.
            status, body = 200, b"slow: waited 2 seconds\n"
        elif self.path == "/fast":
            status, body = 200, b"fast: no deliberate wait\n"
        else:
            status, body = 404, b"try /fast or /slow\n"
        self.send_response(status)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Connection", "close")
        self.end_headers()
        self.close_connection = True
        try:
            self.wfile.write(body)
        except (BrokenPipeError, ConnectionResetError):
            print("client disconnected before response completed", flush=True)
        finally:
            print(f"end path={self.path} elapsed={time.perf_counter()-started:.6f}s",
                  flush=True)


if __name__ == "__main__":
    with ThreadingHTTPServer(("127.0.0.1", 18080), Handler) as server:
        print("Listening on http://127.0.0.1:18080; Ctrl+C to stop", flush=True)
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            pass
