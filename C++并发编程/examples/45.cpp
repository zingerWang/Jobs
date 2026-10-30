#include <algorithm>
#include <cassert>
#include <chrono>
#include <cstddef>
#include <iostream>
#include <numeric>
#include <string>
#include <thread>
#include <vector>
using Clock=std::chrono::steady_clock;
long long serial(const std::vector<int>& v){return std::accumulate(v.begin(),v.end(),0LL);}
long long parallel(const std::vector<int>& v){
    auto mid=v.begin()+static_cast<std::ptrdiff_t>(v.size()/2);
    long long left=0;
    std::thread worker([&]{left=std::accumulate(v.begin(),mid,0LL);});
    auto right=std::accumulate(mid,v.end(),0LL);
    worker.join();return left+right;
}
int main(int argc,char** argv){
    std::size_t n=argc>1?std::stoull(argv[1]):1000000;
    if(n==0 || n>100000000) return 2;
    std::vector<int> data(n);
    for(std::size_t i=0;i<n;++i) data[i]=static_cast<int>(i%101);
    auto expected=serial(data);assert(parallel(data)==expected);
    std::vector<double> s,p;
    auto measure=[&](auto function){
        auto begin=Clock::now();auto value=function(data);auto end=Clock::now();
        assert(value==expected);
        return std::chrono::duration<double,std::micro>(end-begin).count();
    };
    for(int round=0;round<9;++round){
        if(round%2==0){s.push_back(measure(serial));p.push_back(measure(parallel));}
        else{p.push_back(measure(parallel));s.push_back(measure(serial));}
    }
    std::sort(s.begin(),s.end());std::sort(p.begin(),p.end());
    std::cout<<"n="<<n<<" checksum="<<expected<<'\n';
    std::cout<<"serial_median_us="<<s[4]<<" parallel_median_us="<<p[4]<<'\n';
    std::cout<<"serial_range="<<s.front()<<".."<<s.back()
             <<" parallel_range="<<p.front()<<".."<<p.back()<<'\n';
}
