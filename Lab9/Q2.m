%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Partial Pivoting. method
clear;
clc;
close all;


%C = [5 7 6 5; 7 10 8 7; 6 8 10 9; 5 7 9 10];
%b = [1 -1 -1 1]';
C = [1 1/2 1/3 1/4;    1/2 1/3 1/4 1/5;   1/3 1/4 1/5 1/6;   1/4 1/5 1/6 1/7];
b = [1 -1 1 -1]';

[n,m]= size(C);   
if m~=n
    disp('The matrix is not Square Matrix');
end
m=length(b);
if m~=n
    disp('The dimension of matrix and vector are not same');
end
A = [C b];      %Combined matrix
n = size(A,1);  %Number of variables
answer = zeros(n,1);

for i = 1:n-1        %Elimination 
    piv = i;
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
            tmp = A(i,:);
            A(i,:) = A(j,:);
            A(j,:) = tmp;        
        end
    end
    while A(piv,i)== 0 && piv <= n
        piv = piv+1;
    end
    if piv == n+1
        disp('No Unique Solution Exist');
        break
    else
        if piv ~= i
            tmp1 = A(i,:);
            A(i,:) = A(piv,:);
            A(piv,:) = tmp1;
        end
    end
    
    for j = i+1:n
        alpha = A(j,i)/A(i,i);
        for k = i+1:n+1 
            A(j,k) = A(j,k) - alpha*A(i,k);
        end
    end
end

if A(n,n) == 0
    disp('No Unique Solution Exist');
    return
end

%Backward Substitution
answer(n) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
        answer(i) = ( A(i,n+1) - A(i,i+1:n)*answer(i+1:n) )/A(i,i);
end

digits(4)
disp('<strong> Answer : </strong>');
disp(vpa(answer));