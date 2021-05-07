// assumes that sparse is an array of size(n,floor(log(n))+1) with n being the size of the array
// if not it can be declared later ... 
// v: input
void preprocess(vector<int> v){
	int n = (int)v.size();
	for(int i = 0; i < n; i++) sparse[i][0] = i;
	for(int j = 1; pow(2,j) <= n; ++j){
		for(int i = 0; i+pow(2,j) - 1 < n; ++i){
			if (v[sparse[i][j-1]] < v[sparse[i+(int)pow(2,j-1)][j-1]]) sparse[i][j] = sparse[i][j-1];
			else sparse[i][j] = sparse[i+(int)pow(2,j-1)][j-1];
		}
	}
}
