function [] = show(time,error,mode,iter,opts)
% 结果展示函数
% time是迭代时间，error是指相对误差，mode是题号,iter是每次迭代误差,opts是参数

% 高斯消去法,第一问
if strcmp(mode,'ge') == 1
    fprintf('Gauss Elimination Method:\n')
    fprintf('Parameters: N = %d, eps= %3.2e\n',opts(1),opts(2));
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
end

% 线 G-S，第二问
if strcmp(mode,'lgs') == 1
    iter = iter / opts(1);
    totiter = size(iter,1);
    fprintf('Line Gauss-Seidel Iteration:\n')
    fprintf('Parameters: N = %d, eps= %3.2e,tolerance= %3.2e\n',opts(1),opts(2),opts(3));
    fprintf('Iteration times: %d\n',totiter);
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
    plot(1:totiter,iter);
end

% 点 G-S，第三问
if strcmp(mode,'pgs') == 1
    iter = iter / opts(1);
    totiter = size(iter,1);
    fprintf('Point Gauss-Seidel Iteration:\n')
    fprintf('Parameters: N = %d, eps= %3.2e,tolerance= %3.2e\n',opts(1),opts(2),opts(3));
    fprintf('Iteration times: %d\n',totiter);
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
    plot(1:totiter,iter);
end

