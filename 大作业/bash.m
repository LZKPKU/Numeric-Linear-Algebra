% Bash File for Final Project %
%  Numerical Linear Algebra   %
%    Li Zekun 1500017841      %  
%         2018.1.22           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1 (Gauss Elimination method)
% N = 64,eps=1
opts1 = [64,1];
A = Data_A(opts1(1),opts1(2));
% f 是使用公式算出的（1+eps）*pi*pi*gt
f = Data_f(opts1(1),opts1(2));
% 真实值
% gt = Data_gt(opts1(1),opts1(2));
tic;
out1 = Gauss(A,f);
t1 = toc;
err1 = calc_err(out1,opts1(1));
show(t1,err1,'ge',0,opts1);

% Problem 1 (Gauss Elimination method)
% N = 64,eps=1e-3
opts2 = [64,1e-3];
A = Data_A(opts2(1),opts2(2));
% f 是使用公式算出的（1+eps）*pi*pi*gt
f = Data_f(opts2(1),opts2(2));
% 真实值
% gt = Data_gt(opts2(1),opts2(2));
tic;
out2 = Gauss(A,A*gt);
t2 = toc;
err2 = calc_err(out2,opts2(1));
show(t2,err2,'ge',0,opts2);

% Problem 1 (Gauss Elimination method)
% N = 64,eps=1e-5
opts3 = [64,1e-5];
A = Data_A(opts3(1),opts3(2));
% f 是使用公式算出的（1+eps）*pi*pi*gt
f = Data_f(opts3(1),opts3(2));
% 真实值
% gt = Data_gt(opts3(1),opts3(2));
tic;
out3 = Gauss(A,A*gt);
t3 = toc;
err3 = calc_err(out3,opts3(1));
show(t3,err3,'ge',0,opts3);

% Problem 2 
% 对称线GS迭代法作为光滑子
% V多重网格作为预条件子
% 预条件共轭梯度法

% N = 32 64 128 256 512 1024
% eps = 1 1e-1 1e-3 1e-5 1e-7
N = [32,64,128,256,512];
eps = [1,1e-1,1e-3,1e-5,1e-7];
for i = 1:5
    for j = 1:5
        opts4(1,1) = N(i);
        opts4(1,2) = eps(j);
        opts4(1,3) = 1e-6;
        A = Data_A(opts4(1),opts4(2));
        f = Data_f(opts4(1),opts4(2));
        tic;
        [out4,iter4] = pcg(A,f,opts4,'line');
        t4 = toc;
        err4 = calc_err(out4,opts4(1));
        show(t4,err4,'lgs',iter4,opts4);         
    end
end   

% much slower for 1024*1024
% about 80 seconds
opts5 = [1024,1,1e-6];
A = Data_A(opts5(1),opts5(2));
f = Data_f(opts5(1),opts5(2));
tic;
[out5,iter5] = pcg(A,f,opts5,'line');
t5 = toc;
err5 = calc_err(out5,opts5(1));
show(t5,err5,'lgs',iter5,opts5);        


% Problem 3
% 对称点GS迭代法作为光滑子
% V多重网格作为预条件子
% 预条件共轭梯度法

% N = 256, eps = 1e-5
opts6 = [256,1e-5,1e-6];
A = Data_A(opts6(1),opts6(2));
f = Data_f(opts6(1),opts6(2));
tic;
[out6,iter6] = pcg(A,f,opts6,'point');
t6 = toc;
err6 = calc_err(out6,opts6(1));
show(t6,err6,'pgs',iter6,opts6);
