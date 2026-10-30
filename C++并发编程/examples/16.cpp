#include <cassert>
#include <iostream>
#include <map>
#include <mutex>
#include <optional>
#include <shared_mutex>
#include <string>
class Cache {
    mutable std::shared_mutex mutex_;
    std::map<int,std::string> data_;
public:
    void put(int key,std::string value) {
        std::unique_lock<std::shared_mutex> lock(mutex_);
        data_.insert_or_assign(key,std::move(value));
    }
    std::optional<std::string> get(int key) const {
        std::shared_lock<std::shared_mutex> lock(mutex_);
        auto it=data_.find(key);
        if(it==data_.end()) return std::nullopt;
        return it->second;
    }
};
int main() {
    Cache cache; cache.put(1,"config");
    auto value=cache.get(1);
    assert(value && *value=="config" && !cache.get(2));
    std::cout << *value << '\n';
}
