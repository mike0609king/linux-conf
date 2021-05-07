// Debug Code (Debugging in C++)
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

template<typename T, typename V>
void __print(const pair<T, V> &x) {cerr<<"\n{"; __print(x.first); cerr<< ','; __print(x.second); cerr<< '}';}
template<typename T>
void __print(T const& x){int f = 0; cerr<<"\n{"; for(auto &i: x) cerr<<(f++ ? "," : ""), __print(i); cerr<<"}";}
void _print(){cerr<<"\n";}
template <typename T, typename... V>
void _print(T const& t, V const&... v){__print(t); if (sizeof...(v)) cerr<< ", "; _print(v...);}

#ifdef DEBUG
#define deb(x...) cerr<<#x<< "="; _print(x)
#define debL(x...) cerr<<__LINE__<<" >> "<<#x<<"=";_print(x)
#else
#define deb(x...)
#endif
