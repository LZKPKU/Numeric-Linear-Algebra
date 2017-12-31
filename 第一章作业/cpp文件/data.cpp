#include<iostream>
#include <fstream>
using namespace std;
int main(){
	ofstream file("data3.txt");
	double a[101][101];
	double b[101];
	for(double i=1;i<=40;++i){
		for(double j=1;j<=40;++j){
			a[(int)i][(int)j]=1/(i+j-1);
			b[(int)i]+=a[(int)i][(int)j];
			file <<a[(int)i][(int)j]<<" ";
		}
		file<<endl;
	}
	file<<endl<<endl<<endl;
	
	for(int i=1;i<=40;++i){
		file<<b[i]<<" ";
		
	}
	return 0;
} 
