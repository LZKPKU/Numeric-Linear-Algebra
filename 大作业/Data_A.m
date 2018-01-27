function [A] = Data_A(N,eps)
% 构建系数矩阵A((N-1)^2 by (N-1)^2)
% 输入：常数N和eps
% 输出：矩阵A

eyen = speye(N-1);
eyen1 = sparse(diag(ones(1,N-2),1));
% 主对角线上的块
a = (eyen1+eyen1')*eps - (2*(1+eps))*eyen;
% 次对角线上为单位阵

% kron（A,B）函数,将矩阵A的每个元素都乘以矩阵B，对于快速构建A十分有用
A = kron(eyen,a)+kron(eyen1,eyen)+kron(eyen1',eyen);
% 考虑到效率，最后再给每个元素乘以常数项，即N^2
A = A.*(-N^2);
end

