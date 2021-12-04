% Newton Method for Nonlinear equations
clear;
clc;
close all;

f1 = @(x)x(1)^2+4*x(2)^2-4 ;  % f(x,y)
f2 = @(x)x(1)^2-0.4*x(1)-x(2)-1.96 ;  % g(x,y)
x = [1 1;-1 1;-1 -1;1 -1] ; % Initial points
[m,n] = size(x) ;

disp("<strong>Answer Through Newton Method</strong>");
disp(" ");
disp(" ");

% Neton's method for solution
for i=1:m
    x1 = [x(i,1) x(i,2)]' ;
    for j=1:10
        F = [f1(x1);f2(x1)] ;
        J = fdash(x1) ;
        x1 = x1 - inv(J)*F ;
    end 
    fprintf('Solution for Initial Point (x0,y0)=(%d,%d) is (x,y)=(%f,%f)\n',x(i,1),x(i,2),x1(1),x1(2)) ;
end

% Function for derivatives of f(x,y) and g(x,y)
function df_val = fdash(x)    
    df_val = [2*x(1),8*x(2);2*x(1)-0.4,-1] ;
end
