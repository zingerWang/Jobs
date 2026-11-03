#ifndef TREE_ALGORITHMS_HPP
#define TREE_ALGORITHMS_HPP
#include "interval.hpp"
#include <algorithm>
#include <functional>
#include <memory>
#include <queue>
#include <vector>
namespace study {
using Graph=std::vector<std::vector<int>>;
class LCA {
    int log=1; std::vector<int> depth; std::vector<std::vector<int>> up;
public:
    explicit LCA(const Graph& g,int root=0):depth(g.size(),-1) {
        int n=static_cast<int>(g.size()); while((1LL<<log)<=n) ++log;
        up.assign(log,std::vector<int>(n,root));
        std::queue<int> q; q.push(root); depth[root]=0;
        while(!q.empty()) {
            int u=q.front(); q.pop();
            for(int v:g[u]) if(depth[v]<0) {
                depth[v]=depth[u]+1; up[0][v]=u;
                for(int j=1;j<log;++j) up[j][v]=up[j-1][up[j-1][v]];
                q.push(v);
            }
        }
    }
    int query(int u,int v) const {
        if(depth[u]<depth[v]) std::swap(u,v);
        int diff=depth[u]-depth[v];
        for(int j=0;j<log;++j) if(diff&(1LL<<j)) u=up[j][u];
        if(u==v) return u;
        for(int j=log-1;j>=0;--j) if(up[j][u]!=up[j][v]) { u=up[j][u]; v=up[j][v]; }
        return up[0][u];
    }
    int distance(int u,int v) const { return depth[u]+depth[v]-2*depth[query(u,v)]; }
};
class HLD {
    Graph g; std::vector<int> parent,depth,size,heavy,head,pos; int timer=0;
    std::unique_ptr<LazySegmentTree> seg;
    void dfsSize(int u,int p) {
        parent[u]=p; size[u]=1;
        for(int v:g[u]) if(v!=p) {
            depth[v]=depth[u]+1; dfsSize(v,u); size[u]+=size[v];
            if(heavy[u]==-1 || size[v]>size[heavy[u]]) heavy[u]=v;
        }
    }
    void decompose(int u,int top) {
        head[u]=top; pos[u]=timer++;
        if(heavy[u]!=-1) decompose(heavy[u],top);
        for(int v:g[u]) if(v!=parent[u] && v!=heavy[u]) decompose(v,v);
    }
public:
    HLD(const Graph& graph,const std::vector<long long>& values,int root=0):g(graph),parent(g.size()),depth(g.size()),size(g.size()),heavy(g.size(),-1),head(g.size()),pos(g.size()) {
        dfsSize(root,-1); decompose(root,root);
        std::vector<long long> flat(g.size());
        for(int u=0;u<static_cast<int>(g.size());++u) flat[pos[u]]=values[u];
        seg=std::make_unique<LazySegmentTree>(flat);
    }
    void pathAdd(int u,int v,long long x) {
        while(head[u]!=head[v]) {
            if(depth[head[u]]<depth[head[v]]) std::swap(u,v);
            seg->add(pos[head[u]],pos[u]+1,x); u=parent[head[u]];
        }
        if(depth[u]>depth[v]) std::swap(u,v);
        seg->add(pos[u],pos[v]+1,x); // 点权：LCA 也要包含
    }
    long long pathSum(int u,int v) {
        long long answer=0;
        while(head[u]!=head[v]) {
            if(depth[head[u]]<depth[head[v]]) std::swap(u,v);
            answer+=seg->query(pos[head[u]],pos[u]+1); u=parent[head[u]];
        }
        if(depth[u]>depth[v]) std::swap(u,v);
        return answer+seg->query(pos[u],pos[v]+1);
    }
    long long subtreeSum(int u) { return seg->query(pos[u],pos[u]+size[u]); }
};
inline std::vector<long long> distanceSums(const Graph& g,int root=0) {
    int n=static_cast<int>(g.size());
    std::vector<int> parent(n,-1),order{root},size(n,1),depth(n);
    parent[root]=root;
    for(std::size_t i=0;i<order.size();++i) {
        int u=order[i];
        for(int v:g[u]) if(v!=parent[u]) { parent[v]=u; depth[v]=depth[u]+1; order.push_back(v); }
    }
    for(int i=n-1;i>0;--i) size[parent[order[i]]]+=size[order[i]];
    std::vector<long long> ans(n);
    for(int d:depth) ans[root]+=d;
    for(int u:order) if(u!=root) ans[u]=ans[parent[u]]+n-2LL*size[u];
    return ans;
}
inline int diameter(const Graph& g) { // 无权树，长度按边数
    auto farthest=[&](int start) {
        std::vector<int> d(g.size(),-1); std::queue<int> q; q.push(start); d[start]=0; int far=start;
        while(!q.empty()) { int u=q.front(); q.pop(); if(d[u]>d[far]) far=u;
            for(int v:g[u]) if(d[v]<0) { d[v]=d[u]+1; q.push(v); }
        }
        return std::make_pair(far,d[far]);
    };
    return farthest(farthest(0).first).second;
}
class CentroidPairs {
    const Graph& g; int k; std::vector<int> size; std::vector<bool> removed;
    int sizes(int u,int p) {
        size[u]=1;
        for(int v:g[u]) if(v!=p && !removed[v]) size[u]+=sizes(v,u);
        return size[u];
    }
    int centroid(int u,int p,int total) {
        for(int v:g[u]) if(v!=p && !removed[v] && size[v]>total/2) return centroid(v,u,total);
        return u;
    }
    void distances(int u,int p,int d,std::vector<int>& result) {
        if(d>k) return;
        result.push_back(d);
        for(int v:g[u]) if(v!=p && !removed[v]) distances(v,u,d+1,result);
    }
    long long solve(int start) {
        int total=sizes(start,-1),c=centroid(start,-1,total); removed[c]=true;
        std::vector<int> freq(std::min(k,total)+1); freq[0]=1; long long answer=0;
        for(int v:g[c]) if(!removed[v]) {
            std::vector<int> ds; distances(v,c,1,ds);
            for(int d:ds) if(k-d<static_cast<int>(freq.size())) answer+=freq[k-d];
            // 先查询，再加入：避免同一子树内的路径在当前重心重复统计。
            for(int d:ds) ++freq[d];
        }
        for(int v:g[c]) if(!removed[v]) answer+=solve(v);
        return answer;
    }
public:
    CentroidPairs(const Graph& graph,int distance):g(graph),k(distance),size(g.size()),removed(g.size()) {}
    long long count() { // 一次性对象；只统计不同结点组成的无序点对
        if(g.empty() || k<=0 || k>=static_cast<int>(g.size())) return 0;
        return solve(0);
    }
};
} // namespace study
#endif
