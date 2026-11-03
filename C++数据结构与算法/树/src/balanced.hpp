#ifndef BALANCED_HPP
#define BALANCED_HPP
#include <algorithm>
#include <cstdint>
#include <random>
#include <stdexcept>
#include <vector>
namespace study {
// 结点池：0 表示空，不复用删除结点；避免教学代码中的裸指针所有权问题。
class AVL {
    struct N { int key=0, l=0, r=0, h=1; };
    std::vector<N> a{{}}; int root=0;
    int h(int p) const { return p ? a[p].h : 0; }
    void pull(int p) { a[p].h=1+std::max(h(a[p].l),h(a[p].r)); }
    int rotateRight(int p) {
        int q=a[p].l; a[p].l=a[q].r; a[q].r=p; pull(p); pull(q); return q;
    }
    int rotateLeft(int p) {
        int q=a[p].r; a[p].r=a[q].l; a[q].l=p; pull(p); pull(q); return q;
    }
    int fix(int p) {
        if (!p) return 0;
        pull(p);
        if (h(a[p].l)-h(a[p].r)>1) {
            int l=a[p].l;
            if (h(a[l].l)<h(a[l].r)) a[p].l=rotateLeft(l);
            return rotateRight(p);
        }
        if (h(a[p].r)-h(a[p].l)>1) {
            int r=a[p].r;
            if (h(a[r].r)<h(a[r].l)) a[p].r=rotateRight(r);
            return rotateLeft(p);
        }
        return p;
    }
    int put(int p,int x) {
        if (!p) { a.push_back({x,0,0,1}); return static_cast<int>(a.size())-1; }
        if (x<a[p].key) a[p].l=put(a[p].l,x);
        else if (x>a[p].key) a[p].r=put(a[p].r,x);
        return fix(p);
    }
    int remove(int p,int x) {
        if (!p) return 0;
        if (x<a[p].key) a[p].l=remove(a[p].l,x);
        else if (x>a[p].key) a[p].r=remove(a[p].r,x);
        else {
            if (!a[p].l || !a[p].r) return a[p].l ? a[p].l : a[p].r;
            int q=a[p].r; while(a[q].l) q=a[q].l;
            a[p].key=a[q].key; a[p].r=remove(a[p].r,a[q].key);
        }
        return fix(p);
    }
    int check(int p,long long lo,long long hi) const {
        if (!p) return 0;
        if (!(lo<a[p].key && a[p].key<hi)) throw std::logic_error("AVL ordering");
        int l=check(a[p].l,lo,a[p].key),r=check(a[p].r,a[p].key,hi);
        if (std::abs(l-r)>1 || a[p].h!=1+std::max(l,r)) throw std::logic_error("AVL height");
        return a[p].h;
    }
public:
    void insert(int x) { root=put(root,x); }
    void erase(int x) { root=remove(root,x); }
    bool contains(int x) const {
        int p=root; while(p && a[p].key!=x) p=x<a[p].key?a[p].l:a[p].r; return p!=0;
    }
    void validate() const { check(root,-(1LL<<60),1LL<<60); }
};

class Treap {
    struct N { int key=0,l=0,r=0; std::uint32_t priority=0; };
    std::vector<N> a{{}}; int root=0; std::mt19937 rng{20261029};
    int rotateRight(int p) { int q=a[p].l; a[p].l=a[q].r; a[q].r=p; return q; }
    int rotateLeft(int p) { int q=a[p].r; a[p].r=a[q].l; a[q].l=p; return q; }
    int put(int p,int x) {
        if (!p) { a.push_back({x,0,0,static_cast<std::uint32_t>(rng())}); return static_cast<int>(a.size())-1; }
        if (x<a[p].key) {
            a[p].l=put(a[p].l,x);
            if (a[a[p].l].priority<a[p].priority) p=rotateRight(p);
        } else if (x>a[p].key) {
            a[p].r=put(a[p].r,x);
            if (a[a[p].r].priority<a[p].priority) p=rotateLeft(p);
        }
        return p;
    }
    int merge(int l,int r) { // 前提：l 中所有键小于 r 中所有键
        if (!l || !r) return l?l:r;
        if (a[l].priority<=a[r].priority) { a[l].r=merge(a[l].r,r); return l; }
        a[r].l=merge(l,a[r].l); return r;
    }
    int remove(int p,int x) {
        if (!p) return 0;
        if (x==a[p].key) return merge(a[p].l,a[p].r);
        if (x<a[p].key) a[p].l=remove(a[p].l,x);
        else a[p].r=remove(a[p].r,x);
        return p;
    }
    void check(int p,long long lo,long long hi) const {
        if (!p) return;
        if (!(lo<a[p].key && a[p].key<hi)) throw std::logic_error("Treap ordering");
        for(int c:{a[p].l,a[p].r}) if(c && a[c].priority<a[p].priority) throw std::logic_error("Treap priority");
        check(a[p].l,lo,a[p].key); check(a[p].r,a[p].key,hi);
    }
public:
    void insert(int x) { root=put(root,x); }
    void erase(int x) { root=remove(root,x); }
    bool contains(int x) const { int p=root; while(p && a[p].key!=x) p=x<a[p].key?a[p].l:a[p].r; return p!=0; }
    void validate() const { check(root,-(1LL<<60),1LL<<60); }
};

class Splay {
    struct N { int key=0,parent=0,ch[2]={0,0}; };
    std::vector<N> a{{}}; int root=0;
    void rotate(int x) {
        int p=a[x].parent,g=a[p].parent,d=(a[p].ch[1]==x),b=a[x].ch[d^1];
        if(g) a[g].ch[a[g].ch[1]==p]=x; else root=x;
        a[x].parent=g; a[x].ch[d^1]=p; a[p].parent=x;
        a[p].ch[d]=b; if(b) a[b].parent=p;
    }
    void splay(int x) {
        while(a[x].parent) {
            int p=a[x].parent,g=a[p].parent;
            if(g) {
                bool same=(a[g].ch[1]==p)==(a[p].ch[1]==x);
                rotate(same?p:x); // zig-zig 或 zig-zag
            }
            rotate(x);
        }
    }
    void check(int p,int parent,long long lo,long long hi) const {
        if(!p) return;
        if(a[p].parent!=parent || !(lo<a[p].key && a[p].key<hi)) throw std::logic_error("Splay invariant");
        check(a[p].ch[0],p,lo,a[p].key); check(a[p].ch[1],p,a[p].key,hi);
    }
public:
    bool contains(int x) { // 查找本身也会改变树形
        int p=root,last=0;
        while(p && a[p].key!=x) { last=p; p=a[p].ch[x>a[p].key]; }
        if(p) splay(p); else if(last) splay(last);
        return p!=0;
    }
    void insert(int x) {
        if(!root) { a.push_back({x,0,{0,0}}); root=static_cast<int>(a.size())-1; return; }
        if(contains(x)) return;
        int p=root;
        while(a[p].ch[x>a[p].key]) p=a[p].ch[x>a[p].key];
        int id=static_cast<int>(a.size()); a.push_back({x,p,{0,0}});
        a[p].ch[x>a[p].key]=id; splay(id);
    }
    void erase(int x) {
        if(!contains(x)) return;
        int l=a[root].ch[0],r=a[root].ch[1];
        if(l) a[l].parent=0;
        if(r) a[r].parent=0;
        root=l;
        if(!l) { root=r; return; }
        int p=l; while(a[p].ch[1]) p=a[p].ch[1];
        splay(p); a[root].ch[1]=r; if(r) a[r].parent=root;
    }
    void validate() const { check(root,0,-(1LL<<60),1LL<<60); }
};

// 左倾红黑树 LLRB：采用额外的“红链接左倾”约束，完整支持集合插入和删除。
// 这是红黑树的一个变体；不要把它的修复顺序与经典父指针版本混用。
class RedBlack {
    struct N { int key=0,l=0,r=0; bool red=false; };
    std::vector<N> a{{}}; int root=0;
    bool red(int p) const { return p && a[p].red; }
    int left(int p) {
        int q=a[p].r; a[p].r=a[q].l; a[q].l=p;
        a[q].red=a[p].red; a[p].red=true; return q;
    }
    int right(int p) {
        int q=a[p].l; a[p].l=a[q].r; a[q].r=p;
        a[q].red=a[p].red; a[p].red=true; return q;
    }
    void flip(int p) {
        a[p].red=!a[p].red;
        if(a[p].l) a[a[p].l].red=!a[a[p].l].red;
        if(a[p].r) a[a[p].r].red=!a[a[p].r].red;
    }
    int fix(int p) {
        if(red(a[p].r)) p=left(p);
        if(red(a[p].l) && red(a[a[p].l].l)) p=right(p);
        if(red(a[p].l) && red(a[p].r)) flip(p);
        return p;
    }
    int moveRedLeft(int p) {
        flip(p);
        if(red(a[a[p].r].l)) {
            a[p].r=right(a[p].r); p=left(p); flip(p);
        }
        return p;
    }
    int moveRedRight(int p) {
        flip(p);
        if(red(a[a[p].l].l)) { p=right(p); flip(p); }
        return p;
    }
    int put(int p,int x) {
        if(!p) { a.push_back({x,0,0,true}); return static_cast<int>(a.size())-1; }
        if(x<a[p].key) a[p].l=put(a[p].l,x);
        else if(x>a[p].key) a[p].r=put(a[p].r,x);
        return fix(p);
    }
    int removeMin(int p) {
        if(!a[p].l) return 0;
        if(!red(a[p].l) && !red(a[a[p].l].l)) p=moveRedLeft(p);
        a[p].l=removeMin(a[p].l); return fix(p);
    }
    int remove(int p,int x) { // 入口已确认 x 存在
        if(x<a[p].key) {
            if(!red(a[p].l) && !red(a[a[p].l].l)) p=moveRedLeft(p);
            a[p].l=remove(a[p].l,x);
        } else {
            if(red(a[p].l)) p=right(p);
            if(x==a[p].key && !a[p].r) return 0;
            if(!red(a[p].r) && !red(a[a[p].r].l)) p=moveRedRight(p);
            if(x==a[p].key) {
                int q=a[p].r; while(a[q].l) q=a[q].l;
                a[p].key=a[q].key; a[p].r=removeMin(a[p].r);
            } else a[p].r=remove(a[p].r,x);
        }
        return fix(p);
    }
    int check(int p,long long lo,long long hi) const {
        if(!p) return 1; // NIL 计为一个黑结点
        if(!(lo<a[p].key && a[p].key<hi)) throw std::logic_error("RB ordering");
        if(red(a[p].r) || (red(p) && (red(a[p].l)||red(a[p].r)))) throw std::logic_error("RB color");
        int l=check(a[p].l,lo,a[p].key),r=check(a[p].r,a[p].key,hi);
        if(l!=r) throw std::logic_error("RB black height");
        return l+(!red(p));
    }
public:
    void insert(int x) { root=put(root,x); a[root].red=false; }
    bool contains(int x) const { int p=root; while(p && a[p].key!=x) p=x<a[p].key?a[p].l:a[p].r; return p!=0; }
    void erase(int x) {
        if(!contains(x)) return;
        if(!red(a[root].l) && !red(a[root].r)) a[root].red=true;
        root=remove(root,x); if(root) a[root].red=false;
    }
    void validate() const {
        if(red(root)) throw std::logic_error("red root");
        check(root,-(1LL<<60),1LL<<60);
    }
};
} // namespace study
#endif
