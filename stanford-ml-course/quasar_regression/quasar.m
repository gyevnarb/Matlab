%% Clean up

clear; clc; close all;

%% Loading data

load_quasar_data;

[m, n] = size(train_qso);
[mt, nt] = size(test_qso);

%% Unweighted regression

fprintf('Plotting unweighted regression on first training example\n');

y = train_qso(1,:)';
X = [ones(n,1) lambda];
theta = X\y;
pred = X*theta;

figure('Name', 'Unweighted regression');
plot(lambda, y, 'k+');
hold on;
plot([lambda(1), lambda(end)], [pred(1), pred(end)],'r-', 'LineWidth', 2);
legend('Raw data', 'Regression line');
title('Unweighted regression on first training example');
hold off;

fprintf('Optimal theta: %1$.3f %2$.3f\n', theta(1), theta(2));
fprintf('Press any key to continue . . .\n\n');
pause;

%% Weigthed regression

fprintf('Plotting locally weighted regressions on first training example\n');

figure('Name', 'Locally weighted regressions');
plot(lambda, y, 'k+', 'LineWidth', 1);
hold on;
colors = {'r-', 'b-', 'g-', 'm-', 'c-'};
taus = [1, 5, 10, 100, 1000];
for tau_ind = 1:5
    tau = taus(tau_ind);
    y_smooth = local_linear_regression(lambda, y, tau);
    plot(lambda, y_smooth, char(colors(tau_ind)), 'LineWidth', 2);
end
legend('Raw data', 'tau = 1', 'tau = 5', 'tau = 10', 'tau = 100', 'tau = 1000');
title('Locally weighted regressions on first training example');

fprintf('Press any key to continue . . .\n\n');
pause;

%% Smoothing data

train_smooth = zeros(m, n);
test_smooth = zeros(mt, nt);

for i = 1:m
    y = train_qso(i,:)';
    train_smooth(i,:) = local_linear_regression(lambda, y, 5);
end

for i = 1:mt
    y = test_qso(i,:);
    test_smooth(i,:) = local_linear_regression(lambda, y, 5);
end








