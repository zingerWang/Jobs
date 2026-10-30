#include <cassert>
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <string>
const std::string& label() {
    static const std::string value="ready";
    return value;
}
int main(int argc,char** argv) {
    std::once_flag flag;
    const bool test_retry=argc>1 && std::string(argv[1])=="--retry";
    int attempts=0;
    std::string data;
    auto initialize=[&] {
        ++attempts;
        if(test_retry && attempts==1) throw std::runtime_error("retry");
        std::string prepared="complete";
        data=std::move(prepared);
    };
    try { std::call_once(flag,initialize); }
    catch(const std::runtime_error&) {}
    std::call_once(flag,initialize);
    std::call_once(flag,initialize);
    assert(attempts==(test_retry?2:1) && data=="complete");
    std::cout << label() << " attempts=" << attempts << '\n';
}
