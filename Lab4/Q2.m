clc;
close all;
clearvars;
syms x; % Sys x 
Function = 0;
X = [0.85 0.87 0.89]; % Initial points
Y = exp(X);
number_of_points = length(X);
DD_Table = zeros(number_of_points, number_of_points); % Divided Difference Table
DD_Table(:, 1) = Y'; j =2;

while j <= number_of_points
    for i = 1 : (number_of_points - j + 1)
        DD_Table(i,j) = (DD_Table(i + 1, j - 1) - DD_Table(i, j - 1))/(X(i + j - 1) - X(i));
    end
    j = j + 1;
end

disp(('Divided Difference Table'));
disp(DD_Table); i = 1;
while i <= number_of_points
    L = DD_Table(1,i); % Coeff
    for j = 1 : i-1
        L=L * (x - X(j));
    end
    Function = Function + L;
    i = i+1;
end

disp([ 'Function f(x) = ',convertStringsToChars(string(simplify(Function)))]);
figure(1);
d = (max(X)-min(X))/50;

min_X = min(X)-d;
max_X = max(X)+d;
plot_X = min_X : d : max_X; % Plot obtained function
plot_Y_li = vpa(subs(Function,x,plot_X));
plot(plot_X,plot_Y_li,'b','LineWidth',1.5);
hold on;
plot_Y_original = exp(plot_X);

plot(plot_X,plot_Y_original,'r--','LineWidth',1.5); %Plot original function
hold on;
scatter(X, Y,'b','Marker','o','LineWidth',1,'MarkerFaceColor','r');
grid on;
hold on;
legend('Obtained Function','Original Function','Given Points', 'Location','NorthWest','FontSize',10);
title({'Interpolation using Divided Difference Table'},'FontSize',10);
xlabel('X','FontSize',10);
ylabel('Y','FontSize',10);
xlim([min_X max_X]);
ylim([2.32 2.44]);
%saveas(gcf,'Q2_fun.png');

figure(2);
semilogy(plot_X, abs(plot_Y_li-plot_Y_original), 'k','LineWidth',1.5);
title('Absolute Error Plot','FontSize',12);
hold on;
grid on;
xlabel('X','FontSize',12);
ylabel('Absolute Error','FontSize',12);
xlim([min_X max_X]);
%saveas(gcf,'Q2_err.png');


%%

clc;
close all;
clearvars;
syms x; % Sys x 
Fun = 0;
X = [0.85 0.87 0.89]; % Given points
Y = exp(X);
n = length(X);
D_Table = zeros(n, n); % Divided Difference Table
D_Table(:, 1) = Y'; 
jj =2;

while jj <= n       %Calculations in this loop
    for i = 1 : (n - jj + 1)
        D_Table(i,jj) = (D_Table(i + 1, jj - 1) - D_Table(i, jj - 1))/(X(i + jj - 1) - X(i));
    end
    jj = jj + 1;
end

disp(('Divided Difference Table'));
disp(D_Table); 
for i=1:n
    c = D_Table(1,i); 
    for jj = 1 : i-1
        c=c * (x - X(jj));
    end
    Fun = Fun + c;
end

disp([ 'Obtained Function f(x) = ',convertStringsToChars(string(simplify(Fun)))]);
figure(1);
diff = (max(X)-min(X))/50;

minX = min(X)-diff;
maxX = max(X)+diff;
plotX = minX : diff : maxX; % This is plot for the function that we found
plotYli = vpa(subs(Fun,x,plotX));
plot(plotX,plotYli,'r','LineWidth',1.2);
hold on;
grid on;
plotYoriginal = exp(plotX);
plot(plotX,plotYoriginal,'b--','LineWidth',1.2); % This is plot for the Original function
hold on;
scatter(X, Y,'k','Marker','o','LineWidth',1,'MarkerFaceColor','k');
grid on;
hold on;
legend('Function(Practical)','Original Function','Given Points', 'Location','NorthWest','FontSize',10);
title({'Interpolation using Divided Difference Table'},'FontSize',12);
xlabel('X','FontSize',12);
ylabel('Y','FontSize',12);
xlim([minX maxX]);
ylim([2.30 2.45]);
saveas(gcf,'Q2_fun.png');


figure(2);
semilogy(plotX, abs(plotYli-plotYoriginal), 'k','LineWidth',1);
title('Absolute Error Plot','FontSize',12);
hold on;
grid on;
xlabel('X','FontSize',12);
ylabel('Error(Absolute)','FontSize',12);
xlim([minX maxX]);
saveas(gcf,'Q2_err.png');
