clc;
clear;
close all;

e = 5 * 10^(-8);
a = 1;
b = 2;
c = (a+b)/2;
fa = 1-a+sin(a);
fb = 1-b+sin(b);
req = ceil(log((b-a)/e)/(log(2)));
n = 1;

while (b-c)>e    
    fc = 1-c+sin(c);
    if((fb<0) && (fc<0))
        b = c;   
        fb = 1-b+sin(b);
    else
        a = c;
        fa = 1-a+sin(a);
    end             
    c = (a+b)/2;     
    n= n+1;
end

fprintf('By Formula number of iterations :%d\n',req)
fprintf('Root :%d\n',c)
fprintf('Error :%d\n',b-c)




