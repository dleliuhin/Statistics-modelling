clc
clearvars

syms n p Mteor Dteor r1 r2 r3;

n=10000;
p=0.5;
q=1-p;
Mteor=1/p;
Dteor=(1-p)/(p^2);

r1 = zeros(1,n);
r2 = zeros(1,n);
r3 = zeros(1,n);

for i=1:n
    r1(i) = IRNGEO_1(p);
    r2(i) = IRNGEO_2(p);
    r3(i) = IRNGEO_3(p);
end

x1=unique(r1);
fx1=zeros(1,length(x1));
Fx1=zeros(1,length(x1));
for i=1:length(x1)
    fx1(i) = p*q^(x1(i)-1);
    Fx1(i) = sum(fx1)-1;
end

x2=unique(r2);
fx2=zeros(1,length(x2));
Fx2=zeros(1,length(x2));
for i=1:length(x2)
    fx2(i) = p*q^(x2(i)-1);
    Fx2(i) = sum(fx2)-1;
end

x3=unique(r3);
fx3=zeros(1,length(x3));
Fx3=zeros(1,length(x3));
for i=1:length(x3)
    fx3(i) = p*q^(x3(i)-1);
    Fx3(i) = sum(fx3);
end

%%
set(gcf, 'Position', [200, 100, 900, 600])

%Построение графика функции плотности
subplot(2,3,1);
histogram(r1,'Normalization','probability','NumBins',max(r1));
grid on;
xlim([min(r1),max(r1)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

subplot(2,3,2);
histogram(r2,'Normalization','probability','NumBins',max(r1));
grid on;
xlim([min(r2),max(r2)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

subplot(2,3,3);
histogram(r3,'Normalization','probability','NumBins',max(r1));
grid on;
xlim([min(r3),max(r3)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

%%
%Построение графика интегральной функции распределения
subplot(2,3,4);
stairs(sort(r1), (1:length(r1))/length(r1),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r1),max(r1)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',7);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

subplot(2,3,5);
stairs(sort(r2), (1:length(r2))/length(r2),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r2),max(r2)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',7);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

subplot(2,3,6);
stairs(sort(r3), (1:length(r3))/length(r3),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(x3),max(x3)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',7);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%%
%Вычисление матожидания
M1 = sum(r1) / n;
M2 = sum(r2) / n;
M3 = sum(r3) / n;
%Вычисление дисперсии
D1 = sum(((r1 - M1).^2)/n);
D2 = sum(((r2 - M2).^2)/n);
D3 = sum(((r3 - M3).^2)/n);

T=table(['M';'D'],[M1;D1],[M2;D2],[M3;D3],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'IRNGEO_1' 'IRNGEO_2' 'IRNGEO_3' 'Teor_value'};