function xy = f_calc_xy_coords(pol,r0)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    xy = r0 + [pol(1)*cos(pol(2)); pol(1)*sin(pol(2))];
end

