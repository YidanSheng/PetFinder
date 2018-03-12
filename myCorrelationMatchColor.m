function [ score ] = myCorrelationMatchColor(imgA, imgB)
%
%  write your correlation implementation
%
%  NO you cannot use MATLAB's correlation routine
%  the call to corr(.) is here as a benchmark
%  to show you this does really work
%
%  you may not use MATLAB's builtin routines
%  you must implement everything yourself.
%


[ROWS_A, COLS_A, z_a] = size(imgA);
newB = imresize(imgB, [ROWS_A, COLS_A, z_a]);
[ROWS_B, COLS_B, z_b] = size(newB);


aVec = double(reshape(imgA,ROWS_A*COLS_A*z_a,1));
bVec = double(reshape(newB ,ROWS_B*COLS_B*z_b,1));

%According to the formula

numerator = sum(aVec .* bVec) - (sum(aVec) * sum(bVec)) / length(aVec);
denominator = sqrt((sum(aVec .^2) - sum(aVec)^2 / length(aVec)) * (sum(bVec .^2) - sum(bVec)^2 / length(aVec)));
coeff = numerator / denominator;


score = coeff;
end

