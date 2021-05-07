// low is the lower bound of the range and high is the higher bound of the range
// v: input (can also be deklared globally
int calcMin(int low, int high, vector<int> v){
	int l = high - low + 1;
	int k = (int)log2(l);
	return min(v[sparse[l][k]], v[sparse[low+l-(int)pow(2,k)][k]]);
}
