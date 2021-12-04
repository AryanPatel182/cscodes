% Simpsons Method
clc;
clear;
close all;

f = @(x)(x.^2);    % Function f(x)

a = 1;
b = 2;
n = 4;
delx = (b-a)/n;

xvals = a;
for i= 1:n
    xvals = [xvals,a+i*delx];
end

yvals = f(xvals);

ans = (yvals(1) + yvals(n+1));

for i = 2:n
    if mod(i,2)== 0
        ans = ans + 4*yvals(i);
    else
        ans = ans + 2*yvals(i);
    end        
end
ans = (ans*(delx))/3;


%% 


% Simpsons Method

clc;
clear;
close all;

integrals = [];
ratios = [];

f = @(x)((exp(x).*cos(4.*x)));    % Function f(x)

ecp = [2,4,8,16,32];
for loop = 1:5
    a = 0;
    b = pi;
    n = ecp(loop);
    delx = (b-a)/n;

    xvals = a;
    for i= 1:n
        xvals = [xvals,a+i*delx];
    end

    yvals = f(xvals);
    
    area = (yvals(1) + yvals(n+1));

    for i = 2:n
        if mod(i,2)== 0
            area = area + 4*yvals(i);
        else
            area = area + 2*yvals(i);
        end        
    end
    area = (area*(delx))/3;
    integrals(loop) = area;
    if loop>1
        ratio(loop) = integrals(loop-1)/integrals(loop);
    end
end




%%

clc;
close all;
clearvars;


syms x;
f(x) = 1./(1+(x-pi).^2);     %Integration Function%
%f(x) = exp(x).*cos(4.*x);
a = 0;
%b = pi;
b = 5;
disp(['    1. f(x) = <strong>',char(f),'</strong>']);

%%Theoretical Value%%
I_theoritic = double(int(f,[a b]));       
fprintf('       I (Theoritically) = <strong>%f</strong>\n\n',I_theoritic);

% Simpsons Rule
    n = zeros(9,1); % This is for 9 different values of n=2,4,8,....,256,512
    int_of_f = zeros(9,1); % Integration of f.
    Error = zeros(9,1); %  Error
    Ratio = zeros(9,1); %  Error Ratio
    asymperr = zeros(9,1); %  Asymptotic Error
    asympratio = zeros(9,1); %  Asymptotic Error Ratio
    f_third_dif = diff(diff(diff(f,x),x),x); % f'''(x)
    
    for i=1:9
        n(i)=2^i;
        h=(b-a)/n(i);
        xi = zeros(1,n(i)+1); 
        y = zeros(1,n(i)+1);  
        xi(1)=a;
        y(1) = double(f(a));
        int_of_f(i) = y(1);
        for j=2:n(i)+1      
            xi(j)=xi(j-1)+h;
            y(j)=double(f(xi(j)));
            if j<=n(i) && mod(j,2)==0
                int_of_f(i)=int_of_f(i)+4*y(j);
            elseif j<=n(i) && mod(j,2)==1
                int_of_f(i)=int_of_f(i)+2*y(j);
            else
                int_of_f(i)=int_of_f(i)+y(j);
            end
        end
        int_of_f(i) = h*int_of_f(i)/3;
        % Asymptotic Error
        asymperr(i) = -((h^4)*(f_third_dif(b)-f_third_dif(a)))/180;  
    end
    
    Error = I_theoritic - int_of_f; %  Error

    asympratio(2:9) = asymperr(1:8)./asymperr(2:9); % Asymtotic Error Ratio
    Ratio(2:9) = Error(1:8)./Error(2:9); % Error ratio
    simpson_table = table(n,int_of_f,Error,Ratio,asympratio,asymperr); % answer table
    disp('<strong> Answer by Simpson Rule</strong>');
    disp(simpson_table);