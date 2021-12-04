close all;
clc;
clear;

% 0<=x<=10
X_min = 0;
X_max = 10;
h = [0.2, 0.1, 0.05];    % Given vlues of stepsize h
err = zeros(length(h));   %To store ratio at x = 5

for k = 1:3
    time = X_min : h(k) : X_max;  

    E_of_x = zeros(size(time));
    E_of_x(1) = 0;  % Initial Value

    % Euler's method
    i = 1;   
    for x=time        
        ydash_x = 1/(1+(x^2)) - 2*(E_of_x(i))*(E_of_x(i));
        E_of_x(i+1) = vpa(E_of_x(i) + (h(k) * ydash_x));          
        i = i+1;
    end
    
    E_of_x = E_of_x(1:i-1);
    Ana = time./(1+(time.^2));  % Theoritical Solution
    
    Error = abs(Ana - E_of_x);   % Error beteween euler and analytic solution
    err(k) = (Error((length(E_of_x)-1)/2));
    
    figure;
    plot(time,E_of_x,'b');
    hold on;
    plot(time,Ana,'Color','red','LineStyle','--');
    xlabel('x')
    ylabel('Y(x)')
    legend('Euler Method Solution','Exact / Analytical Solution','Location','southeast');
    title(['Y(x) plot for h = ' num2str(h(k)) ]);
    grid on;
    str = ['Lab11_Que1_2_Euler_' num2str(h(k)) '.png'];
    saveas(gcf,str);
    
    
    figure;
    plot(time , Error,'b');
    xlabel('x');
    ylabel('Difference / Error');
    title(['Error Plot for h = '  num2str(h(k))]);
    grid on;
    str = ['Lab11_Que1_2_Error_' num2str(h(k)) '.png'];
    saveas(gcf,str)
end

%Error Ratio
ratio = [0, err(2)/err(1) , err(3)/err(2)]';
disp("<strong>Error Ratio at x = 5</strong>");
head = {'h','ratio'};
answer_table = table(h', ratio, 'VariableNames',head) ;%Answer table 
display(answer_table);