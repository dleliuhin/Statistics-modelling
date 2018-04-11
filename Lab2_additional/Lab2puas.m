clc
clearvars

syms mu n Mteor Dteor r;

mu=10;
n=10000;
Mteor=mu;
Dteor=mu;

r1=zeros(1,n);
r2=zeros(1,n);
for i=1:n
    r1(i) = IRNPOI(mu);
    r2(i) = IRNPSN(mu);
end

x1=unique(r1);
fx1=zeros(1,length(x1));
Fx1=zeros(1,length(x1));
for i=1:length(x1)
    fx1(i) = (exp(-mu)*(mu^x1(i)))/(factorial(x1(i)));
    Fx1(i) = sum(fx1);
end

x2=unique(r2);
fx2=zeros(1,length(x2));
Fx2=zeros(1,length(x2));
for i=1:length(x2)
    fx2(i) = (exp(-mu)*(mu^x2(i)))/(factorial(x2(i)));
    Fx2(i) = sum(fx2);
end

set(gcf, 'Position', [200, 100, 900, 600])

%Построение графика функции плотности
subplot(2,2,1);
histogram(r1,'Normalization','probability','NumBins',max(r1));
grid on;
xlim([min(r1),max(r1)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

subplot(2,2,3);
histogram(r2,'Normalization','probability','NumBins',max(r1));
grid on;
xlim([min(r2),max(r2)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

%%
%Построение графика интегральной функции распределения
subplot(2,2,2);
stairs(sort(r1), (1:length(r1))/length(r1),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r1),max(r1)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',10);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

subplot(2,2,4);
stairs(sort(r2), (1:length(r2))/length(r2),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r2),max(r2)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',10);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%%
%Вычисление матожидания
M1 = sum(r1) / n;
M2 = sum(r2) / n;
%Вычисление дисперсии
D1 = sum(((r1 - M1).^2)/n);
D2 = sum(((r2 - M2).^2)/n);

T=table(['M';'D'],[M1;D1],[M2;D2],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'IRNPOI' 'IRNPSN' 'Teor_value'};