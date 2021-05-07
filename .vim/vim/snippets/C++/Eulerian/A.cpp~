#include<bits/stdc++.h>

using namespace std;

void dfs(int i, vector<vector<int>> adj, vector<int>& out, vector<int>& path){
	while(out[i] != 0)
		dfs(adj[i][--out[i]], adj, out, path);
	path.push_back(i);
}

pair<vector<int>, vector<int>> getInOutDegree(vector<vector<int>> adj){
	int n = (int) adj.size();
	vector<int> in(n,0), out(n,0);
	for(int i = 1; i < n; ++i){
		for(int j : adj[i]){
			++out[i];
			++in[j];
		}
	}
	return {in, out};
}


bool hasEulerianPath(vector<int> in, vector<int> out){
	int n = (int) in.size();
	int start = 0, end = 0;
	for(int i = 1; i < n; ++i){
		if (in[i] - out[i] > 1) return false;
		else if (in[i] - out[i] == 1) ++end;
		else if (out[i] - in[i] == 1) ++start;
	}
	return (start == 0 && end == 0) || (start == 1 && end == 1);
}

int startNode(vector<int> in, vector<int> out){
	int n = (int)in.size();
	int start = 0;
	for(int i = 1; i<=n; ++i){
		if(out[i] - in[i]) return i;
		if(out[i] > 1) start = i;
	}
	return start;
}


vector<int> findEulerianPath(vector<vector<int>> adj, int m){
	int n = (int)adj.size();
	vector<int> path;
	vector<int> in, out;
	tie(in,out) = getInOutDegree(adj);
	if(!hasEulerianPath(in,out)) return vector<int>();
	dfs(startNode(in, out), adj, out, path);
	if(!(path.size() == m+1)) return vector<int> ();
	reverse(path.begin(), path.end());
	return path;
}



int main (){
	int n, m; 
	cin >> n >> m;
	vector<vector<int>> adj(n+1);
	for(int i = 0; i < m; ++i){
		int a, b;
		cin >> a >> b;
		adj[a].push_back(b);
	}
	vector<int> path = findEulerianPath(adj,m);
	if(path.size() != 0)
		for(int i : path)
			cout << i << " ";
	else cout << "There is no Eulerian Path" << endl;
	return 0;
}

