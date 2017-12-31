%间隔数
n=64;
%迭代次数
Max_itnum=100;
h = 1/n;

A = (1/h^2)*(2*eye(n-1,n-1)-diag(ones(n-2,1),1)-diag(ones(n-2,1),-1));
x0 = ones(n-1,1);
b = zeros(n-1,1);
k=1;
%k=3;
%k=6;
%k=30;
for i =1:n-1
    x0(i) = sin(k*pi*i*h);
end

D = diag(diag(A));%A的对角部分D
L = -tril(A,-1);%A的下三角部分的相反数L
U = -triu(A,1);%A的上三角部分的相反数U
inver = (D-L)^(-1);
G = inver*U;
g = inver*b;
%x0 = zeros(length(A),1);
ite=0;

while  ite< Max_itnum
    ite = ite+1;
    res1(ite) = norm(x0,inf);
    %res3(ite) = norm(x0,inf);
    %res6(ite) = norm(x0,inf);
    %res30(ite) = norm(x0,inf);
    x0 = G*x0+g;
    
    
end

res = [res1;res3;res6;res30]';
plot(res);
line([5,5],[0:1]);
legend('k=1','k=3','k=6','k=30');
