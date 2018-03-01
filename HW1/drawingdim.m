%% (*) Function of Plotting
function [] = drawingdim(X, T_noise, W, M, numOfData)

    % Drawing base graph
    X_draw = linspace(0, 1);
    T_sin = sin(2 * pi * X_draw);

    plot(X_draw, polyval(W, X_draw));
    hold on;
    plot(X, T_noise, 'o');
    hold on;
    plot(X_draw, T_sin);
    title(['Dimension = ' num2str(M - 1) ', Data = ' num2str(numOfData)])
    
end