#ifndef TREE_BASICS_HPP
#define TREE_BASICS_HPP
#include <algorithm>
#include <climits>
#include <functional>
#include <memory>
#include <queue>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>
namespace study {
struct Node {
    int value;
    std::unique_ptr<Node> left, right;
    explicit Node(int x) : value(x) {}
};
using Tree = std::unique_ptr<Node>;
inline void insertBST(Tree& t, int x) {
    if (!t) t = std::make_unique<Node>(x);
    else if (x < t->value) insertBST(t->left, x);
    else if (x > t->value) insertBST(t->right, x); // 本章集合语义：忽略重复键
}
inline bool contains(const Node* t, int x) {
    while (t && t->value != x) t = x < t->value ? t->left.get() : t->right.get();
    return t != nullptr;
}
inline void eraseBST(Tree& t, int x) {
    if (!t) return;
    if (x < t->value) eraseBST(t->left, x);
    else if (x > t->value) eraseBST(t->right, x);
    else if (!t->left) { Tree old = std::move(t); t = std::move(old->right); }
    else if (!t->right) { Tree old = std::move(t); t = std::move(old->left); }
    else {
        Node* successor = t->right.get();
        while (successor->left) successor = successor->left.get();
        t->value = successor->value;
        eraseBST(t->right, successor->value);
    }
}
inline int height(const Node* t) { // 高度按结点层数：空树 0，叶子 1
    return t ? 1 + std::max(height(t->left.get()), height(t->right.get())) : 0;
}
inline int minDepth(const Node* t) {
    if (!t) return 0;
    if (!t->left) return 1 + minDepth(t->right.get());
    if (!t->right) return 1 + minDepth(t->left.get());
    return 1 + std::min(minDepth(t->left.get()), minDepth(t->right.get()));
}
inline std::vector<int> inorder(const Node* t) {
    std::vector<const Node*> stack;
    std::vector<int> result;
    while (t || !stack.empty()) {
        while (t) { stack.push_back(t); t = t->left.get(); }
        t = stack.back(); stack.pop_back();
        result.push_back(t->value); t = t->right.get();
    }
    return result;
}
inline std::vector<std::vector<int>> levels(const Node* root) {
    std::vector<std::vector<int>> result;
    if (!root) return result;
    std::queue<const Node*> q; q.push(root);
    while (!q.empty()) {
        int width = static_cast<int>(q.size());
        std::vector<int> line;
        while (width--) {
            auto t = q.front(); q.pop(); line.push_back(t->value);
            if (t->left) q.push(t->left.get());
            if (t->right) q.push(t->right.get());
        }
        result.push_back(std::move(line));
    }
    return result;
}
inline bool validBST(const Node* t, long long lo = LLONG_MIN, long long hi = LLONG_MAX) {
    if (!t) return true;
    return lo < t->value && t->value < hi &&
        validBST(t->left.get(), lo, t->value) && validBST(t->right.get(), t->value, hi);
}
inline int balancedHeight(const Node* t) { // -1 表示某处失衡
    if (!t) return 0;
    int l = balancedHeight(t->left.get()), r = balancedHeight(t->right.get());
    if (l < 0 || r < 0 || std::abs(l-r) > 1) return -1;
    return 1 + std::max(l,r);
}
inline void invert(Tree& t) {
    if (!t) return;
    std::swap(t->left,t->right); invert(t->left); invert(t->right);
}
inline bool mirror(const Node* a, const Node* b) {
    if (!a || !b) return a == b;
    return a->value == b->value && mirror(a->left.get(),b->right.get()) &&
        mirror(a->right.get(),b->left.get());
}
inline const Node* lca(const Node* t, const Node* a, const Node* b) {
    // 前提：a、b 都在树内。比较身份（指针），不比较结点值。
    if (!t || t == a || t == b) return t;
    auto l = lca(t->left.get(),a,b), r = lca(t->right.get(),a,b);
    return l && r ? t : (l ? l : r);
}
inline long long maxPathSum(const Node* root) {
    if (!root) throw std::invalid_argument("empty tree has no nonempty path");
    long long best = LLONG_MIN;
    std::function<long long(const Node*)> gain = [&](const Node* t) -> long long {
        if (!t) return 0;
        auto l = std::max(0LL,gain(t->left.get()));
        auto r = std::max(0LL,gain(t->right.get()));
        best = std::max(best,l+r+t->value); // 可转弯的完整路径
        return t->value + std::max(l,r);   // 给父亲只能交付一条分支
    };
    gain(root); return best;
}
inline long long rob(const Node* root) {
    std::function<std::pair<long long,long long>(const Node*)> dp = [&](const Node* t) {
        if (!t) return std::make_pair(0LL,0LL);
        auto [l0,l1] = dp(t->left.get()); auto [r0,r1] = dp(t->right.get());
        return std::make_pair(std::max(l0,l1)+std::max(r0,r1),t->value+l0+r0);
    };
    auto [skip,take] = dp(root); return std::max(skip,take);
}
inline Tree sortedToBST(const std::vector<int>& a, int l, int r) { // [l,r)，严格递增
    if (l == r) return nullptr;
    int m = l+(r-l)/2; Tree t = std::make_unique<Node>(a[m]);
    t->left = sortedToBST(a,l,m); t->right = sortedToBST(a,m+1,r); return t;
}
inline Tree rebuild(const std::vector<int>& pre, const std::vector<int>& in) {
    if (pre.size()!=in.size()) throw std::invalid_argument("size mismatch");
    std::unordered_map<int,int> pos;
    for (int i=0;i<static_cast<int>(in.size());++i)
        if (!pos.emplace(in[i],i).second) throw std::invalid_argument("duplicate key");
    std::size_t next=0;
    std::function<Tree(int,int)> build = [&](int l,int r)->Tree {
        if (l==r) return nullptr;
        if (next==pre.size()) throw std::invalid_argument("invalid preorder");
        int x=pre[next++]; auto it=pos.find(x);
        if (it==pos.end() || it->second<l || it->second>=r) throw std::invalid_argument("invalid traversal");
        Tree t=std::make_unique<Node>(x); int m=it->second;
        t->left=build(l,m); t->right=build(m+1,r); return t;
    };
    return build(0,static_cast<int>(in.size()));
}
inline std::string serialize(const Node* t) {
    if (!t) return "# ";
    return std::to_string(t->value)+" "+serialize(t->left.get())+serialize(t->right.get());
}
inline Tree deserialize(const std::string& text) {
    std::istringstream input(text);
    std::function<Tree()> read = [&]()->Tree {
        std::string token;
        if (!(input>>token)) throw std::invalid_argument("truncated tree");
        if (token=="#") return nullptr;
        std::size_t used=0; int x=std::stoi(token,&used);
        if (used!=token.size()) throw std::invalid_argument("invalid integer");
        Tree t=std::make_unique<Node>(x); t->left=read(); t->right=read(); return t;
    };
    Tree t=read(); std::string extra;
    if (input>>extra) throw std::invalid_argument("trailing tokens");
    return t;
}
} // namespace study
#endif
