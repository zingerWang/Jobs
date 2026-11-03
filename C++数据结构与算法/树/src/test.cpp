#include "tree_basics.hpp"
#include "interview.hpp"
#include "balanced.hpp"
#include "interval.hpp"
#include "tree_algorithms.hpp"
#include "special_trees.hpp"
#include <cassert>
#include <iostream>
#include <random>
#include <set>
using namespace study;
std::mt19937 rng(20261029);
int draw(int n) { return static_cast<int>(rng()%n); }
template<class T> void orderedTest(const char* name) {
    T t; std::set<int> reference;
    for(int i=0;i<5000;++i) {
        int x=draw(301)-150;
        if(draw(2)) { t.insert(x); reference.insert(x); }
        else { t.erase(x); reference.erase(x); }
        t.validate();
        for(int j=0;j<5;++j) { int key=draw(301)-150; assert(t.contains(key)==(reference.count(key)>0)); }
        t.validate();
    }
    for(int x:reference) { t.erase(x); t.validate(); assert(!t.contains(x)); }
    for(int i=0;i<500;++i) { t.insert(i); t.validate(); }
    for(int i=499;i>=0;--i) { t.erase(i); t.validate(); }
    std::cout<<name<<": passed\n";
}
void basicTest() {
    Tree t;
    for(int x:{8,3,10,1,6,14,4,7,13}) insertBST(t,x);
    assert(validBST(t.get()) && contains(t.get(),7));
    assert(inorder(t.get())==std::vector<int>({1,3,4,6,7,8,10,13,14}));
    auto copy=deserialize(serialize(t.get())); assert(inorder(copy.get())==inorder(t.get()));
    assert(height(t.get())==4 && minDepth(t.get())==3);
    assert(lca(t.get(),t->left->left.get(),t->left->right.get())==t->left.get());
    eraseBST(t,8); assert(validBST(t.get()) && !contains(t.get(),8));
    auto r=rebuild({3,9,20,15,7},{9,3,15,20,7});
    assert(levels(r.get())==std::vector<std::vector<int>>({{3},{9,20},{15,7}}));
    assert(maxPathSum(r.get())==47); assert(balancedHeight(r.get())==3);
    Tree neg=std::make_unique<Node>(-8); neg->left=std::make_unique<Node>(-2);
    assert(maxPathSum(neg.get())==-2 && rob(neg.get())==0);
    std::vector<int> a{1,2,3,4,5,6,7}; auto b=sortedToBST(a,0,7); assert(height(b.get())==3);
    bool threw=false; try { deserialize("1 #"); } catch(const std::invalid_argument&) { threw=true; } assert(threw);
    std::cout<<"binary tree: passed\n";
}
void intervalTest() {
    for(int n:{1,2,7,32,65}) {
        std::vector<long long> a(n); for(auto& x:a) x=draw(101)-50;
        SparseTable st(a);
        for(int l=0;l<n;++l) for(int r=l+1;r<=n;++r)
            assert(st.query(l,r)==*std::min_element(a.begin()+l,a.begin()+r));
        LazySegmentTree seg(a); RangeFenwick bit(n); Fenwick single(n);
        for(int i=0;i<n;++i) { bit.add(i,i+1,a[i]); single.add(i,a[i]); }
        for(int step=0;step<1000;++step) {
            int l=draw(n),r=l+1+draw(n-l); long long delta=draw(41)-20;
            if(draw(2)) {
                seg.add(l,r,delta); bit.add(l,r,delta);
                for(int i=l;i<r;++i) { a[i]+=delta; single.add(i,delta); }
            } else {
                long long expected=std::accumulate(a.begin()+l,a.begin()+r,0LL);
                assert(seg.query(l,r)==expected && bit.sum(l,r)==expected && single.sum(l,r)==expected);
            }
        }
    }
    std::cout<<"interval structures: passed\n";
}
std::vector<int> path(const Graph& g,int start,int target) {
    std::vector<int> p(g.size(),-1); std::queue<int> q; q.push(start); p[start]=start;
    while(!q.empty()) { int u=q.front(); q.pop(); for(int v:g[u]) if(p[v]<0) { p[v]=u; q.push(v); } }
    std::vector<int> answer;
    for(int v=target;;v=p[v]) { answer.push_back(v); if(v==start) break; }
    return answer;
}
void graphTest() {
    for(int round=0;round<40;++round) {
        int n=1+draw(30); Graph g(n);
        for(int v=1;v<n;++v) { int p=draw(v); g[v].push_back(p); g[p].push_back(v); }
        std::vector<long long> values(n); for(auto& x:values) x=draw(20)-10;
        LCA lca(g); HLD hld(g,values); auto sums=distanceSums(g);
        int diam=0;
        for(int u=0;u<n;++u) {
            long long sum=0;
            for(int v=0;v<n;++v) {
                int d=static_cast<int>(path(g,u,v).size())-1;
                assert(lca.distance(u,v)==d); sum+=d; diam=std::max(diam,d);
            }
            assert(sum==sums[u]);
        }
        assert(diameter(g)==diam);
        for(int k=0;k<=n;++k) {
            long long brute=0;
            for(int u=0;u<n;++u) for(int v=u+1;v<n;++v)
                if(static_cast<int>(path(g,u,v).size())-1==k) ++brute;
            assert(CentroidPairs(g,k).count()==brute);
        }
        for(int step=0;step<100;++step) {
            int u=draw(n),v=draw(n); auto nodes=path(g,u,v);
            if(draw(2)) { int d=draw(11)-5; hld.pathAdd(u,v,d); for(int x:nodes) values[x]+=d; }
            else { long long sum=0; for(int x:nodes) sum+=values[x]; assert(hld.pathSum(u,v)==sum); }
            assert(hld.subtreeSum(0)==std::accumulate(values.begin(),values.end(),0LL));
        }
    }
    std::cout<<"LCA, HLD, reroot, diameter, centroid: passed\n";
}
void specialTest() {
    std::vector<int> values; for(int i=0;i<500;++i) values.push_back(draw(1000));
    MinHeap heap(values); std::sort(values.begin(),values.end());
    for(int x:values) { assert(heap.top()==x); heap.pop(); } assert(heap.empty());
    for(int x:{5,2,9,1}) heap.push(x);
    for(int x:{1,2,5,9}) { assert(heap.top()==x); heap.pop(); }
    DSU d(5); assert(d.unite(0,1)); assert(d.unite(1,2)); assert(!d.unite(2,0)); assert(d.find(0)!=d.find(3));
    Trie trie; for(const auto& s:{"he","her","hers","he"}) trie.insert(s);
    assert(trie.prefixCount("he")==4 && trie.count("he")==2); assert(trie.erase("he")); assert(trie.count("he")==1);
    AhoCorasick ac; std::vector<std::string> patterns{"he","she","his","hers","he","a","aa"};
    for(const auto& s:patterns) ac.insert(s);
    ac.build();
    for(const std::string text:{"ushers","ahishers","aaaa","nothing"}) {
        long long brute=0;
        for(const auto& s:patterns) for(std::size_t i=0;i+s.size()<=text.size();++i) if(text.compare(i,s.size(),s)==0) ++brute;
        assert(ac.count(text)==brute);
    }
    auto h=huffman({5,9,12,13,16,45}); assert(h.wpl==224);
    for(std::size_t i=0;i<h.codes.size();++i) for(std::size_t j=0;j<h.codes.size();++j)
        if(i!=j) assert(h.codes[j].rfind(h.codes[i],0)!=0);
    assert(huffman({8}).codes[0]=="0" && huffman({}).codes.empty());
    BTree b; BPlusTree bp; std::set<int> keys;
    for(int i=0;i<1000;++i) {
        int x=draw(500)-250; b.insert(x); bp.insert(x); keys.insert(x);
        for(int j=0;j<5;++j) { int q=draw(600)-300; assert(b.contains(q)==(keys.count(q)>0)); assert(bp.contains(q)==(keys.count(q)>0)); }
        int lo=draw(600)-300,hi=lo+draw(100); std::vector<int> expected;
        for(int key:keys) if(lo<=key && key<=hi) expected.push_back(key);
        assert(bp.range(lo,hi)==expected);
    }
    std::vector<KDTree::Point> pts;
    for(int i=0;i<100;++i) pts.push_back({static_cast<double>(draw(100)),static_cast<double>(draw(100))});
    KDTree kd(pts);
    for(int i=0;i<200;++i) {
        KDTree::Point q{static_cast<double>(draw(150)),static_cast<double>(draw(150))};
        double best=std::numeric_limits<double>::infinity();
        for(auto p:pts) best=std::min(best,(p[0]-q[0])*(p[0]-q[0])+(p[1]-q[1])*(p[1]-q[1]));
        assert(kd.nearestSquared(q)==best);
    }
    std::cout<<"heap, DSU, Trie, AC, Huffman, B/B+, KD: passed\n";
}

