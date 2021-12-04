%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inverse of a matrix using Gauss Elimination method
clear;
clc;
close all;

% Standard form : Ax = B
A = [3 1 1;1 3 1;1 1 3] ;
[m,n] = size(A) ;       %Size of matrix
if m~=n
    disp('The matrix is not Square Matrix');
end
inv_mat = eye(m) ;          
for i = 1:(m-1)
    for j = m:-1:i+1
        if A(i,i)==0
           disp('Given matrix is Singular Matrix') ;
        end
        alpha = A(j,i)/A(i,i) ;
        A(j,:) = A(j,:) - alpha*A(i,:) ;
        inv_mat(j,:) = inv_mat(j,:) - alpha*inv_mat(i,:) ;
    end
end

%Backward Substitution
answer = zeros(m,m) ;        % It stores the answers
l = m;
for k=1:l
    answer(m,k) = inv_mat(m,k)/A(m,m) ;               
    for i = l-1:-1:1                    
        sum = 0 ;
        for j = l:-1:i+1                
            sum = sum + A(i,j)*answer(j,k) ;    
        end 
        answer(i,k) = (inv_mat(i,k)- sum)/A(i,i) ;
    end  
end

disp('<strong> Answer : </strong>');
disp(answer);