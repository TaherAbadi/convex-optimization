C = [1; 2; 3];
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
b = [10; 20; 30]; 
alpha = 0.01; 
max_iter = 275;

n = length(C);
x = zeros(n, 1);

for iter = 1:max_iter
    grad = -C; 
    for i = 1:length(b)
        if A(i, :) * x > b(i)
            grad = grad + A(i, :)';
        end
    end
    x = x - alpha * grad; 
    
    x(x < 0) = 0;

    plot(iter, C'*x, 'bo');
    hold on;
end

hold off;
title('Objective Value over Iterations');
xlabel('Iteration');
ylabel('Objective Value (C^T x)');
disp('Optimal x:');
disp(x);
disp('Maximum Value of C^T x:');
disp(C'*x);
%%
options = optimoptions('linprog','Algorithm','interior-point');
[x, fval, exitflag, output] = linprog(-C, A, b, [], [], lb, [], options);

% Display the result
disp('Optimal x:');
disp(x);
disp('Maximum Value of C^T x:');
disp(-fval); % Negate because we minimized -C^T x
