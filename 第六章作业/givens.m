function [c,s] = givens(a,b)
% Givens 变换
% 输入：两个数字a，b
% 输出：相应的c，s.这样的Givens变换可以转化为r，0.
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

