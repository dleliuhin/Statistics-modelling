clc
clearvars

q=0.5;
p=1-q;
n=10000;
alpha = 1/log(p);
Mteor=-alpha*q/p;
Dteor=-alpha*q*(1+alpha*q)/(p^2);

r=zeros(1,n);
for i=1:n
    r(i)=IRNLOG(p);
end

x=unique(r);
fx=zeros(1,length(x));
Ffx=zeros(1,length(x));
for i=1:length(x)
    fx(i)=-alpha*(q^x(i))/x(i);
    Fx(i)=sum(fx);
end

set(gcf, 'Position', [200, 100, 900, 600])

%Построение графика функции плотности
subplot(2,1,1);
histogram(r,'Normalization','probability','NumBins',max(r));
hold on
plot(x,fx,'k-');
hold off
grid on;
xlim([min(r),max(r)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

%Построение графика интегральной функции распределения
subplot(2,1,2);
stairs(sort(r), (1:length(r))/length(r),'LineWidth',0.8,'MarkerFaceColor','c');
hold on
plot(x,Fx,'k-');
hold off
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
T.Properties.VariableNames = {'Eval' 'IRNLOG' 'Fault' 'Teor_value'};