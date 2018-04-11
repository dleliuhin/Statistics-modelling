clc
clearvars

syms a b n;

a=1;
b=5;
n=10000;
Mteor=(a+b)/2;
Dteor=((b-a)^2)/12;

r=zeros(1,n);
for i=1:n
    r(i) = RNUNI(a,b);
end

x=unique(r);
fx = zeros(1,length(x));
Fx = zeros(1,length(x));

for i=1:length(x)
    fx(i) = 1/(b-a);
    
    if (a<=x(i)<=b)
        Fx(i)=(x(i)-a)/(b-a);
    elseif (x(i)<a)
        Fx(i)=0;
    elseif (x(i)>b)
        Fx(i)=1;
    else
        continue;
    end    
end

set(gcf, 'Position', [300, 100, 800, 600]);

%Построение графика функции плотности
subplot(2,1,1);
histogram(r,'Normalization','probability','NumBins',20);
grid on;
xlim([a,b]); %ylim([0,1]);
title('График функции плотности f(x)','fontsize',15);
xlabel('x'); ylabel('f(x)', 'rotation', 1);

% Построение графика интегральной функции распределения
subplot(2,1,2);
stairs(x,sort(Fx),'LineWidth',0.8,'MarkerFaceColor','c');
grid on;
%xlim([a,b]);
ylim([0,1]);
title('График интегральной функции распределения F(x)','fontsize',15);
xlabel('x'); ylabel('F(x)', 'rotation', 1);

%Вычисление матожидания
M = sum(r) / n;
%Вычисление дисперсии
D = sum(((r - M).^2)/n);

T=table(['M';'D'],[M;D],[M-Mteor;D-Dteor],[Mteor;Dteor]);
T.Properties.VariableNames = {'Eval' 'RNUNI' 'Fault' 'Teor_value'};

clear i;