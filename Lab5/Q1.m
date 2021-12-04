%Piece-wise linear Interpolation

clc;
close all;
clearvars;


f = @(x)(1./(1+x.^2));    % Function f(x)

xval = [-1,-5/6,-2/3,-1/2,-1/3,-1/6,0,1/6,1/3,1/2,2/3,5/6,1];
yval = f(xval);

val = [];
res = [];
axis = [];

for i=1:length(xval)-1
    u = linspace(xval(i), xval(i+1), 100)';
        
    for j=1:length(u)
        x = u(j);        
         % Equation
         y = ((x - xval(i+1))/(xval(i) - xval(i+1))) * yval(i);
         y = y + ((x - xval(i))/(xval(i+1) - xval(i))) * yval(i+1);
        
        res = [res,y];
        axis = [axis,u(j)];
        val = [val, f(u(j))];
    end
end

figure();
plot(axis,val,'k--','linewidth',1);
hold on;
plot(xval,yval,'bo',axis,res,'r-');
legend('Orginal function','Points','Linear interpolation result','location','South');
title('Linear Interpolation')
xlabel('X');
ylabel('Y');
grid on;

figure();
plot(axis, abs(res-val),'k');
title('Absolute error Value');
xlabel('X');
ylabel('Error');
grid on;






