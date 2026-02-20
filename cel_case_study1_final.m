clc;
clear;
close all;

disp("===============================================");
disp("   SIMPLE LEAST SQUARES LINE FITTING PROJECT   ");
disp("===============================================");



n = input("Enter the number of data points: ");

x = zeros(1,n);
y = zeros(1,n);

disp("Enter the values of x and y one by one:");

for i = 1:n
    fprintf("\nPoint %d\n", i);
    x(i) = input("Enter x value: ");
    y(i) = input("Enter y value: ");
end


best_m = 0;
best_c = 0;
min_S  = inf;  

for m = -5:0.01:5        
    for c = -10:0.1:10  
        
       
        S = 0;
        
        for i = 1:n
            y_pred = m*x(i) + c;         
            error  = y(i) - y_pred;      
            S = S + error^2;             
        end
        
     
        if S < min_S
            min_S = S;
            best_m = m;
            best_c = c;
        end
    end
end


disp("------------------------------------------------");
disp("Best Fit Line Found Using Least Squares Method:");
fprintf("Slope (m)     = %.4f\n", best_m);
fprintf("Intercept (c) = %.4f\n", best_c);
fprintf("Equation: y = %.4f*x + %.4f\n", best_m, best_c);
fprintf("Minimum Error S = %.6f\n", min_S);
disp("------------------------------------------------");


y_fit = best_m*x + best_c;


figure;
plot(x, y, 'o', 'MarkerSize', 8);   
hold on;
plot(x, y_fit, '-', 'LineWidth', 2);

xlabel('x values');
ylabel('y values');
title('Least Squares Best Fit Line');
legend('Experimental Data', 'Best Fit Line');
grid on;


residuals = y - y_fit;

figure;
stem(x, residuals, 'filled');

xlabel('x values');
ylabel('Residual Error (y - yfit)');
title('Residual Error Plot');
grid on;