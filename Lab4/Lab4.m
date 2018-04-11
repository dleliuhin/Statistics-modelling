clc
clear

m=4;
lam = zeros(1,m);
lam(1)=40E-06;
lam(2)=10E-06;
lam(3)=80E-06;
lam(4)=30E-06;
P0=0.995;
T=8760; 

n=[4,2,3,4];
ta=3.715;
eps=0.001; 
N = (ta^2)*P0*(1-P0)/(eps^2);

L = zeros(1,length(lam));

for i=1:4
    L(1)=i;
   for j=1:4
       L(2)=j;
      for k=1:4
          L(3)=k;
         for g=1:4
             L(4)=g;
             P=trace(L,N,T,m,lam,n);
             if (P>P0)
                fprintf('\tP=5.3f% | L: [ s% ] | sum(L)=i%\n',P,num2str(L),sum(L));
             end
         end
      end
   end
end