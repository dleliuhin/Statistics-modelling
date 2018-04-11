clc
clearvars

syms mu r i x f px npx;

mu = 10;
n = 10000;

r = zeros(1,n);
for i=1:n
    r(i) = IRNPOI(mu);
end

x = 1:max(r);
f = zeros(1,length(x));
xf = zeros(1,length(x));
for i=1:length(x)
    f(i) = COUNTERS(r,i);
    xf(i) = x(i)*f(i);
end

M = sum(xf)/sum(f);
pk = zeros(1,length(x));
nkt = zeros(1,length(x));
hi = zeros(1,length(x));
for i=1:length(x)
    pk(i) = (mu^x(i))*exp(-mu)/factorial(x(i));
    nkt(i) = n*pk(i);
    hi(i) = (f(i)-nkt(i))^2/nkt(i)/33;
end

x=x';f=f';xf=xf';pk=pk';nkt=nkt';hi=hi';

X=table(x,f,xf,pk,nkt,hi)

sum(hi)

max(x)-1