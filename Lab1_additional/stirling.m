function res=stirling(a,b)
%Функция вычисления чисел Стирлинга 2-го порядка
if ((a==b) || (b==1 && a>0))
    res = 1;
elseif (b==0 || a<b)
    res = 0;
else
    res = double(b*stirling(a-1,b)+stirling(a-1,b-1));
end
end