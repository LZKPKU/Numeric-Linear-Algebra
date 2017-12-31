function[result]=QR_LS(m,n,A,b)
%�����С���˵ĺ�����m��n�ֱ�Ϊ����A������������
%bΪn by 1��������

%Ҫ��m<n
if m<n 
    stop('�����������Ҫ��������');
end
d(1:n,1)=0;
%QR�ֽ�
for j=1:n
    if j<m
        %����house����,�õ�householder�任�е�beta��v
        [v,beta] = house(A(j:m,j));
        %����Ӧ��A����ʩ��householder�仯
        A(j:m,j:n) = (eye(m-j+1,m-j+1)-beta*v*v')*A(j:m,j:n);
        %d�д��betaֵ��A�������ǲ��ִ�Ŷ�Ӧ��v��v(1)=1
        d(j)=beta;
        A(j+1:m,j)=v(2:m-j+1);
    end
end
%�ؽ�Q��QΪm by m �ľ���
V = tril(A,-1)+eye(m,n);
H=eye(m,m);
for j=1:n
    v=V(:,j);
    beta = d(j);
    H=H*(eye(m,m)-beta*v*v');
end
%ֻ��ҪQ��ǰn��������b�ϵõ�c1
Q = H(:,1:n)';
result = Q*b;
%�ش��������Rx = c1
for j=n:-1:2
    result(j) = result(j)/A(j,j);
    result(1:j-1) = result(1:j-1)-result(j)*A(1:j-1,j);
end
result(1) = result(1)/A(1,1);
end

