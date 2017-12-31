n=50;
A = 4*eye(n)+diag(ones(n-1,1),1)+diag(ones(n-1,1),-1);

A = tri_diag(A);

Lambda = implicit_sym_QR(A);