%% (*) Function of Error function
function [error] = error_function(X, T_noise, W, numOfData, lambda)

    % Compute error
    sum_square = ((1 / 2) * sum((polyval(W, X) - T_noise) .^ 2)) + ((lambda / 2) * (W' * W));
    error = sqrt((2 * sum_square) / numOfData);
    
end