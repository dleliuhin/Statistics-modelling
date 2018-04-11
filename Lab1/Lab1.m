%Очищаем Окно Команд и область переменных
clc 
clear all;
%Объявление переменных
syms u M D;
n = 10;%число испытаний
fig = 1;%Переменная, отвечающая за номер фигуры выведенного графика
%Создаем пустые массивы для вывода всех данных в виде таблицы
N=[];Mat=[];Mteor=[];Disp=[];Dteor=[];
Motkl=[];Dotkl=[];
%Начало цикла, пока n не станет равным 10000
while n<=10000
    figure(fig);
    %Генерация псевдослучайных чисел от 0 до 1, кол-вом n
    u = rand(1, n);
    %Вычисление матожидания
    M = sum(u) / n;
    %Вычисление дисперсии
    D = 0;
    for k = 1:n
        D = D + ((u(k) - M)^2)/n;
    end
    %Вычисление SKO
    S = sqrt(D);
    %Вычисление функции плотности f(x)
    fx=[];
    for k=1:n
        a=0; b=u(k);
        c=1/(b-a);
        if (u(k)>=a) && (u(k)<=b)
            fx(end+1) = c;
        else
            fx(end+1) = 0;
        end
    end
    %Вычисление интегральной функции распределения F(x)
    FX=[];
    a=0; b=1;
    for k=1:n
       if (a<=u(k)<=b)
           FX(k)=(u(k)-a)/(b-a);
       elseif (u(k)>b)
           FX(k)=1;
       elseif (u(k)<a)
           FX(k)=0;
       else
           continue;
       end
    end
    %Вычисление автокорреляционной функции K(f)
    for f=1:n
    chs=0;
    znm=0;
        for i=1:n
        if(i<n-f)
           chs=chs+(u(i)-M)*(u(i+f)-M);
        end
           znm=znm+(u(i)-M)^2;
        end
    Kf(f)=chs/znm;
    end

    set(gcf, 'Position', [300, 100, 800, 600])
    %Построение графика функции плотности
    subplot(3,1,1);
    histogram(u,'Normalization','probability','NumBins',20);
    grid on;
    xlim([0,1]); ylim([0,1]);
    title('График функции плотности f(x)','fontsize',15);
    xlabel('x'); ylabel('f(x)', 'rotation', 1);
    %Построение графика интегральной функции распределения
    subplot(3,1,2);
    stairs(sort(u),sort(FX), '-');
    grid on;
    xlim([0,1]); ylim([0,1]);
    title('График интегральной функции распределения F(x)','fontsize',15);
    xlabel('x'); ylabel('F(x)', 'rotation', 1);
    %Построение коррелограммы автокорреляционной функции
    subplot(3,1,3);
    %autocorr(u,n-1);
    stem(1:n,Kf,'Color','k','Marker','none','LineWidth',1.5);
    xlim([0,n]); %ylim([-1,1]);
    title('Коррелограмма автокорреляционной функции K(f)','fontsize',15);
    xlabel('f'); ylabel('K(f)', 'rotation', 1);    

 N(end+1)=n;
 Mat(end+1)=M;
 Disp(end+1)=D;
 Mteor(end+1)=0.5;
 Dteor(end+1)=0.08333;
 Motkl(end+1)=Mat(end)-Mteor(end);
 Dotkl(end+1)=Disp(end)-Dteor(end);
n = n * 10;  
fig = fig + 1;
end

T=table;
T.n=N';
T.M_evalOfDistrib=Mat';
T.M_Teoretical=Mteor';
T.M_Otklonenie=Motkl';
T.D_evaluationOfDistribution=Disp';
T.D_Teoretical=Dteor';
T.D_Otklonenie=Dotkl';