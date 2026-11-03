#ifndef INTERVAL_HPP
#define INTERVAL_HPP
#include <algorithm>
#include <stdexcept>
#include <vector>
namespace study {
class Fenwick {
    std::vector<long long> bit;
public:
    explicit Fenwick(int n):bit(n+1) { if(n<1) throw std::invalid_argument("n must be positive"); }
    // 对外使用 0-based 下标；区间均采用 [l,r)。
    void add(int p,long long delta) {
        for(++p;p<static_cast<int>(bit.size());p+=p&-p) bit[p]+=delta;
    }
    long long prefix(int r) const {
        long long sum=0; for(;r>0;r-=r&-r) sum+=bit[r]; return sum;
    }
    long long sum(int l,int r) const { return prefix(r)-prefix(l); }
};
class RangeFenwick {
    Fenwick b1,b2;
    void change(int p,long long v) { b1.add(p,v); b2.add(p,v*p); }
public:
    explicit RangeFenwick(int n):b1(n),b2(n) {}
    void add(int l,int r,long long v) { change(l,v); change(r,-v); }
    long long prefix(int r) const { return r*b1.prefix(r)-b2.prefix(r); }
    long long sum(int l,int r) const { return prefix(r)-prefix(l); }
};
class LazySegmentTree {
    int n; std::vector<long long> sum,lazy;
    void build(int p,int l,int r,const std::vector<long long>& a) {
        if(r-l==1) { sum[p]=a[l]; return; }
        int m=(l+r)/2; build(p*2,l,m,a); build(p*2+1,m,r,a); pull(p);
    }
    void pull(int p) { sum[p]=sum[p*2]+sum[p*2+1]; }
    void apply(int p,int l,int r,long long delta) { sum[p]+=delta*(r-l); lazy[p]+=delta; }
    void push(int p,int l,int r) {
        if(lazy[p]==0 || r-l==1) return;
        int m=(l+r)/2;
        apply(p*2,l,m,lazy[p]); apply(p*2+1,m,r,lazy[p]); lazy[p]=0;
    }
    void add(int p,int l,int r,int ql,int qr,long long v) {
        if(qr<=l || r<=ql) return;
        if(ql<=l && r<=qr) { apply(p,l,r,v); return; }
        push(p,l,r); int m=(l+r)/2;
        add(p*2,l,m,ql,qr,v); add(p*2+1,m,r,ql,qr,v); pull(p);
    }
    long long query(int p,int l,int r,int ql,int qr) {
        if(qr<=l || r<=ql) return 0;
        if(ql<=l && r<=qr) return sum[p];
        push(p,l,r); int m=(l+r)/2;
        return query(p*2,l,m,ql,qr)+query(p*2+1,m,r,ql,qr);
    }
public:
    explicit LazySegmentTree(const std::vector<long long>& a):n(static_cast<int>(a.size())),sum(4*a.size()),lazy(4*a.size()) {
        if(!n) throw std::invalid_argument("empty array");
        build(1,0,n,a);
    }
    void add(int l,int r,long long v) { add(1,0,n,l,r,v); }
    long long query(int l,int r) { return query(1,0,n,l,r); }
};
class SparseTable {
    std::vector<int> lg;
    std::vector<std::vector<long long>> st;
public:
    explicit SparseTable(const std::vector<long long>& a):lg(a.size()+1) {
        int n=static_cast<int>(a.size());
        if(!n) throw std::invalid_argument("empty array");
        for(int i=2;i<=n;++i) lg[i]=lg[i/2]+1;
        st.assign(lg[n]+1,std::vector<long long>(n)); st[0]=a;
        for(int k=1;k<=lg[n];++k)
            for(int i=0;i+(1<<k)<=n;++i)
                st[k][i]=std::min(st[k-1][i],st[k-1][i+(1<<(k-1))]);
    }
    long long query(int l,int r) const { // 非空区间 [l,r)
        int k=lg[r-l]; return std::min(st[k][l],st[k][r-(1<<k)]);
    }
};
} // namespace study
#endif
