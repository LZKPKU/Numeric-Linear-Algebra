function[result]=QR_EQ(n,A,b)
%����QR�ֽ���ⷽ�̵ĺ�����nΪ����A�Ľ���
%bΪn by 1��������
%QR�ֽ�
for j=1:n
    if j<n
        %����house����,�õ�householder�任�е�beta��v
        [v,beta] = house(A(j:n,j));
        %����Ӧ��A����ʩ��householder�仯
        A(j:n,j:n) = (eye(n-j+1,n-j+1)-beta*v*v')*A(j:n,j:n);
        %d�д��betaֵ��A�������ǲ��ִ�Ŷ�Ӧ��v��v(1)=1
        d(j)=beta;
        A(j+1:n,j)=v(2:n-j+1);
    end
end
%�ؽ�Q��QΪn by n �ľ���
V = tril(A,-1)+eye(n,n);
Q=eye(n,n);
for j=1:n-1
    v=V(:,j);
    beta = d(j);
    Q=Q*(eye(n,n)-beta*v*v');
end
%Qy = b��QΪ�������󣬿���ֱ����y = Qb.
result = Q'*b;

% �ش��������Rx = y,����QR����ֻ��Ӧ����ǰn-1��
for j=n-1:-1:2
    result(j) = result(j)/A(j,j);
    result(1:j-1) = result(1:j-1)-result(j)*A(1:j-1,j);
end
result(1) = result(1)/A(1,1);
%���һ�е�������,��Ϊ��ʵ���ϲ�û��ͨ��QR�ֽ�
result(n) = result(n)-A(n,1:n-1)*result(1:n-1)
end