void interviewTest() {
    auto t=rebuild({8,3,1,6,12,10,14},{1,3,6,8,10,12,14});
    assert(preorder(t.get())==std::vector<int>({8,3,1,6,12,10,14}));
    assert(postorder(t.get())==std::vector<int>({1,6,3,10,14,12,8}));
    assert(nodeCount(t.get())==7 && leafCount(t.get())==4 && completeCount(t.get())==7);
    assert(hasPathSum(t.get(),12) && !hasPathSum(t.get(),8));
    assert(rootLeafPaths(t.get()).size()==4);
    assert(rightView(t.get())==std::vector<int>({8,12,14}));
    assert(zigzag(t.get())[1]==std::vector<int>({12,3}));
    assert(kthSmallest(t.get(),3)==6 && !kthSmallest(t.get(),8));
    assert(predecessor(t.get(),8)==6 && successor(t.get(),8)==10);
    assert(lcaBST(t.get(),1,6)->value==3);
    RawNode left{1},right{3},root{2,&left,&right};
    std::vector<int> order; order.reserve(3);
    morrisInorder(&root,[&](int x) noexcept { order.push_back(x); });
    assert(order==std::vector<int>({1,2,3}));
    assert(left.right==nullptr && root.left==&left && root.right==&right);
    std::cout<<"interview algorithms and Morris restoration: passed\n";
}

int main() {
    interviewTest();
    basicTest(); orderedTest<AVL>("AVL"); orderedTest<RedBlack>("LLRB");
    orderedTest<Treap>("Treap"); orderedTest<Splay>("Splay");
    intervalTest(); graphTest(); specialTest();
    std::cout<<"ALL TESTS PASSED\n";
}

