#include "kv_store.h"

void KVStore::Put(const std::string& key, const std::string& value) {
    data_[key] = value;
}

std::optional<std::string> KVStore::Get(const std::string& key) const {
    auto it = data_.find(key);
    if (it == data_.end()) {
        return std::nullopt;
    }
    return it->second;
}

void KVStore::Delete(const std::string& key) {
    data_.erase(key);
}
