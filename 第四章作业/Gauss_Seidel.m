function [x,k] = Gauss_Seidel(A,b,tol,Max_itnum)
% Gauss-Seidel������
% ������ϵ������A������b�����̶� tol������������Max_itnum.
% ����ǽ�x�͵�������k

D = diag(diag(A));%A�ĶԽǲ���D
L = -tril(A,-1);%A�������ǲ��ֵ��෴��L
U = -triu(A,1);%A�������ǲ��ֵ��෴��U
inver = (D-L)^(-1);
G = inver*U;
g = inver*b;
x0 = zeros(length(A),1);
x = G*x0+g;
k=1;
while norm(x-x0,2)>=tol
    x0 = x;
    x = G*x0+g;
    k = k+1;
    if k>= Max_itnum
        break;
    end
end
end

