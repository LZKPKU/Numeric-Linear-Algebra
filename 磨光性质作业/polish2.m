%间隔数
n=64;
%迭代次数
Max_itnum=5;
h = 1/n;

A = (1/h^2)*(2*eye(n-1,n-1)-diag(ones(n-2,1),1)-diag(ones(n-2,1),-1));
kgruop = [1,3,6,30];
x = zeros(n-1,1);
X = [x,x,x,x];
b = zeros(n-1,1);
for q=1:4
    k = kgruop(q);
for i =1:n-1
    x(i) = sin(k*pi*i*h);
end

D = diag(diag(A));%A的对角部分D
L = -tril(A,-1);%A的下三角部分的相反数L
U = -triu(A,1);%A的上三角部分的相反数U
inver = (D-L)^(-1);
G = inver*U;
g = inver*b;
ite=0;

while  ite< Max_itnum
    ite = ite+1;
    x = G*x+g;
end
X(1:n-1,q) = x;
end

plot(X);
legend('k=1','k=3','k=6','k=30');
