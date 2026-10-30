#include <cassert>
#include <iostream>
#include <thread>
thread_local int counter=0;
int increment() { return ++counter; }
int main() {
    int a=0,b=0;
    std::jthread x([&]{for(int i=0;i<3;++i) a=increment();});
    std::jthread y([&]{for(int i=0;i<3;++i) b=increment();});
    x.join(); y.join();
    int main_value=increment();
    assert(a==3 && b==3 && main_value==1);
    std::cout << a << ' ' << b << ' ' << main_value << '\n';
}
