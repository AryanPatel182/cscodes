%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gauss elimination method
clear;
clc;
close all;

% Standard form : Ax = B

A = [ 2 1 -1;
      4 0 -1;
     -8 2  2];

b= [6 6 -8]';
 
[n,m]= size(A);
if m~=n 
    disp('The matrix is not Square Matrix');
end
m = length(b);

if m~=n
    disp('The dimension of matrix and vector are not same');
end

A = [A b]; %Combined Matrix ( Augmanted Matrix )
n=size(A,1);  %Total Number of variables
answer = zeros(n,1); % In Ax = B ans is x matrix
for i=1:n-1
    for j=i+1:n
        tmp = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - tmp*A(i,:);
    end
end

%Backward Substitution 
answer(n) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
    answer(i) = ( A(i,n+1) - A(i,i+1:n)*answer(i+1:n) )/A(i,i);
end

disp('<strong> Answer : </strong>');
disp(answer);