function [x,err_record] = pcg(A,f,opts,mode)
% Ԥ���������ݶȷ�����
% ���룺 A��ϵ������fΪ����������optsΪ��Ϊ�趨�Ĳ�����modeΪģʽ
% ����� Ax=f�Ľ�x���Լ�����������ÿһ�������err_record
% ��ע�� 1.opts�У���һ��Ϊ��ģN���ڶ���Ϊeps��������Ϊ��ֹ�����е�tol
%        2.mode�У�'line'Ϊ��GS������'point'Ϊ��GS����
%        3.error�㷨Ϊ norm(Ax-f,2)������ʱ�洢������2����

% ��ȡopts�еĲ���
N = opts(1);
eps = opts(2);
tol = opts(3);

%�趨����������,��൱Ȼ������N-1��
Max_itr = max(100,N-1);
cnt = 0;

% ��ʼ�� x��Ӧ��ĿҪ��Ӧ��Ϊȫ1����
x = ones((N-1)*(N-1),1);
% �����ʼ���r0
r = f - A*x;
err = norm(r);
% ���������ֹ��ֵ
thres = err*tol;
% rho = r'*z
rho = 0;

% ���û�дﵽҪ����δ���������������ǣ���������
while err> thres && cnt<Max_itr
    % ���µ�������
    cnt = cnt + 1;
    % zΪԤ�����õ�������
    z = V(N,r,eps,mode);
    % Ԥ���������ݶȷ�����
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
    % ���� r
    r = r - alpha*w;
    % ���� x
    x = x + alpha*p;
   
    % ��¼����error
    err = norm(r);
    err_record(cnt,1) = err;
end

end

