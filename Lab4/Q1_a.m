clc;
close all;
clearvars;
syms x; % Sys x
Func = 0;
X = [0 1 2]; % initial points 
Y = [1 2 3];
number_of_points = length(X); i = 1;

while i <= number_of_points % Calculation    
    L = Y(i); % Coeff
    for j = 1 : number_of_points
        if j ~= i
            L = L * ((x - X(j))/(X(i) - X(j))); % Formula
        end
    end
    Func = Func + L;
    i = i+1;
end

disp([ 'Function f(x) = ',convertStringsToChars(string(simplify(Func)))]);

figure(1); % open figure
var = (max(X)-min(X))/50;
min_X = min(X)-var;
max_X = max(X)+var;
plot_X = min_X : var : max_X; % Plot the function
plot_Y = vpa(subs(Func,x,plot_X));
plot(plot_X,plot_Y,'b','LineWidth',0.7);
hold on;
scatter(X, Y,'r','Marker','o','LineWidth',0.7,'MarkerFaceColor','r');
grid on;
hold on;

legend('Obtained Function','Given Points','Location','NorthWest','FontSize',12);
title({'',['Func f(x) = ',convertStringsToChars(string(simplify(Func)))]},'FontSize',12);
xlabel('X','FontSize',12);
ylabel('Y','FontSize',12);
xlim([min_X,max_X]);
saveas(gcf,'Q1_a.png');


%% 


clc;
close all;
clearvars;
syms x; % Sys x
Fun = 0;
X = [0 1 2]; % Intitial values given
Y = [1 2 3];
n = length(X);

for i=1:n % Calculations in this loop
    c = Y(i); 
    for j = 1 : n
        if j ~= i
            c = c * ((x - X(j))/(X(i) - X(j))); % Basic Formula
        end
    end
        Fun = Fun + c;
end

diff = (max(X)-min(X))/50;
disp([ 'Obtained Function f(x) = ',convertStringsToChars(string(simplify(Fun)))]);

figure(); % Graph
minX = min(X)-diff; %Finding the minimum value of x
maxX = max(X)+diff; %Finding the maximum value of x
Xlimit = minX : diff : maxX; % x axis of the plot
Ylimit = vpa(subs(Fun,x,Xlimit));
plot(Xlimit,Ylimit,'b','LineWidth',1);
hold on;
grid on;
scatter(X, Y,'k','o','LineWidth',0.7,'MarkerFaceColor','k');
grid on;
hold on;

legend('Function for given Points','Input Points','Location','NorthWest','FontSize',12);
title({'Lagrange''s Interpolation',['Function f(x) = ',convertStringsToChars(string(simplify(Fun)))]},'FontSize',12);
xlabel('X','FontSize',12);
ylabel('Y','FontSize',12);
xlim([minX maxX]);
saveas(gcf,'Q1_a.png');
