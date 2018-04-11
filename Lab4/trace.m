function P=trace(L, N, T, m, lam, n)
    d=0;
    for k=1:N
        x=zeros(1,13);
        for i=1:m
            t=zeros(1,T);
            for j=n(i)
                t(end+1) = round(-log(rand)/lam(i));
            end
            for j=L(i)
                l=min(t(t>0));
                if (0<l)&(l<=T)
                    t(l)=t(l)-log(rand)/lam(i);
                else
                    t=horzcat(t,zeros(1,l-T));
                    t(l)=t(l);
                end
            end
            for j=n(i)
                x(end+1)=t(j);
            end
        end
        d=d+~LFSR(T,x);
    end
    P=1-d/N;
end