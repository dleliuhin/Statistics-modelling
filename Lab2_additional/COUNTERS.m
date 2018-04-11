function count=COUNTERS(r, n)
    count=0;
    for i=1:length(r)
        if (r(i) == n)
            count=count+1;
        end
    end
end