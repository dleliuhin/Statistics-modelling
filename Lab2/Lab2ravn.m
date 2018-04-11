clc
clearvars

syms x iup ilow N i p M D Mteor Dteor Fx;

Mteor=50.5;
Dteor=833.5;

ilow=1;
iup=100;
N=10000;
    
x=zeros(1,N);
p=zeros(1,N);
Fx=zeros(1,N);

for i=1:N
    x(i) = IRNUNI(ilow, iup);
end

i=1:N;
p(i) = vpa(1/iup-ilow);

for i=1:N
    if (ilow<=x(i)<=iup)
        Fx(i)=(x(i)-ilow)/(iup-ilow);
    elseif (x(i)<ilow)
        Fx(i)=0;
    elseif (x(i)>iup)
        Fx(i)=1;
    else
        continue;
    end
end
    
set(gcf, 'Position', [300, 100, 800, 600])

%Построение графика функции плотности
subplot(2,1,1);
histogram(x,'Normalization','probability','NumBins',20);
grid on;
xlim([ilow,iup]); %ylim([0,1]);
title('График функции плотности f(x)','fontsize',15);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

% Построение графика интегральной функции распределения
subplot(2,1,2);
stairs(sort(x),sort(Fx),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
xlim([ilow,iup]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',15);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%Вычисление матожидания
M = sum(x) / N;
%Вычисление дисперсии
D = sum(((x - M).^2)/N);

T=table(['M';'D'],[M;D],[M-Mteor;D-Dteor],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'IRNUNI' 'Fault' 'Teor_value'};