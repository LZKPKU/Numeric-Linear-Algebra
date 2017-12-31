%����Ax = b��kappa-inf.
%���ƾ���A����������(A�����ת�õ�1����)
%  ��ʽΪ
%  n 0 0����
%  ϵ������ A��n by n��
%  b ��n by 1��

data = load('data_estimate_infinite_norm.txt');
n = data(1,1);
A = data(2:n+1,:);
b = data(n+1,:);
AT = A';

%��A������ԪGauss��ȥ�����õ�LU��������A�У��û����󴢴���P��
P=eye(n,n);
for k = 1:n-1
    m=k,M = abs(A(k,k));
    %ѡȡ�������Ԫ
    for p = k:n
        if abs(A(p,k))>M
            M = abs(A(p,k));
            m = p;
        end
    end
    %��������Ԫ
     A([k,m],:) = A([m,k],:);
     P([k,m],:) = P([m,k],:);
     if A(k,k)~=0
         A(k+1:n,k) = A(k+1:n,k)/A(k,k);
         A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
     else
         stop('��������');
     end
end

%��AT������ԪGauss��ȥ�����õ�LU��������AT�У��û����󴢴���PT��
PT=eye(n,n);
for k = 1:n-1
    m=k,M = abs(AT(k,k));
    %ѡȡ�������Ԫ
    for p = k:n
        if abs(AT(p,k))>M
            M = abs(AT(p,k));
            m = p;
        end
    end
    %��������Ԫ
     AT([k,m],:) = AT([m,k],:);
     PT([k,m],:) = PT([m,k],:);
     if AT(k,k)~=0
         AT(k+1:n,k) = AT(k+1:n,k)/AT(k,k);
         AT(k+1:n,k+1:n)=AT(k+1:n,k+1:n)-AT(k+1:n,k)*AT(k,k+1:n);
     else
         stop('��������');
     end
end


%  ���ݶ���
%load data_estimate_infinite_norm
% ���ƾ�����������
x(1:n,1) = 1/n;
falg = 1;
while flag==1
    %����w
    w = x;
    w = PT*w;
    % ǰ����
    for j=1:n-1
        w(j) = w(j)/1;
        for k=j+1:n
            w(k) = w(k)-w(j)*AT(k,j);
        end
    end
    %�ش���
    for j=n:-1:2
        w(j) = w(j)/AT(j,j);
        for k=1:j-1
            w(k) = w(k)-w(j)*AT(k,j);
        end
    end
    w(1) = w(1)/AT(1,1);
    
    %�õ�v
    v=sign(w);
    %����z
    z=v;
    
    z = P*z;
    % ǰ����
    for j=1:n-1
        z(j) = z(j)/1;
        for k=j+1:n
            z(k) = z(k)-z(j)*A(k,j);
        end
    end
    %�ش���
    for j=n:-1:2
        z(j) = z(j)/A(j,j);
        for k=1:j-1
        z(k) = z(k)-z(j)*A(k,j);
        end
    end
    z(1) = z(1)/A(1,1);
    
    %�ж�
    temp = norm(z,'inf');
    if temp <= z'*x
        ans = norm(w,1);
        flag=0;
    else
        x(1:n,1)=0;
        for j=1:n
            if abs(z(j)) == temp
                x(j)=1;
                break
            end
        end
    end
end
%�õ�����A�����������Ĺ���(A�����ת�õ�1����)������ans��

kappa = norm(A,1)*ans;


    
    
    
    