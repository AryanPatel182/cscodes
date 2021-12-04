clc;
close all;
clearvars;
syms x; % Sys x 
Func = 0;
X = 0.5 : 0.5 : 5.5; % initial 11 points
Y = exp(X);
number_of_points = length(X); i=1;

while i <= number_of_points % Calculation
    L = Y(i); % Coeff
    for j = 1 : number_of_points
        if j ~= i
            L=L * ((x - X(j))/(X(i) - X(j))); % Formula
        end
    end
    Func = Func + L;
    i = i+1;
end

disp([ 'Function f(x) = ', convertStringsToChars(string(simplify(Func)))]);
figure(1);

d = (max(X)-min(X))/1000;
min_X = min(X)-d;
max_X = max(X)+d;

plot_X = min_X : d : max_X; % Plot obtained function
plot_Y_L = vpa(subs(Func,x,plot_X));
plot(plot_X,plot_Y_L,'r','LineWidth',1.5);
hold on;
plot_Y_Original = exp(plot_X);
plot(plot_X,plot_Y_Original,'b--','LineWidth',1.5); %Plot original function
hold on;
scatter(X, Y,'b','Marker','o','LineWidth',1,'MarkerFaceColor','r');
grid on;
hold on;

legend('Obtained Function','Original Function','Given Points', 'Location','NorthWest','FontSize',10);
title('Lagrange''s Interpolating Method','FontSize',12);
xlabel('X','FontSize',12);
ylabel('Y','FontSize',12);
xlim([min_X max_X]);
%saveas(gcf,'Q1_b_fun.png');

figure(2);
semilogy(plot_X, abs(plot_Y_L - plot_Y_Original), 'k','LineWidth',1);
grid on;
title('Absolute Error between original and obtained function','FontSize',12);
hold on;
xlabel('X','FontSize',12);
ylabel('Absolute Error','FontSize',12);
xlim([min_X max_X]);
%saveas(gcf,'Q1_b_err.png');



%%

clc;
close all;
clearvars;
syms x; % Sys x 
Fun = 0;
X = 0.5 : 0.5 : 5.5; % Starting Points
Y = exp(X);
n= length(X); 
for i=1:n % Calculations in this loop
    c = Y(i); 
    for j = 1 : n
        if j ~= i
            c=c * ((x - X(j))/(X(i) - X(j))); % Basic Formula
        end
    end
    Fun = Fun + c;
end
disp([ 'Obtained Function f(x) = ', convertStringsToChars(string(simplify(Fun)))]);
figure();
diff = (max(X)-min(X))/1000;
minX = min(X)-diff;
maxX = max(X)+diff;
plotX = minX : diff : maxX; % This is plot for the function that we found
plotYL = vpa(subs(Fun,x,plotX));
plot(plotX,plotYL,'r','LineWidth',1.2);
hold on;
plotYOriginal = exp(plotX);
plot(plotX,plotYOriginal,'b--','LineWidth',1.2); %This is plot for the original function
hold on;
scatter(X, Y,'k','Marker','o','LineWidth', 0.8,'MarkerFaceColor','k');%Plot for given point
grid on;
hold on;
legend('Function(Obtained)','Original Function','Given Points', 'Location','NorthWest','FontSize',10);
title('Lagrange''s Interpolation Method','FontSize',12);
xlabel('X','FontSize',12);
ylabel('Y','FontSize',12);
xlim([minX maxX]);
saveas(gcf,'Q1_b_fun.png');

figure();
semilogy(plotX,abs(plotYL-plotYOriginal), 'k','LineWidth',1);
grid on;
title('The error between Obtained and Original Function','FontSize',12);
hold on;
xlabel('X','FontSize',12);
ylabel('Absolute Error','FontSize',12);
xlim([minX maxX]);
saveas(gcf,'Q1_b_err.png');