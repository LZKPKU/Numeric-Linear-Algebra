%���ƾ����1����:�Ż���
%  ��ʽΪ
%  n 0 0����
%  ϵ������ A��n by n��


data = load('data_estimate_1_norm.txt');
n = data(1,1);
B = data(2:n+1,:);

%  ���ݶ���
%load data_estimate_1_norm
% ���ƾ����1����

x(1:n,1)=1/n;  %��ʼ��n
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
            
