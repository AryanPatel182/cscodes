% Gauss-Seidel Method
clear;
clc;
close all;

A = [9 1 1 1;1 8 1 1;1 1 7 1;1 1 1 6] ;
b = [75 54 43 34]' ;
x = [7 5 4 3]' ;
x0 = [0 0 0 0]' ;
tolerance = 0.00005 ;
n = length(b) ;
x1 = x0 ;
k = [0] ;
relerr = norm(x-x0) ;
error = [relerr] ; % Error values
ratio = [0]' ;      % For Error ratio
kvalue = [0];   % Keeps track of number of iterations
xvalues = [x0]; % For answers

while relerr>tolerance
    x1(1) = (b(1)-A(1,2:n)*x0(2:n))/A(1,1) ;
    for i=2:n-1
       x1(i) = (b(i)-A(i,1:i-1)*x1(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i) ; 
    end
    x1(n) = (b(n)-A(n,1:n-1)*x1(1:n-1))/A(n,n) ;
    relerr = norm(x-x1) ;
    error = [error;relerr] ;
    xvalues = [xvalues x1] ;
    x0 = x1 ;
end

xvalues = xvalues';  % Answer of variables
n = length(error) ;

% counting ratio of error values
for i=2:n
   ratio = [ratio;error(i)/error(i-1)] ; 
end

for i=1:n-1 % k values
    kvalue = [kvalue;i] ; 
end
[m,n] = size(xvalues) ;
Head = [] ; 
for i=1:n
    Head = [Head;"x"+i] ;
end

disp("<strong>Answer Through Gauss-Seidel Iteration Method</strong>");
disp(" ");
disp(" ");

output_table = array2table(xvalues,'VariableNames',Head) ;
var={'k','x(k)','Error','Ratio'} ;
Tab=table(kvalue,output_table,error,ratio,'VariableNames',var) ;%An swer table 
disp(Tab) ;