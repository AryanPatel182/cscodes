% Newton's Method
clc;
clear;
close all;

syms x
f = @(x) (x^5 - 2);
fdash = @(x) (5*(x^4));
x=2;                                         %setting initial value
eps= 1e-6;                                         %initialize error bound eps
error = 1;                                      % initial error
n=0; 

% Eqn:  y = x - f(x)/f'(x)

while error>=eps                        %set while-conditions
    y = x - (vpa(f(x))/vpa(fdash(x)));  %compute next iterate        
    error=abs(y-x);                              %compute error
    x=y;
    n=n+1;                                 %update x and n
end                                            %end of while-loop
x
fprintf('The root was found to be: %f\n',x) 


%%


clc;
close all;
clear all;
syms x;
f_x = x^5 - 2; % f(x)
g = diff(f_x); % f'(x)
allowed_error = 10^-6; % Error Tolerance
x0 = 1;

while 1
    f_x0 = vpa(subs(f_x,x,x0)); % f(x0)
    f_x0_def = vpa(subs(g,x,x0)); % f'(x0)
    if f_x0_def == 0
       fprintf('Slope becomes zero');
    end
    y= x0 - (f_x0/f_x0_def); % Newton Formula
    err = abs(y-x0);
    if err < allowed_error
        break
    end
    x0=y;
end
fprintf('The Root is : %f \n',y);