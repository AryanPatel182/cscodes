clear; 
clc;
close all;

%given values of h
h = [0.1 ; 0.05; 0.025; 0.0125; 0.00625];
t = 0;   

%function f(x) and f'(x)
f = @(x) exp(x); 
df_dx = @(x) exp(x);

fdash = df_dx(t);

% Formulas  of forward, backward, central difference
forward = (f(t+h)-f(t))./h;
backward = (f(t) - f(t-h))./h;
central = (f(t+h)-f(t-h))./(2.*h);

% Errror values
forward_error = (fdash - forward);
backward_error = (fdash - backward);
central_error = (fdash - central);

% Ratio of Error
forward_ratio = (forward_error(1:end-1)./forward_error(2:end));
forward_ratio = [0; forward_ratio];
backward_ratio = (backward_error(1:end-1)./backward_error(2:end));
backward_ratio = [0; backward_ratio];
central_ratio = (central_error(1:end-1)./central_error(2:end));
central_ratio = [0; central_ratio];

fprintf('<strong>Forward Difference Table :</strong>\n\n');

forward_answer_table = table(h,forward,forward_error,forward_ratio); % answer table
disp(forward_answer_table);

fprintf('<strong>Backward Difference Table :</strong>\n\n');

backward_answer_table = table(h,backward,backward_error,backward_ratio); % answer table
disp(backward_answer_table);

fprintf('<strong>Central Difference Table :</strong>\n\n');
central_answer_table = table(h,central,central_error,central_ratio); % answer table
disp(central_answer_table);


%%


h = [0.1 ; 0.05; 0.025; 0.0125; 0.00625];
t = 0;   
f = @(x) exp(x); 
df_dx = @(x) exp(x);
fdash = df_dx(t);
forward = (f(t+h)-f(t))./h;
backward = (f(t) - f(t-h))./h;
central = (f(t+h)-f(t-h))./(2.*h);
forward_error = (fdash - forward);
backward_error = (fdash - backward);
central_error = (fdash - central);
forward_ratio = (forward_error(1:end-1)./forward_error(2:end));
forward_ratio = [0; forward_ratio];
backward_ratio = (backward_error(1:end-1)./backward_error(2:end));
backward_ratio = [0; backward_ratio];
central_ratio = (central_error(1:end-1)./central_error(2:end));
central_ratio = [0; central_ratio];

forward_error 
backward_error
central_error
forward_ratio
backward_ratio
central_ratio