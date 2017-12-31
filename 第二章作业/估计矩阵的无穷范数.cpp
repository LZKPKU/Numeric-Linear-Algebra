/*
	estimate L-infinite norm
	of Matrix 
	By£ºLi Zekun
	Date£º2017/9/24 
*/
#include<iostream>
#include<cmath>
#include<time.h>
#include<fstream>
using namespace std;
#define MAX_NUM 200

void read_rc(int* a){
	cout<<"ÇëÊäÈë¾ØÕóÐÐÁÐÊý£º"<<endl;
	cin>>*a;
	cout<<endl;
}
void read_coef(int a,double(*coef)[MAX_NUM]){
	cout<<"ÇëÊäÈë¾ØÕó: "<<endl;
	for(int i=1;i<=a;++i){
		for(int j=1;j<=a;++j){
			cin>>coef[i][j];
		}
	}
}
void Multiple(double(*coef)[MAX_NUM],double* x,double* ans,int n){
	for(int i=1;i<=n;++i){
		for(int j=1;j<=n;++j){
			ans[i] += (coef[i][j]*x[j]);
		}
	}
}
void Sign(double* w,double* v,int n){
	for(int i=1;i<=n;++i){
		if(w[i]>0){
			v[i] = 1;
		}
		else if(w[i]==0){
			v[i] = 0;
		}
		else v[i]=-1;
	}
}
double Infinite_Norm(double* z,int n){
	double Max = abs(z[1]);
	for(int i=1;i<=n;++i){
		if(abs(z[i])>Max)
		Max = abs(z[i]);
	}
	return Max;
}

void Gauss(double(*coef)[MAX_NUM],int n){
	for(int i=1;i<=n-1;++i){
		for(int j=i+1;j<=n;++j){
			coef[j][i] = coef[j][i]/coef[i][i];
			for(int m=i+1;m<=n;++m){
				coef[j][m] = coef[j][m] - coef[j][i]*coef[i][m];
			}
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

int main()
{
	double A[MAX_NUM][MAX_NUM],A_T[MAX_NUM][MAX_NUM];
	double w[MAX_NUM],x[MAX_NUM],v[MAX_NUM],z[MAX_NUM];
	int n,flag = 1;
	double z_inf,temp,ans,A_inf_norm;
	read_rc(&n);
	read_coef(n,A);
	for(int i=1;i<=n;++i){// initialize x
		x[i] = w[i] = 1/n;
	}
	for(int i=1;i<=n;++i){
		for(int j=1;j<=n;++j){
			A_T[i][j] = A[j][i];
		}
	}
	//calculate inf norm of A
	for(int j=1;j<=n;++j){
		A_inf_norm +=A[1][j];
	}//init
	for(int i=1;i<=n;++i){
		for(int j=1;j<=n;++j){
			temp+=A[i][j];
		}
		if(temp>A_inf_norm){
			A_inf_norm = temp;
		}
	}
	//estimate L1 norm of A-T.
	Gauss(A_T,n);
	Gauss(A,n);
	while(flag==1){		
		L(A_T,w,n);
		U(A_T,w,n);
		Sign(w,v,n);//generate v
		for(int i=1;i<=n;++i){
			z[i] = v[i];
		}
		L(A,z,n);
		U(A,z,n);//calculate z
		z_inf = Infinite_Norm(z,n);
		for(int i=1;i<=n;++i){
			temp+=(z[i]*x[i]);
		}
		if(z_inf<=temp){
			for(int i=1;i<=n;++i){
				ans+=abs(w[i]);
				flag=0;
			}
		}
		else{
			for(int i=1;i<=n;++i){
				x[i] = w[i] = 0;
			} 
			for(int i=1;i<=n;++i){
				if(abs(z[i]) == z_inf){
					x[i] = w[i] = 1;
					break;
				}
			}
		}
	}
	cout<<A_inf_norm*ans<<endl;
	return 0;
}
