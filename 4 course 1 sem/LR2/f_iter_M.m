     function q = f_iter_M(s, A, sigm, c, q0, stopd, f_w)
     r = (s - A*q0)/sigm;
     M = length(s);
     W = zeros(M,M);
     for i=1:M
         W(i,i) = f_w(r(i), c);
     end
     q1 = inv(A'*W*A)*A'*W*s;
     while abs(q1-q0) > stopd
         q0 = q1;
         r = (s - A*q0)/sigm;
         for i=1:M
             W(i,i) = f_w(r(i), c);
         end
         q1 = inv(A'*W*A)*A'*W*s;
     end
q = q1;