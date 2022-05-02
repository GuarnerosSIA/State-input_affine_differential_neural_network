function [y, e] = eig_vals_eval(A)
% This funciton evaluates if all eigenvalues of the matrix A are negatvies
% for stability purposes

% Add elements for saving the eigenvalues


% Obtain eigenvalues
e = eig(A);
% Size of A matrix
e_length = length(e);
cont = 0;
for i = 1:e_length
    % Evaluate condition
    if e(i) < 0
        cont = cont + 1;
    end
end

% Verifiy negative eigenvalues number
if cont == e_length
    h = 1;
else
    h = 0;
end
y = h;
