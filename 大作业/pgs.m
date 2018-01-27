function [x] = pgs(A,b,x0,itr)
% ��Gauss-Seidel����������Ϊ��ͨ��GS����
% ���룺ϵ������A����������b����ʼ��x0����������itr
% �����Ax=b�Ľ� x

% A�ĶԽ���D
D = diag(diag(A));
%A�������ǲ��ֵ��෴��L
L = -tril(A,-1);
%A�������ǲ��ֵ��෴��U
U = -triu(A,1);

x = x0;

% ����õ�����ǰ���
p = (D-L)\b;
q = (D-U)\b;

% ���öԳ��ԣ���ÿ��ѭ������˽�������
for i = 1:itr
    x = (D-L)\(U*x) + p;
    x = (D-U)\(L*x) + q;
end

end

