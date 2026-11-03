#ifndef SPECIAL_TREES_HPP
#define SPECIAL_TREES_HPP
#include <algorithm>
#include <array>
#include <cmath>
#include <functional>
#include <limits>
#include <memory>
#include <numeric>
#include <queue>
#include <stdexcept>
#include <string>
#include <vector>
namespace study {
class MinHeap {
    std::vector<int> a;
    void down(int i) {
        int n=static_cast<int>(a.size());
        while(2*i+1<n) {
            int c=2*i+1; if(c+1<n && a[c+1]<a[c]) ++c;
            if(a[i]<=a[c]) break;
            std::swap(a[i],a[c]); i=c;
        }
    }
public:
    explicit MinHeap(std::vector<int> values={}):a(std::move(values)) {
        for(int i=static_cast<int>(a.size())/2-1;i>=0;--i) down(i);
    }
    bool empty() const { return a.empty(); }
    int top() const { if(empty()) throw std::out_of_range("empty heap"); return a[0]; }
    void push(int x) {
        a.push_back(x); int i=static_cast<int>(a.size())-1;
        while(i>0 && a[i]<a[(i-1)/2]) { std::swap(a[i],a[(i-1)/2]); i=(i-1)/2; }
    }
    void pop() {
        if(empty()) throw std::out_of_range("empty heap");
        a[0]=a.back(); a.pop_back(); if(!empty()) down(0);
    }
};
class DSU {
    std::vector<int> parent,size;
public:
    explicit DSU(int n):parent(n),size(n,1) { std::iota(parent.begin(),parent.end(),0); }
    int find(int x) {
        while(x!=parent[x]) { parent[x]=parent[parent[x]]; x=parent[x]; }
        return x;
    }
    bool unite(int x,int y) {
        x=find(x); y=find(y); if(x==y) return false;
        if(size[x]<size[y]) std::swap(x,y);
        parent[y]=x; size[x]+=size[y]; return true;
    }
};
class Trie {
    struct N { std::array<int,26> next{}; int pass=0,end=0; };
    std::vector<N> a{{}};
    static void check(const std::string& s) {
        for(char c:s) if(c<'a'||c>'z') throw std::invalid_argument("lowercase a-z only");
    }
public:
    void insert(const std::string& s) {
        check(s); int p=0; ++a[p].pass;
        for(char c:s) {
            int x=c-'a';
            if(!a[p].next[x]) { int id=static_cast<int>(a.size()); a.push_back({}); a[p].next[x]=id; }
            p=a[p].next[x]; ++a[p].pass;
        }
        ++a[p].end;
    }
    int prefixCount(const std::string& s) const {
        check(s); int p=0;
        for(char c:s) { p=a[p].next[c-'a']; if(!p) return 0; }
        return a[p].pass;
    }
    int count(const std::string& s) const {
        check(s); int p=0;
        for(char c:s) { p=a[p].next[c-'a']; if(!p) return 0; }
        return a[p].end;
    }
    bool erase(const std::string& s) {
        if(!count(s)) return false;
        int p=0; --a[p].pass;
        for(char c:s) { p=a[p].next[c-'a']; --a[p].pass; }
        --a[p].end; return true; // 结点池保留，计数归零表示没有有效单词
    }
};
class AhoCorasick {
    struct N { std::array<int,26> go{}; int fail=0; long long out=0; };
    std::vector<N> a{{}}; bool built=false;
public:
    void insert(const std::string& s) {
        if(built || s.empty()) throw std::invalid_argument("insert nonempty patterns before build");
        for(char c:s) if(c<'a'||c>'z') throw std::invalid_argument("lowercase patterns only");
        int p=0;
        for(char c:s) {
            int x=c-'a';
            if(!a[p].go[x]) { int id=static_cast<int>(a.size()); a.push_back({}); a[p].go[x]=id; }
            p=a[p].go[x];
        }
        ++a[p].out;
    }
    void build() {
        if(built) throw std::logic_error("build once");
        std::queue<int> q;
        for(int x=0;x<26;++x) if(a[0].go[x]) q.push(a[0].go[x]);
        while(!q.empty()) {
            int u=q.front(); q.pop(); a[u].out+=a[a[u].fail].out;
            for(int x=0;x<26;++x) {
                int v=a[u].go[x];
                if(v) { a[v].fail=a[a[u].fail].go[x]; q.push(v); }
                else a[u].go[x]=a[a[u].fail].go[x];
            }
        }
        built=true;
    }
    long long count(const std::string& text) const {
        if(!built) throw std::logic_error("build first");
        long long answer=0; int p=0;
        for(char c:text) {
            if(c<'a'||c>'z') { p=0; continue; } // 非字母视为分隔符
            p=a[p].go[c-'a']; answer+=a[p].out;
        }
        return answer; // 重叠匹配计数，重复插入的模式串按次数计数
    }
};
struct HuffmanResult { long long wpl=0; std::vector<std::string> codes; };
inline HuffmanResult huffman(const std::vector<long long>& weights) {
    struct N { long long w; int l=-1,r=-1,symbol=-1; };
    std::vector<N> a;
    using Item=std::pair<long long,int>;
    std::priority_queue<Item,std::vector<Item>,std::greater<Item>> q;
    for(int i=0;i<static_cast<int>(weights.size());++i) {
        if(weights[i]<0) throw std::invalid_argument("negative weight");
        a.push_back({weights[i],-1,-1,i}); q.push({weights[i],i});
    }
    HuffmanResult result; result.codes.resize(weights.size());
    if(q.empty()) return result;
    while(q.size()>1) {
        auto [w1,l]=q.top(); q.pop(); auto [w2,r]=q.top(); q.pop();
        int id=static_cast<int>(a.size()); a.push_back({w1+w2,l,r,-1});
        result.wpl+=w1+w2; q.push({w1+w2,id});
    }
    std::function<void(int,std::string)> dfs=[&](int u,std::string path) {
        if(a[u].symbol>=0) { result.codes[a[u].symbol]=path.empty()?"0":path; return; }
        dfs(a[u].l,path+'0'); dfs(a[u].r,path+'1');
    };
    dfs(q.top().second,""); return result;
}

// 静态二维 KD-Tree：中位数建树；返回最近点的距离平方。
class KDTree {
public:
    using Point=std::array<double,2>;
private:
    struct N { Point p; int left=-1,right=-1,axis=0; };
    std::vector<N> nodes; int root=-1;
    int build(std::vector<Point>& pts,int l,int r,int depth) {
        if(l==r) return -1;
        int m=(l+r)/2,d=depth%2;
        std::nth_element(pts.begin()+l,pts.begin()+m,pts.begin()+r,[d](const Point& x,const Point& y){ return x[d]<y[d]; });
        int id=static_cast<int>(nodes.size()); nodes.push_back({pts[m],-1,-1,d});
        int left=build(pts,l,m,depth+1),right=build(pts,m+1,r,depth+1);
        nodes[id].left=left; nodes[id].right=right; return id;
    }
    void search(int u,const Point& target,double& best) const {
        if(u<0) return;
        const auto& n=nodes[u];
        double dx=target[0]-n.p[0],dy=target[1]-n.p[1]; best=std::min(best,dx*dx+dy*dy);
        double delta=target[n.axis]-n.p[n.axis];
        int near=delta<0?n.left:n.right,far=delta<0?n.right:n.left;
        search(near,target,best);
        if(delta*delta<best) search(far,target,best);
    }
public:
    explicit KDTree(std::vector<Point> pts) { root=build(pts,0,static_cast<int>(pts.size()),0); }
    double nearestSquared(const Point& q) const {
        double best=std::numeric_limits<double>::infinity(); search(root,q,best); return best;
    }
};

// 最小度数 t=2 的 B 树。此示例覆盖插入、查找和分裂；每个结点最多 3 个键。
class BTree {
    struct N { bool leaf; std::vector<int> keys; std::vector<std::unique_ptr<N>> children; explicit N(bool l):leaf(l) {} };
    std::unique_ptr<N> root=std::make_unique<N>(true);
    void split(N* p,int i) {
        N* y=p->children[i].get(); auto z=std::make_unique<N>(y->leaf);
        int middle=y->keys[1]; z->keys.push_back(y->keys[2]); y->keys.resize(1);
        if(!y->leaf) {
            z->children.push_back(std::move(y->children[2])); z->children.push_back(std::move(y->children[3]));
            y->children.resize(2);
        }
        p->keys.insert(p->keys.begin()+i,middle);
        p->children.insert(p->children.begin()+i+1,std::move(z));
    }
    void put(N* p,int x) {
        int i=static_cast<int>(std::lower_bound(p->keys.begin(),p->keys.end(),x)-p->keys.begin());
        if(p->leaf) { p->keys.insert(p->keys.begin()+i,x); return; }
        if(p->children[i]->keys.size()==3) { split(p,i); if(x>p->keys[i]) ++i; }
        put(p->children[i].get(),x);
    }
public:
    bool contains(int x) const {
        const N* p=root.get();
        while(p) {
            int i=static_cast<int>(std::lower_bound(p->keys.begin(),p->keys.end(),x)-p->keys.begin());
            if(i<static_cast<int>(p->keys.size()) && p->keys[i]==x) return true;
            p=p->leaf?nullptr:p->children[i].get();
        }
        return false;
    }
    void insert(int x) {
        if(contains(x)) return;
        if(root->keys.size()==3) {
            auto p=std::make_unique<N>(false); p->children.push_back(std::move(root)); root=std::move(p); split(root.get(),0);
        }
        put(root.get(),x);
    }
};

// B+ 树：记录简化为整数键；内结点只含分隔键。最多 3 键，叶子形成单链表。
class BPlusTree {
    struct N { bool leaf=true; std::vector<int> keys,children; int next=-1; };
    struct Split { bool happened=false; int separator=0,right=-1; };
    std::vector<N> a{N{}}; int root=0;
    Split put(int p,int x) {
        if(a[p].leaf) {
            auto it=std::lower_bound(a[p].keys.begin(),a[p].keys.end(),x);
            if(it!=a[p].keys.end() && *it==x) return {};
            a[p].keys.insert(it,x);
        } else {
            int i=static_cast<int>(std::upper_bound(a[p].keys.begin(),a[p].keys.end(),x)-a[p].keys.begin());
            Split s=put(a[p].children[i],x);
            if(s.happened) {
                a[p].keys.insert(a[p].keys.begin()+i,s.separator);
                a[p].children.insert(a[p].children.begin()+i+1,s.right);
            }
        }
        if(a[p].keys.size()<=3) return {};
        int q=static_cast<int>(a.size()); N right; right.leaf=a[p].leaf;
        int separator=a[p].keys[2];
        if(a[p].leaf) {
            right.keys.assign(a[p].keys.begin()+2,a[p].keys.end());
            right.next=a[p].next; a[p].next=q; a[p].keys.resize(2);
        } else {
            right.keys.assign(a[p].keys.begin()+3,a[p].keys.end());
            right.children.assign(a[p].children.begin()+3,a[p].children.end());
            a[p].keys.resize(2); a[p].children.resize(3);
        }
        a.push_back(std::move(right)); return {true,separator,q};
    }
    int leafFor(int x) const {
        int p=root;
        while(!a[p].leaf) {
            auto i=std::upper_bound(a[p].keys.begin(),a[p].keys.end(),x)-a[p].keys.begin();
            p=a[p].children[i];
        }
        return p;
    }
public:
    void insert(int x) {
        Split s=put(root,x);
        if(s.happened) {
            N n; n.leaf=false; n.keys={s.separator}; n.children={root,s.right};
            root=static_cast<int>(a.size()); a.push_back(std::move(n));
        }
    }
    bool contains(int x) const { const auto& k=a[leafFor(x)].keys; return std::binary_search(k.begin(),k.end(),x); }
    std::vector<int> range(int lo,int hi) const { // 闭区间 [lo,hi]
        std::vector<int> answer; if(lo>hi) return answer;
        for(int p=leafFor(lo);p!=-1;p=a[p].next) for(int x:a[p].keys) {
            if(x>hi) return answer;
            if(x>=lo) answer.push_back(x);
        }
        return answer;
    }
};
} // namespace study
#endif
