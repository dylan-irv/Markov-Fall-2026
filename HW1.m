X1 = rand(1, 10);
Y1 = rand (1, 10);
Z1 = rand(1, 10);
carloIntegrate1 = ((X1.^2+Y1.^2<Z1)&(X1 .* Y1 < Z1.^2));
ratio1 = sum(carloIntegrate1)/10;

X2 = rand(1, 100);
Y2 = rand (1, 100);
Z2 = rand(1, 100);
carloIntegrate2 = ((X2.^2+Y2.^2<Z2)&(X2 .* Y2 < Z2.^2));
ratio2 = sum(carloIntegrate2)/100;

X3 = rand(1, 1000);
Y3 = rand (1, 1000);
Z3 = rand(1, 1000);
carloIntegrate3 = ((X3.^2+Y3.^2<Z3)&(X3 .* Y3 < Z3.^2));
ratio3 = sum(carloIntegrate3)/1000;

X4 = rand(1, 10000);
Y4 = rand (1, 10000);
Z4 = rand(1, 10000);
carloIntegrate4 = ((X4.^2+Y4.^2<Z4)&(X4 .* Y4 < Z4.^2));
ratio4 = sum(carloIntegrate4)/10000;

sizes = [10, 100, 1000, 10000];
ratios = [ratio1, ratio2, ratio3, ratio4];

% this is AI-generated plot code below (prompt was something like "I have
% two vectors and want to plot them on a logarithmic x-axis with lines
% connecting the points. Also make the y-axis locked to (0, 1) interval.")
figure;
semilogx(sizes, ratios, '-o', 'LineWidth', 1.2, 'MarkerSize', 8);
grid on;
xlabel('Sample Size');
ylabel('Estimated Probability');
title('HW 1 Problem 6 part b');

% Lock y-axis to [0, 1]
ylim([0 1]);