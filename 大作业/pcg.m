function [x,err_record] = pcg(A,f,opts,mode)
% 预条件共轭梯度法函数
% 输入： A是系数矩阵，f为常数向量，opts为人为设定的参数，mode为模式
% 输出： Ax=f的解x，以及迭代过程中每一步的误差err_record
% 备注： 1.opts中，第一个为规模N，第二个为eps，第三个为终止条件中的tol
%        2.mode中，'line'为线GS迭代，'point'为点GS迭代
%        3.error算法为 norm(Ax-f,2)，即暂时存储向量的2范数

% 读取opts中的参数
N = opts(1);
eps = opts(2);
tol = opts(3);

%设定最大迭代次数,最多当然不超过N-1次
Max_itr = max(100,N-1);
cnt = 0;

% 初始化 x，应题目要求，应当为全1向量
x = ones((N-1)*(N-1),1);
% 计算初始误差r0
r = f - A*x;
err = norm(r);
% 算出误差的终止阈值
thres = err*tol;
% rho = r'*z
rho = 0;

% 误差没有达到要求且未到达最大迭代次数是，继续迭代
while err> thres && cnt<Max_itr
    % 更新迭代次数
    cnt = cnt + 1;
    % z为预条件得到的向量
    z = V(N,r,eps,mode);
    % 预条件共轭梯度法步骤
    rhop = rho;
    rho = r'*z;
    if cnt == 1
        p = z;
    else
        beta = rho/rhop;
        p = z + beta*p;
    end
    w = A*p;
    alpha = rho/(p'*w);
    % 更新 r
    r = r - alpha*w;
    % 更新 x
    x = x + alpha*p;
   
    % 记录本次error
    err = norm(r);
    err_record(cnt,1) = err;
end

end

