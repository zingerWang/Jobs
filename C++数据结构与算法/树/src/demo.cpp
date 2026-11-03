#include "balanced.hpp"
#include "interval.hpp"
#include "tree_algorithms.hpp"
#include "special_trees.hpp"
#include <iostream>
int main() {
    study::AVL ordered;
    for(int key : {30,10,20,40}) ordered.insert(key);
    ordered.erase(10);
    std::cout << "contains 20: " << ordered.contains(20) << '\n';

    study::LazySegmentTree segment({2,1,3,4});
    segment.add(1,3,5); // [2,6,8,4]
    std::cout << "array sum: " << segment.query(0,4) << '\n';

    study::Graph graph(5);
    for(auto [u,v] : {std::pair{0,1}, {0,2}, {1,3}, {1,4}}) {
        graph[u].push_back(v);
        graph[v].push_back(u);
    }
    study::LCA lca(graph);
    std::cout << "LCA(3,4): " << lca.query(3,4) << '\n';
    study::HLD paths(graph,{1,2,3,4,5});
    std::cout << "path sum(3,2): " << paths.pathSum(3,2) << '\n';

    study::AhoCorasick ac;
    ac.insert("he"); ac.insert("she"); ac.insert("hers");
    ac.build();
    std::cout << "matches in ushers: " << ac.count("ushers") << '\n';
}
