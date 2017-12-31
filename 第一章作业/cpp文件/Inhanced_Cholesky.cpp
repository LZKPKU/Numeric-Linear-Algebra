/*
	改进的Cholesky分解法
	By：Li Zekun
	Date：2017/9/30
*/
#include<iostream>
#include<cmath>
#include<time.h>
#include<fstream>
using namespace std;
#define MAX_NUM 200
void read_rc(int* a){
	cout<<"请输入系数矩阵行列数："<<endl;
	cin>>*a;
	cout<<endl;
}
void read_coef(int a,double(*coef)[MAX_NUM]){
	cout<<"请输入系数矩阵: "<<endl;
	for(int i=1;i<=a;++i){
		for(int j=1;j<=a;++j){
			cin>>coef[i][j];
		}
	}
}
void read_b(int a,double* b){
	cout<<"请输入常数向量: "<<endl;
	for(int i=1;i<=a;++i){
		cin>>b[i];
	}
}

void Inhanced_Cholesky(double(*coef)[MAX_NUM],int n){
	double v[MAX_NUM];
	for(int j=1;j<=n;++j){
		for(int i=1;i<=j-1;++i){
			v[i] = coef[j][i]*coef[i][i];
			coef[j][j] = coef[j][j] - coef[j][i]*v[i];
		}
		for(int k=j+1;k<=n;++k){
			for(int i=0;i<=j-1;++i){
				coef[k][j] = coef[k][j] - coef[k][i]*v[i];	
			}
			coef[k][j] = coef[k][j]/coef[j][j];
		}
	}
}

void L(double(*coef)[MAX_NUM],double* b,int n){
	for(int j=1;j<=n-1;++j){ 
		for(int i=j+1;i<=n;++i){
			b[i] = b[i] - b[j]*coef[i][j];
		}
	}
}

void U(double(*coef)[MAX_NUM],double* b,int n){
	for(int j=n;j>=2;--j){
		b[j] = b[j]/coef[j][j];
		for(int i=1;i<=j-1;++i){
			b[i] = b[i] - b[j]*coef[i][j];
		}
	}
	b[1] = b[1]/coef[1][1];
}

void T(double(*coef)[MAX_NUM],int n){
	for(int i=1;i<=n-1;++i){
		for(int j=i+1;j<=n;++j){
			coef[i][j] = coef[i][i]*coef[j][i];
		}
	}
}

void output(double* b ,int n){
	ofstream file("Inhanced_Cholesky.txt");
	for(int i=1;i<=n;++i){
		file<<"x_{"<<i<<"}="<<b[i]<<"\\"<<"\\";
	}
}


int main(){
	double coef[MAX_NUM][MAX_NUM],b[MAX_NUM];
	int row;
	clock_t start, finish;
    double  duration;
	read_rc(&row);
	read_coef(row,coef);
	read_b(row,b);
	start = clock();
	Inhanced_Cholesky(coef,row);
	T(coef,row);
	L(coef,b,row);
	U(coef,b,row);
	finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;
    printf("用时： %f seconds\n", duration);
	output(b,row);
	return 0;
} 
