function [] = show(time,error,mode,iter,opts)
% ���չʾ����
% time�ǵ���ʱ�䣬error��ָ�����mode�����,iter��ÿ�ε������,opts�ǲ���

% ��˹��ȥ��,��һ��
if strcmp(mode,'ge') == 1
    fprintf('Gauss Elimination Method:\n')
    fprintf('Parameters: N = %d, eps= %3.2e\n',opts(1),opts(2));
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
end

% �� G-S���ڶ���
if strcmp(mode,'lgs') == 1
    iter = iter / opts(1);
    totiter = size(iter,1);
    fprintf('Line Gauss-Seidel Iteration:\n')
    fprintf('Parameters: N = %d, eps= %3.2e,tolerance= %3.2e\n',opts(1),opts(2),opts(3));
    fprintf('Iteration times: %d\n',totiter);
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
    plot(1:totiter,iter);
end

% �� G-S��������
if strcmp(mode,'pgs') == 1
    iter = iter / opts(1);
    totiter = size(iter,1);
    fprintf('Point Gauss-Seidel Iteration:\n')
    fprintf('Parameters: N = %d, eps= %3.2e,tolerance= %3.2e\n',opts(1),opts(2),opts(3));
    fprintf('Iteration times: %d\n',totiter);
    fprintf('cpu: %5.2f, error to ground truth: %3.2e\n', time, error);
    plot(1:totiter,iter);
end

