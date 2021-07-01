/*
id: mike huang [mike-hu1]
task: 
lang: c++14
*/

#include<bits/stdc++.h>

using namespace std;

// debug code (debugging in c++)
void __print(int x){cerr<<x;}
void __print(long x){cerr<<x;}
void __print(long long x){cerr<<x;}
void __print(unsigned x){cerr<<x;}
void __print(unsigned long x){cerr<<x;}
void __print(unsigned long long x){cerr<<x;}
void __print(float x){cerr<<x;}
void __print(double x){cerr<<x;}
void __print(long double x){cerr<<x;}
void __print(char x) {cerr<<'\''<<x<<'\'';}
void __print(const char *x){cerr<<'\"'<< x<<'\"';}
void __print(const string &x){cerr << '\"' << x << '\"';}
void __print(bool x){cerr<<(x ? "true":"false");}

template<typename t, typename v>
void __print(const pair<t, v> &x) {cerr<<"\n{"; __print(x.first); cerr<< ','; __print(x.second); cerr<< '}';}
template<typename t>
void __print(t const& x){int f = 0; cerr<<"\n{"; for(auto &i: x) cerr<<(f++ ? "," : ""), __print(i); cerr<<"}";}
void _print(){cerr<<"\n";}
template <typename t, typename... v>
void _print(t const& t, v const&... v){__print(t); if (sizeof...(v)) cerr<< ", "; _print(v...);}

#ifdef debug
#define deb(x...) cerr<<#x<< "="; _print(x)
#define debl(x...) cerr<<__line__<<" >> "<<#x<<"=";_print(x)
#else
#define deb(x...)
#endif



void readandinit(){

}

void solve(){

}

int main(){
	#ifndef debug
		freopen(".in","r",stdin);
		freopen(".out","w",stdout);
	#endif
	int testcases=1;
	for(int t=1;t<=testcases;++t){
		readandinit();
		solve();
		//cout<<"\n";
	}
	return 0;
}
