% function [res]=stirling(a,b)
% if ((a==b) || (b==1 && a>0))
%     res = 1;
% elseif (b==0 || a<b)
%     res = 0;
% else
%     res = double(b*stirling(a-1,b)+stirling(a-1,b-1));
% end
% end

function y=stirl(n,r)
% Calculate stirling no. of second kind which is the no. of partition of n
% distinct objects in r groups where each group has atleast one element
sum_r=0;
for j=1:r
    if j==r
        sum_r=sum_r+(-1)^(r-j)*j^n;
    else
        sum_r=sum_r+(-1)^(r-j)*nchoosek(r,j)*j^n;
    end
y=sum_r/factorial(r);
end