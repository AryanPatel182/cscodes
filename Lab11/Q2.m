clear;
clc;
close all;

%f = @(x,y)(cos(y))^2; % question 1(a)
%y_x = @(x)(atan(x)); %Theoretical Answer

f = @(x,y)((1/(1+x.^2))-2*y.^2); %question 1(b)
y_x = @(x)(x./(1+x.^2)); %Theoretical Answer

h = [0.2 0.1 0.05];
figure(1);
for k=h
 y_0 = 0; % Initial value of y at 0
 X_min = 0;
 X_max = 10;  % 0<=x<=10
 
 itvl1 = 1/k;
 itvl2 = 1/(2*k);
 
 [x1,y1]=euler(f, y_0, X_min, k, X_max); % h(stepsize)
 [x2,y2]=euler(f, y_0, X_min, 2*k, X_max); % 2*h(stepsize)
 
 % Richardson Extrapolation
 Extrapolation = 2.*y1(1:2:length(x1))'-y2'; 
 
 % Euler Approximation
 err1 = y_x(x1(1:2:length(x1)))'-y1(1:2:length(x1))';
 err2 = y1(1:2:length(x1))'-y2';
 
 head = {'x' 'Theoretical' 'y(x)(Euler)' 'y(x)(Richardson)' 'Euler_error' 'Richardson error'};
 % Richardson Error
 Richard_err = y_x(x1(1:2:length(x1)))'-Extrapolation; % Richardson Extrapolation Error 
 answer_tab = table(x1(itvl1+1:itvl1:itvl1*10+1),  y_x(x1(itvl1+1:itvl1:itvl1*10+1)), ...
              y1(itvl1+1:itvl1:itvl1*10+1),Extrapolation(itvl2+1:itvl2:itvl2*10+1)', ...
              abs(err1(itvl2+1:itvl2:itvl2*10+1)'),abs(Richard_err(itvl2+1:itvl2:itvl2*10+1)'),...
              'VariableNames',head); 
 fprintf('\n step-size h = %f \n',k);
 disp(answer_tab);
 figure();
 plot(x1(1:2:length(x1))',abs(err1),'LineWidth',0.8);
 grid on;
 hold on;
 plot(x1(1:2:length(x1))',abs(Richard_err),'LineWidth',0.8);
 title(sprintf('Euler and Richardson Error Comparison for h = %0.2f', k));
 xlabel('x');
 ylabel('Difference / Error');
 legend('Euler error', 'Richardson Error');
 str = ['Lab11_Que3_' num2str(k) '.png'];
 saveas(gcf,str)
 
 figure(1);
 semilogy(x1(1:2:length(x1))',abs(Richard_err),'LineWidth',0.8);
 hold on;
 grid on;
end

title('Richardson Error Comparison')
xlabel('x')
ylabel('Difference / Error')
legend('h = 0.2','h = 0.1','h = 0.05');

str = ('Lab11_Que3_Richard.png');
saveas(gcf,str)

function [time,E_of_x] = euler(f,y0,X_min,h,X_max)
    n = fix((X_max-X_min)/h)+1;     % total intervals
    time = linspace(X_min,X_min+(n-1)*h,n)';
    E_of_x = zeros(n,1);
    E_of_x(1) = y0;
    for i = 2:n
        E_of_x(i)=E_of_x(i-1)+h*f(time(i-1),E_of_x(i-1));
    end
end

