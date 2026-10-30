#include "async_logger.hpp"
#include <cassert>
#include <future>
#include <iostream>
int main(){
    AsyncLogger logger("async-demo.log",32,16);
    auto produce=[&](int first){
        for(int i=0;i<1000;++i)
            if(!logger.log(std::to_string(first+i))) throw std::runtime_error("unexpected close");
    };
    auto a=std::async(std::launch::async,produce,0);
    auto b=std::async(std::launch::async,produce,1000);
    a.get();b.get();
    auto stats=logger.close();
    assert(stats.first==2000 && stats.second==2000);
    assert(!logger.log("after close"));
    std::ifstream input("async-demo.log");
    assert(input.is_open());
    std::vector<bool> seen(2000,false);
    std::string line;std::size_t count=0;
    while(std::getline(input,line)){
        int id=std::stoi(line);
        assert(id>=0 && id<2000 && !seen[static_cast<std::size_t>(id)]);
        seen[static_cast<std::size_t>(id)]=true;++count;
    }
    assert(input.eof() && count==2000);
    std::cout<<"accepted="<<stats.first<<" written="<<stats.second<<" unique="<<count<<'\n';
}
