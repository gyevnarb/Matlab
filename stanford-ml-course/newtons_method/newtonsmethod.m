%% Clean Up
% These are my solutions to the problem sets posted on the Stanford machine
% learning course web page

clc; clear; close all;

%% Setting up data
fprintf('Loading and setting up data\n');

X = load('logistic_x.txt');
y = load('logistic_y.txt');

m = size(X,1);

X = [ones(m,1) X];

n = size(X,2);

initialTheta = zeros(n,1);

fprintf('\n');

%% Plotting raw data
fprintf('Plotting the raw data\n');

figure;
hold on;
plot(X(y > 0,2), X(y > 0,3), 'g+');
plot(X(y < 0,2), X(y < 0,3), 'ro');

fprintf('Press any key to continue . . .\n\n');
pause;

%% Running Logistics Regression
fprintf('Runnning logistics regression\n');

[theta] = logReg(X,y,initialTheta,10);

fprintf('Press any key to continue . . .\n\n');
pause;

%% Plotting decision boundary
fprintf('Plotting decision boundary\n');

x1 = min(X(:,2)):.01:max(X(:,2));
x2 = -(theta(1) / theta(3)) - (theta(2) / theta(3)) * x1;


plot(x1, x2, 'linewidth', 2);
xlabel('x1');
ylabel('x2');

fprintf('Press any key to continue . . .\n\n');
pause;

