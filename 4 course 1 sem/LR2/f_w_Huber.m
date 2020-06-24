 function psi = f_w_Huber(z, c)
     %UNTITLED2 Summary of this function goes here
     %   Detailed explanation goes here
     z = abs(z);
     if z < c
psi = 1; else
psi = c/z; end