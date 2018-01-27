function [A] = Data_A(N,eps)
% ����ϵ������A((N-1)^2 by (N-1)^2)
% ���룺����N��eps
% ���������A

eyen = speye(N-1);
eyen1 = sparse(diag(ones(1,N-2),1));
% ���Խ����ϵĿ�
a = (eyen1+eyen1')*eps - (2*(1+eps))*eyen;
% �ζԽ�����Ϊ��λ��

% kron��A,B������,������A��ÿ��Ԫ�ض����Ծ���B�����ڿ��ٹ���Aʮ������
A = kron(eyen,a)+kron(eyen1,eyen)+kron(eyen1',eyen);
% ���ǵ�Ч�ʣ�����ٸ�ÿ��Ԫ�س��Գ������N^2
A = A.*(-N^2);
end

