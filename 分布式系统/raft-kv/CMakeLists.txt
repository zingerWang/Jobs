cmake_minimum_required(VERSION 3.16)
project(raft_kv CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Threads REQUIRED)

add_executable(kv_server
    src/main.cpp
    src/kv_store.cpp
    src/raft.cpp
)

target_link_libraries(kv_server PRIVATE Threads::Threads)
