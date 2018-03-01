%% (0) Clear
clear;
close all;
clc;

lambda = 0;

% 20161216
% HAN, SANGJUN in EECS
% HW1 for Machine Learning
% 2016. 10. 25

%% (1) Compare Dimension
figure;
% Drawing to compare dimesion 1
M = 1; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(2, 2, 1); drawingdim(X, T_noise, W, M, numOfData);

% Drawing to compare dimesion 2
M = 2; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(2, 2, 2); drawingdim(X, T_noise, W, M, numOfData);

% Drawing to compare dimesion 3
M = 4; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(2, 2, 3); drawingdim(X, T_noise, W, M, numOfData);

% Drawing to compare dimesion 4
M = 10; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(2, 2, 4); drawingdim(X, T_noise, W, M, numOfData);

%% (2) Compare Dimesion with RNS
for M=2:10
    X_training = sort(rand(30, 1)); X_test = sort(rand(10, 1)); noise_training = 0.3 .* randn(30, 1); noise_test = 0.3 .* randn(10, 1);
    % Generating data set (x,y=sin(2 * pi * X))
    T_training_noise = sin(2 * pi * X_training) + noise_training;
    T_test_noise = sin(2 * pi * X_test) + noise_test;
    W = fitting(X_training, T_training_noise, M, 30);
    error_training(1, M-1) = error_function(X_training, T_training_noise, W, 30, lambda);
    error_test(1, M-1) = error_function(X_test, T_test_noise, W, 10 , lambda);
end;

figure; M = 1:1:9;
plot(M, error_training, '-ro',  M, error_test, '-bo');
legend('Training','Test'); xlabel('M'); ylabel('Erms'); title(['Graphs of the root-mean-square error']);

%% (3) Can more data prevent overfitting?
figure;
% Drawing of 9 dimension and 15 data
M = 10; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(1, 2, 1); drawingdim(X, T_noise, W, M, numOfData);

% Drawing of 9 dimension and 100 data
M = 10; numOfData = 100; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1);
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting(X, T_noise, M, numOfData);
subplot(1, 2, 2); drawingdim(X, T_noise, W, M, numOfData);

%% (4) Can regularization prevent overfitting?
figure;
% lambda = 0, overfitted
M = 10; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1); lambda = 0;
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting_reg(X, T_noise, M, numOfData, lambda);
subplot(1, 2, 1); drawingdim(X, T_noise, W, M, numOfData); xlabel('lambda = 0');

% lambda = 0.01, regularized
M = 10; numOfData = 15; X = sort(rand(numOfData, 1)); noise = 0.3 .* randn(numOfData, 1); lambda = 0.001;
% Generating data set (x,y=sin(2 * pi * X))
T_noise = sin(2 * pi * X) + noise;
W = fitting_reg(X, T_noise, M, numOfData, lambda);
subplot(1, 2, 2); drawingdim(X, T_noise, W, M, numOfData); xlabel('lambda = 0.001');

%% (5) Graph of root-mean-square for lambda value changes
i = 1;
for lambda=0.0000001:0.05:1
    M = 10;
    X_training = sort(rand(30, 1)); X_test = sort(rand(10, 1)); noise_training = 0.3 .* randn(30, 1); noise_test = 0.3 .* randn(10, 1);
    % Generating data set (x,y=sin(2 * pi * X))
    T_training_noise = sin(2 * pi * X_training) + noise_training;
    T_test_noise = sin(2 * pi * X_test) + noise_test;
    W = fitting_reg(X_training, T_training_noise, M, 30, lambda);
    error_training(1, i) = error_function(X_training, T_training_noise, W, 30, lambda);
    error_test(1, i) = error_function(X_test, T_test_noise, W, 10, lambda);
    i = i + 1;
end;

figure; lambda = 0.0000001:0.05:1;
plot(lambda, error_training, '-ro', lambda, error_test, '-bo');
legend('Training','Test'); xlabel('lambda'); ylabel('Erms'); title(['Graphs of the root-mean-square error']);
