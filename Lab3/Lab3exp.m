clc
clear

syms r;

b=1;
n=10000;
Mteor=b;
Dteor=b^2;

r = zeros(1,n);
for i=1:n
    r(i) = RNEXP(b);
end

x = unique(r);
fx = zeros(1,n);
Fx = zeros(1,n);
for i=1:length(x)
    if (x(i)<0)
        fx(i) = 0;
        Fx(i) = 0;
    else
        fx(i) = b*exp(-b*x(i));
        Fx(i) = 1-exp(-b*x(i));
    end
end

set(gcf, 'Position', [300, 100, 800, 600]);

%Построение графика функции плотности
subplot(2,1,1);
histogram(r,'Normalization','probability','NumBins',20);
grid on;
xlim([min(r),max(r)]); %ylim([0,1]);
title('График функции плотности f(x)','fontsize',15);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

% Построение графика интегральной функции распределения
subplot(2,1,2);
stairs(x,Fx,'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r),max(r)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',15);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%Вычисление матожидания
M = sum(r) / n;
%Вычисление дисперсии
D = sum(((r - M).^2)/n);

T=table(['M';'D'],[M;D],[M-Mteor;D-Dteor],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'RNEXP' 'Fault' 'Teor_value'};

clear i;