#include<iostream>
#include <fstream>
using namespace std;
int main(){
	ofstream file("data3.txt");
	double a[101][101];
	double b[101];
	int n;
	cout<<"Hilbert rank:"<<endl;
	cin>>n;
	for(double i=1;i<=n;++i){
		for(double j=1;j<=n;++j){
			a[(int)i][(int)j]=1/(i+j-1);
			b[(int)i]+=a[(int)i][(int)j];
			file <<a[(int)i][(int)j]<<" ";
		}
		file<<endl;
	}
	file<<endl<<endl<<endl;
	
	for(int i=1;i<=n;++i){
		file<<b[i]<<" ";
		
	}
	return 0;
} 
