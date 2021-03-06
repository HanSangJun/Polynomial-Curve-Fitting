%% (*) Function of Vandermonde matrix
function [W] = fitting(X, T_noise, M, numOfData)

    % Initialize matrix
    vander = zeros(numOfData, 1);
    diff_grad = zeros(1, M);
    
    % Vandermonde matrix
    i = M;
    while i > 0
        diff_grad(i) = 1;
        vander = [vander polyval(diff_grad, X)];
        diff_grad(i) = 0;
        i = i - 1;
    end;

    A = vander(:, 2:end);
    % Normal equation
    W = (A' * A)\A' * T_noise; 
    W = flipud(W);
    
end