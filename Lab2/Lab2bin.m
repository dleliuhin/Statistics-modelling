clc
clearvars

syms N r i p ;
N=10;
p=0.5;
n=10000;
Mteor=N*p;
Dteor=N*p*(1-p);

r=zeros(1,n);

for i=1:n
    r(i) = IRNBIN(N, p);
end

x=zeros(1,N+1);
x=unique(r);
fx=zeros(1,length(x));
Fx=zeros(1,length(x));

for i=1:length(x)
    fx(i) = binomi(N,x(i))*(p^x(i))*((1-p)^(N-x(i)));  
    Fx(i) = sum(fx);
end

set(gcf, 'Position', [300, 100, 800, 600])

%Построение графика функции плотности
subplot(2,1,1);
histogram(r,'Normalization','probability','NumBins',N);
hold on
plot(x,fx,'ko-');
hold off
grid on;
xlim([min(r),max(r)]); 
%ylim([0,1]);
title('График функции плотности f(x)','fontsize',15);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

% Построение графика интегральной функции распределения
subplot(2,1,2);
stairs(sort(r), (1:length(r))/length(r),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([min(r),max(r)]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',15);
xlabel('x'); ylabel('F(x)', 'rotation', 1);
hold on
plot(x,Fx,'k-');
hold off

%Вычисление матожидания
M = sum(r) / n;
%Вычисление дисперсии
D = sum(((r - M).^2)/n);

T=table(['M';'D'],[M;D],[M-Mteor;D-Dteor],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'IRNBIN' 'Fault' 'Teor_value'};