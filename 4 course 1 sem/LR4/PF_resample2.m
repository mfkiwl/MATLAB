function [X, W, I] = PF_resample2(X, W)

% [X, W, I] = PF_resample2(X, W)
%
% ?еализует алгоритм коррекции представл?ющей выборки согласно примеру,
% найденному в Internete

  N = length(W);
  I = zeros(1, N);
  % generate cumulative sum vector for the weights (CSW)
  csw = cumsum(W);
  for i=1:N
    % find CSW index for which the CSW just exceeds the random number
    indx = find(csw > rand, 1, 'first'); 
    % replicate the corresponding particle in the new population
    X(:,i) = X(:,indx);
    I(i) = indx;
  end
  % assign uniform weights to resampled particles
  W = ones(1, N)/N; 
  
end