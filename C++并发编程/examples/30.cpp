#include <algorithm>
#include <cassert>
#include <execution>
#include <iostream>
#include <numeric>
#include <vector>
int main() {
    std::vector<int> input(1000),output(1000);
    std::iota(input.begin(),input.end(),1);
    std::transform(std::execution::par,input.begin(),input.end(),output.begin(),
                   [](int x) noexcept {return x*x;});
    for(std::size_t i=0;i<input.size();++i) assert(output[i]==input[i]*input[i]);
    auto sum=std::accumulate(output.begin(),output.end(),0LL);
    assert(sum==333833500);
    std::cout << sum << '\n';
}
