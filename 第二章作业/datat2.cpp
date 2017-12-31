#include<iostream>
#include <fstream>
using namespace std;
int main(){
	ofstream file("data3.txt");
	int a[101][101]={0};
	int b[101];
	int n;
	cout<<"rank:"<<endl;
	cin>>n;
	for(int i=1;i<=n;++i){
		for(int j=1;j<=n;++j){
			if(i>j) a[i][j]= -1;
			else if(j==n||i==j) a[i][j] = 1;
			else a[i][j]=0;
			file <<a[i][j]<<" ";
		}
		b[i] = 3-i;
		file<<endl;
	}
	b[n] = 2-n;
	file<<endl<<endl<<endl;
	
	for(int i=1;i<=n;++i){
		file<<b[i]<<" ";
		
	}
	return 0;
} 
