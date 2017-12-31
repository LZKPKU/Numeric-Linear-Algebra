A = [2,3,4,5,6;4,4,5,6,7;0,3,6,7,8;0,0,2,8,9;0,0,0,1,10];
n = length(A);
% 上Hessenberg化
H = Hessenberg(A);
k = 0;
u=1e-32;
H22_end = n;
while(H22_end>2)
k = k + 1; 
 % Find smallest quasi-upper triangular
   while H22_end>2 && (H(H22_end,H22_end-1)==0 || H(H22_end-1,H22_end-2)==0)
       if H(H22_end,H22_end-1)==0
           H22_end = H22_end-1;
       elseif H(H22_end-1,H22_end-2)==0
           H22_end = H22_end-2;
       end
   end

    if H22_end>1
      H22_begin = H22_end-1;
      % Find the smallest unreduced Hessenberg
      while H22_begin>1 && abs(H(H22_begin,H22_begin-1))~=0
         H22_begin = H22_begin-1;
      end
      % H22
      [H(H22_begin:H22_end,H22_begin:H22_end),P] = QR_double_itr(H(H22_begin:H22_end,H22_begin:H22_end));

      for j=H22_begin:H22_end-1
         if abs(H(j+1,j)) <= u*(abs(H(j,j))+abs(H(j+1,j+1)))
            H(j+1,j) = 0;
         end
      end  
    end
    % 记录次对角线元素
    for o = 1:4
    res(k,o) = H(o+1,o);
    end 
    H
end

for k=1:n-1
    if H(k+1,k)~=0
        [Q,H(k:k+1,k:k+1)] = schur(H(k:k+1,k:k+1));
    end
end
