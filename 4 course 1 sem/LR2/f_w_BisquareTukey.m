 function w = f_w_BisquareTukey(z, c)
     z = abs(z);
     if z < c
        w = (1 - (z/c)^2)^2; 
     else
        w = 0;
     end