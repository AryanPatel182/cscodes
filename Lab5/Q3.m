%Piece-wise Cubic Interpolation


clc;
close all;
clearvars;

f = @(x)(1./(1+x.^2));      % Function f(x)

xval = [-1,-5/6,-2/3,-1/2,-1/3,-1/6,0,1/6,1/3,1/2,2/3,5/6,1];
yval = f(xval);

val = [];
res = [];
axis = [];

for i=1:3:length(xval)-3
    u = linspace(xval(i), xval(i+3), 1000);
    x1 = xval(i);
    x2 = xval(i+1);
    y1= yval(i);
    y2 = yval(i+1);
    
    
    for j=1:length(u)
        x = u(j);
        % Equation
        y = (((x - xval(i+1))*(x - xval(i+2))*(x - xval(i+3)))/((xval(i) - xval(i+1))*(xval(i) - xval(i+2))*(xval(i) - xval(i+3)))) * yval(i);
        y = y + (((x - xval(i))*(x - xval(i+2))*(x - xval(i+3)))/((xval(i+1) - xval(i))*(xval(i+1) - xval(i+2))*(xval(i+1) - xval(i+3)))) * yval(i+1);
        y = y + (((x - xval(i))*(x - xval(i+1))*(x - xval(i+3)))/((xval(i+2) - xval(i))*(xval(i+2) - xval(i+1))*(xval(i+2) - xval(i+3)))) * yval(i+2);
        y = y + (((x - xval(i))*(x - xval(i+1))*(x - xval(i+2)))/((xval(i+3) - xval(i))*(xval(i+3) - xval(i+1))*(xval(i+3) - xval(i+2)))) * yval(i+3);
        
        res = [res,y];
        axis = [axis,u(j)];
        val = [val, f(u(j))];
    end
end

figure();
plot(axis,val,'k--','linewidth',1);
hold on;
plot(xval,yval,'bo',axis,res,'r-');
legend('Orginal function','Points','Cubic interpolation result','location','South');
title('Cubic Interpolation')
xlabel('X');
ylabel('Y');
grid on;

figure();
plot(axis, abs(res-val),'k');
title('Absolute error Value');
xlabel('X');
ylabel('Error');
grid on;



