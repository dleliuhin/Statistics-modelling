function IR=IRNPOI(mu)
    if (mu<88)
        alpha=rand;
        p_it=exp(-mu);
        IR=1;
        while ((alpha-p_it)>=0)
            alpha=alpha-p_it;
            p_it=p_it*(mu/IR);
            IR=IR+1;
        end
    else
        IR=RNNORM(mu,mu);
    end
end