clc;
clear;
close all;

f=@(x)(exp(-x^2)); %Function
a = -1;
b = 1;
I = [];
eq = 0;
n = [2;3];

% n = 2
w1 = 1 ; x1 = -1/sqrt(3);
w2 = 1 ; x2 = 1/sqrt(3);
eq = w1*f(x1) + w2*f(x2);
I = [I;eq];

% n = 3
w1 = 5/9 ; x1 = -sqrt(3/5);
w2 = 8/9; x2 = 0;
w3 = 5/9; x3 = sqrt(3/5);
eq = w1*f(x1) + w2*f(x2) + w3*f(x3);
I = [I;eq];


fprintf('I (for n = 2) = <strong>%f</strong>\n\n',I(1));
fprintf('I (for n = 3) = <strong>%f</strong>\n\n',I(2));

ans_table = table(n,I); % answer table
display(ans_table);