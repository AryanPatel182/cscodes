% Jacobi Method
clc;
clear;
close all;

% Ax = b;
A = [9 1 1 1;1 8 1 1;1 1 7 1;1 1 1 6] ;
b = [75 54 43 34]' ;
x0 = [0 0 0 0]' ;
tolerance = 0.00005 ; 
x = [7 5 4 3]' ; % Given Answer

diagA = diag(A) ;
A = A - diag(diagA) ;
relerr = norm(x-x0) ;
error = [relerr] ; % Error values
kvalue = [0];     % Keeps track of number of iterations
xvalues = [x0];   % For answers
ratio = [0]' ;    % For Error ratio

while relerr > tolerance
    x1 = (b-A*x0)./diagA ;
    relerr = norm(x-x1) ;
    error = [error;relerr] ;
    xvalues = [xvalues x1];
    x0 = x1 ;
end
xvalues = (xvalues)'; % Answer of variables
n = length(error) ;

% counting ratio of error values
for i=2:n
   ratio = [ratio;error(i)/error(i-1)] ; 
end

for i=1:n-1 % k values
    kvalue = [kvalue;i] ; 
end

[m,n] = size(xvalues) ;
Header = [] ; 
for i=1:n
    Header = [Header;"x"+i] ;
end

disp("<strong>Answer Through Jacobi Iteration Method</strong>");
disp(" ");
disp(" ");
xk_table = array2table(xvalues,'VariableNames',Header) ;
var={'k','x(k)','Error','Ratio'} ;
answer_table = table(kvalue,xk_table,error,ratio,'VariableNames',var) ;%An swer table 
disp(answer_table) ;