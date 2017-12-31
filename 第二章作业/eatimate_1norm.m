%估计矩阵的1范数:优化法
%  格式为
%  n 0 0……
%  系数矩阵 A（n by n）


data = load('data_estimate_1_norm.txt');
n = data(1,1);
B = data(2:n+1,:);

%  数据读入
%load data_estimate_1_norm
% 估计矩阵的1范数

x(1:n,1)=1/n;  %初始化n
flag = 1;
while flag==1
    w=B*x;
    v=sign(w);
    z=B'*v;
    tmp = norm(z,'inf');
    if tmp <= z'*x
        v = norm(w,1);
        flag=0;
    else
        x(1:n,1)=0;
        for j=1:n
            if abs(z(j)) == tmp
                x(j)=1;
                break
            end
        end
    end
end

v
            
