function [c,s] = givens(a,b)
% Givens �任
% ���룺��������a��b
% �������Ӧ��c��s.������Givens�任����ת��Ϊr��0.
if b==0
    c=1;s=0;
else
    if abs(b)>abs(a)
        tao = a/b;s=1/sqrt(1+tao^2);c=s*tao;
    else
        tao = b/a;c=1/sqrt(1+tao^2);s=c*tao;
    end
end

end

