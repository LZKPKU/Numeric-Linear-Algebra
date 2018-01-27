function [x] = V(N,r,eps,mode)
% 多重网格 V-cycle，解方程 Ax = r，其中A由N与eps信息得出
% 输入：问题规模N,常数向量r，常数eps，模式mode
% 输出：方程的解 x
% 备注：1.该函数需要递归调用，其系数矩阵A会随着N的变化而变化，因此结合
%       Data_A函数，传规模N在递归时更为简便
%       2.mode决定了光滑子的类型，'line'为线GS迭代，'point'为点GS迭代

% 当N到一定规模以下了，就直接调用第一问中高斯消去法函数直接求解
% 这里设定为 8
if N > 8
    itr = 5;
    % 构建系数矩阵 A
    A = Data_A(N,eps);
    m = size(A,1);
    if strcmp(mode,'point') == 1
        % 点GS迭代，itr为最大迭代次数
        x = pgs(A,r,zeros(m,1),itr);
    else 
        % 线GS迭代
        x = lgs(N,eps,r,zeros(m,1));
    end
    % 磨光之后再次计算r
    r = r - A*x;
    % 限制算子，将r限制到更粗的网格上
    [newr,newN] = restrict(N,r);
    % 递归调用，进入下一层网格
    Vx = V(newN,newr,eps,mode);
    % 对由下一层返回的x做提升操作，拉回到当前的网格内
    Vx = lift(newN,Vx);
    
    if strcmp(mode,'point') == 1
        % 用提升后的向量做初始解，继续磨光
        % 点GS迭代
        x = x + pgs(A,r,Vx,itr); 
    else 
        % 线GS迭代
        x = x + lgs(N,eps,r,Vx); 
    end
else
    % 直接求解
    
    % 构建系数矩阵 A
    A = Data_A(N,eps);
    % 调用高斯消去法求解
    x = Gauss(A,r);
end

