/*
	选列主元的Gauss消去法
	By:Li Zekun
	Date：2017/9/23 
*/
#include<iostream>
#include<fstream>
#include<cmath>
#include<string.h>
#include<time.h>
using namespace std;
#define MAX_NUM 100
double coef[MAX_NUM][MAX_NUM],b[MAX_NUM];


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

void P(int i,int j){
	double temp = b[i];
	b[i] = b[j];
	b[j] = temp;
}

bool Gauss_Selectcolumn(double(*coef)[MAX_NUM],int n){
	double Max,temp;
	int maxrow;
	for(int k=1;k<=n-1;++k){
		Max = abs(coef[k][k]);

		maxrow = k;
		for(int i=k;i<=n;++i){//choose max|A(i,k)|
			temp = abs(coef[i][k]);
			if(temp > Max){
				maxrow = i;
				Max = temp;
			}
		}
		double tmp[MAX_NUM];
		memcpy(tmp,coef[k],sizeof(coef[k]));
		memcpy(coef[k],coef[maxrow],sizeof(coef[maxrow]));
		memcpy(coef[maxrow],tmp,sizeof(tmp));
		P(k,maxrow);
		Max = coef[k][k];
		if(Max!=0){
			for(int j=k+1;j<=n;++j){
				coef[j][k] = coef[j][k]/Max;
				for(int m=k+1;m<=n;++m){
					coef[j][m] = coef[j][m] - coef[j][k]*coef[k][m];
				}
			}
		}
		else{
			return false;
		}
	}
	return true;
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

void output(double* b ,int n){
	ofstream file("Gauss_Selectcolumn.txt");
	for(int i=1;i<=n;++i){
		file<<"x_{"<<i<<"}="<<b[i]<<"\\"<<"\\";
	}
}


int main(){
	int row;
	clock_t start, finish;
    double  duration;
	read_rc(&row);
	read_coef(row,coef);
	read_b(row,b);
	start = clock();
	if(Gauss_Selectcolumn(coef,row)){
		L(coef,b,row);
		U(coef,b,row);
		for(int i=1;i<=row;++i){
			for(int j=1;j<=row;++j){
				cout<<coef[i][j]<<" ";
			}
			cout<<endl;
		} 
		finish = clock();
    	duration = (double)(finish - start) / CLOCKS_PER_SEC;
    	printf("用时： %f seconds\n", duration);
		output(b,row);
	}
	else{
		cout<<"矩阵奇异!"<<endl;
	}
	return 0;
} 
