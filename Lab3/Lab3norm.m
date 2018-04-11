clc 
clearvars;

syms r;

Mteor=0;
Dteor=1;
n=10000;

r1 = zeros(1,n);
r2 = zeros(1,n);
for i=1:n
    r1(i) = RNNRM1();
    r2(i) = RNNRM2();
end

M1 = mean(r1);
S1 = std(r1);
x1=unique(r1);
fx1 = zeros(1,length(x1));
Fx1 = zeros(1,length(x1));
for i=1:length(x1)
    fx1(i) = exp((-(x1(i)-M1)^2)/(2*S1^2))/(S1*sqrt(2*pi));
    Fx1(i) = (1+erf((x1(i)-M1)/(sqrt(2*S1^2))))/2;
end

M2 = mean(r2);
S2 = std(r2);
x2 = unique(r2);
fx2 = zeros(1,length(x2));
Fx2 = zeros(1,length(x2));
for i=1:length(x2)
    fx2(i) = exp((-(x2(i)-M2)^2)/(2*S2^2))/(S2*sqrt(2*pi));
    Fx2(i) = (1+erf((x2(i)-M2)/(sqrt(2*S2^2))))/2;
end

set(gcf, 'Position', [300, 100, 800, 600]);

%Построение графика функции плотности
subplot(2,2,1);
histogram(r1,'Normalization','probability','NumBins',20);
grid on;
xlim([min(r1),max(r1)]); %ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

subplot(2,2,2);
histogram(r2,'Normalization','probability','NumBins',20);
grid on;
xlim([min(r2),max(r2)]); %ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

% Построение графика интегральной функции распределения
subplot(2,2,3);
stairs(x1,Fx1,'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r1),max(r1)]); ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',7);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

subplot(2,2,4);
stairs(x2,Fx2,'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r2),max(r2)]); ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',7);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%Вычисление матожидания
M1 = sum(r1) / n;
M2 = sum(r2) / n;
%Вычисление дисперсии
D1 = sum(((r1 - M1).^2)/n);
D2 = sum(((r2 - M2).^2)/n);


T=table(['M';'D'],[M1;D1],[M2;D2],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'RNNRM1' 'RNNRM2' 'Teor_value'};

clear i S1 S2;