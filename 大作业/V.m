function [x] = V(N,r,eps,mode)
% �������� V-cycle���ⷽ�� Ax = r������A��N��eps��Ϣ�ó�
% ���룺�����ģN,��������r������eps��ģʽmode
% ��������̵Ľ� x
% ��ע��1.�ú�����Ҫ�ݹ���ã���ϵ������A������N�ı仯���仯����˽��
%       Data_A����������ģN�ڵݹ�ʱ��Ϊ���
%       2.mode�����˹⻬�ӵ����ͣ�'line'Ϊ��GS������'point'Ϊ��GS����

% ��N��һ����ģ�����ˣ���ֱ�ӵ��õ�һ���и�˹��ȥ������ֱ�����
% �����趨Ϊ 8
if N > 8
    itr = 5;
    % ����ϵ������ A
    A = Data_A(N,eps);
    m = size(A,1);
    if strcmp(mode,'point') == 1
        % ��GS������itrΪ����������
        x = pgs(A,r,zeros(m,1),itr);
    else 
        % ��GS����
        x = lgs(N,eps,r,zeros(m,1));
    end
    % ĥ��֮���ٴμ���r
    r = r - A*x;
    % �������ӣ���r���Ƶ����ֵ�������
    [newr,newN] = restrict(N,r);
    % �ݹ���ã�������һ������
    Vx = V(newN,newr,eps,mode);
    % ������һ�㷵�ص�x���������������ص���ǰ��������
    Vx = lift(newN,Vx);
    
    if strcmp(mode,'point') == 1
        % �����������������ʼ�⣬����ĥ��
        % ��GS����
        x = x + pgs(A,r,Vx,itr); 
    else 
        % ��GS����
        x = x + lgs(N,eps,r,Vx); 
    end
else
    % ֱ�����
    
    % ����ϵ������ A
    A = Data_A(N,eps);
    % ���ø�˹��ȥ�����
    x = Gauss(A,r);
end

