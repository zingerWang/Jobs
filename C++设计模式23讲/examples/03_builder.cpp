#include <cassert>
#include <iostream>
#include <stdexcept>
#include <string>
#include <utility>

struct Request { std::string url; std::string method; int timeoutMs; };
class RequestBuilder {
    Request request_;
public:
    explicit RequestBuilder(std::string url) : request_{std::move(url), "GET", 3000} {
        if (request_.url.empty()) throw std::invalid_argument("empty URL");
    }
    RequestBuilder& timeout(int milliseconds) {
        if (milliseconds <= 0) throw std::invalid_argument("invalid timeout");
        request_.timeoutMs = milliseconds;
        return *this;
    }
    RequestBuilder& method(std::string value) {
        if (value != "GET" && value != "POST") throw std::invalid_argument("unsupported method");
        request_.method = std::move(value);
        return *this;
    }
    Request build() const { return request_; }
};
int main() {
    auto request = RequestBuilder("/orders").timeout(1000).method("GET").build();
    assert(request.url == "/orders" && request.timeoutMs == 1000);
    std::cout << request.method << ' ' << request.url << " timeout=" << request.timeoutMs << '\n';
    bool rejected = false;
    try { RequestBuilder("/orders").timeout(0); }
    catch (const std::invalid_argument&) { rejected = true; }
    assert(rejected);
    std::cout << "invalid timeout rejected\n";
}
