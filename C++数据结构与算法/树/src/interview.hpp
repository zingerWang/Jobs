#ifndef INTERVIEW_HPP
#define INTERVIEW_HPP
#include "tree_basics.hpp"
#include <cstdint>
#include <optional>
namespace study {
inline std::vector<int> preorder(const Node* t) {
    if(!t) return {};
    std::vector<int> answer; std::vector<const Node*> stack{t};
    while(!stack.empty()) {
        t=stack.back(); stack.pop_back(); answer.push_back(t->value);
        if(t->right) stack.push_back(t->right.get());
        if(t->left) stack.push_back(t->left.get());
    }
    return answer;
}
inline std::vector<int> postorder(const Node* root) {
    std::vector<int> answer; std::vector<const Node*> stack;
    const Node* current=root; const Node* last=nullptr;
    while(current || !stack.empty()) {
        if(current) { stack.push_back(current); current=current->left.get(); }
        else {
            const Node* t=stack.back();
            if(t->right && last!=t->right.get()) current=t->right.get();
            else { answer.push_back(t->value); last=t; stack.pop_back(); }
        }
    }
    return answer;
}
inline int nodeCount(const Node* t) { return t?1+nodeCount(t->left.get())+nodeCount(t->right.get()):0; }
inline int leafCount(const Node* t) {
    if(!t) return 0;
    if(!t->left && !t->right) return 1;
    return leafCount(t->left.get())+leafCount(t->right.get());
}
inline std::uint64_t completeCount(const Node* t) { // 前提：完全二叉树，总结点数可用 uint64_t 表示
    if(!t) return 0;
    int l=0,r=0;
    for(auto p=t;p;p=p->left.get()) ++l;
    for(auto p=t;p;p=p->right.get()) ++r;
    if(l==r) {
        if(l>=64) throw std::overflow_error("height too large for this shortcut");
        return (std::uint64_t{1}<<l)-1;
    }
    return 1+completeCount(t->left.get())+completeCount(t->right.get());
}
inline bool hasPathSum(const Node* t,long long target) {
    if(!t) return false;
    if(!t->left && !t->right) return target==t->value;
    return hasPathSum(t->left.get(),target-t->value)||hasPathSum(t->right.get(),target-t->value);
}
inline std::vector<std::vector<int>> rootLeafPaths(const Node* root) {
    std::vector<std::vector<int>> answer; std::vector<int> path;
    std::function<void(const Node*)> dfs=[&](const Node* t) {
        if(!t) return;
        path.push_back(t->value);
        if(!t->left && !t->right) answer.push_back(path);
        else { dfs(t->left.get()); dfs(t->right.get()); }
        path.pop_back(); // 恢复现场，避免兄弟路径混在一起
    };
    dfs(root); return answer;
}
inline std::vector<int> rightView(const Node* root) {
    std::vector<int> answer; for(const auto& line:levels(root)) answer.push_back(line.back()); return answer;
}
inline std::vector<std::vector<int>> zigzag(const Node* root) {
    auto lines=levels(root);
    for(std::size_t i=1;i<lines.size();i+=2) std::reverse(lines[i].begin(),lines[i].end());
    return lines;
}
inline std::optional<int> kthSmallest(const Node* t,int k) {
    if(k<=0) return std::nullopt;
    std::vector<const Node*> stack;
    while(t || !stack.empty()) {
        while(t) { stack.push_back(t); t=t->left.get(); }
        t=stack.back(); stack.pop_back();
        if(--k==0) return t->value;
        t=t->right.get();
    }
    return std::nullopt;
}
inline std::optional<int> predecessor(const Node* t,int x) {
    std::optional<int> best;
    while(t) {
        if(t->value<x) { best=t->value; t=t->right.get(); }
        else t=t->left.get();
    }
    return best;
}
inline std::optional<int> successor(const Node* t,int x) {
    std::optional<int> best;
    while(t) {
        if(t->value>x) { best=t->value; t=t->left.get(); }
        else t=t->right.get();
    }
    return best;
}
inline const Node* lcaBST(const Node* t,int x,int y) { // 前提：x、y 均存在
    if(x>y) std::swap(x,y);
    while(t) {
        if(y<t->value) t=t->left.get();
        else if(x>t->value) t=t->right.get();
        else return t;
    }
    return nullptr;
}
struct RawNode { int value; RawNode* left=nullptr; RawNode* right=nullptr; };
template<class Visit> void morrisInorder(RawNode* current,Visit visit) {
    // 非拥有型指针；visit 必须不抛异常，且不得改变或销毁树。
    while(current) {
        if(!current->left) { visit(current->value); current=current->right; }
        else {
            RawNode* predecessor=current->left;
            while(predecessor->right && predecessor->right!=current) predecessor=predecessor->right;
            if(!predecessor->right) { predecessor->right=current; current=current->left; }
            else { predecessor->right=nullptr; visit(current->value); current=current->right; }
        }
    }
}
} // namespace study
#endif
