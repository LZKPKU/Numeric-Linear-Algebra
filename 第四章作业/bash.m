%初始化
% eps = 1;
% eps=0.1;
% eps=0.01;
 eps=0.0001;
n=100;
X = ones(n-1,1);
Y = ones(n-1,1);

a= 1/2;
w = 1/2;
h = 1/n;
%构造A矩阵,b向量

x = ones(n-2,1);
A = -(2*eps+h)*eye(n-1)+diag((eps+h)*x,1)+diag(eps*x,-1);
b = [a*h^2*ones(n-2,1);a*h^2-(eps+h)];

% 计算Y的真值
for i=1:n-1
    X(i) = i*h;
    Y(i) = ((1-a)/(1-exp(-1/eps)))*(1-exp(-X(i)/eps))+a*X(i);
end
% 调用三种方法求解
tol=10^(-5);
Max = 1000000;
[yJ,kJ]= Jacobi(A,b,tol,Max);
[yGS,kGS] = Gauss_Seidel(A,b,tol,Max);
[ySOR,kSOR] = SOR(A,b,w,tol,Max);

% 2范数衡量的误差
errJ2 = norm(Y-yJ,2);
errGS2 = norm(Y-yGS,2);
errSOR2 = norm(Y-ySOR,2);
% 无穷范数衡量的误差
errJinf = norm(Y-yJ,inf);
errGSinf = norm(Y-yGS,inf);
errSORinf = norm(Y-ySOR,inf);

% save eps_4.mat errJ2 errGS2 errSOR2 errJinf errGSinf 
% errSORinf eps yJ kJ yGS kGS ySOR kSOR Y