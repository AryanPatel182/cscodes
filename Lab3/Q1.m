% Secant method 
clc;
clear;
close all;

f=@(x)x^3-x^2-x-1;  % f(x)

x0=input('\n Enter left point of interval ');
x1=input('\n Enter right point of interval ');
epsilon=10^(-6);   % error tolerance
err=abs(x1-x0);

%Formula x= x1 - [(x0 - x1)/ (f(x0) - f(x1)]f(x1) .
n = 0;
if(f(x0)*f(x1) > 0)
    fprintf('\n Wrong Input \n');
else
    while err > epsilon
        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        x0=x1;        
        x1=x2;
        err=abs(x1-x0);
        root=x2;
        n = n+1;
    end

    fprintf('\n Answer : %4.9f \n',root);
 
end
