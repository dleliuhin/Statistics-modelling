function IR=IRNLOG(p)
    alpha=rand;
    p_it= -(1/log(p))*(1-p);
    IR=1;
    while ((alpha-p_it)>=0)
        alpha=alpha-p_it;
        p_it=p_it*(IR/(IR+1))*(1-p);
        IR=IR+1;
    end
end