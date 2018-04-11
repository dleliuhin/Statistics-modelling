clc
clear

syms r;

n=20;

%��������� ������ ��������� ��������
r = zeros(1,n);
for i=1:n
    r(i) = RNNRM2();
end

x = unique(r);
f = repmat(1/length(x), 1, n);

%����������� ��������
Fi = zeros(1,length(r));
%��������� ��������
Ei = zeros(1,length(r));
M = mean(r);
S = std(r);
Di = zeros(1,length(r));
for i=1:length(r)
    Fi(i) = i/length(r);
    Ei(i) = (1+erf((x(i)-M)/(sqrt(2*S^2))))/2;
    Di(i) = abs(Fi(i)-Ei(i));
end

x=x';f=f';Fi=Fi';Ei=Ei';Di=Di';
T=table(x,f,Fi,Ei,Di)

fprintf('\t����������� �������� �������� D = %9.5f\n', max(Di));
fprintf('\t����� �������� ������� n = %i\n', length(r));