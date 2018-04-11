function IR=IRNPSN(mu)
    if (mu<88)
        alpha=rand;
        p_it=alpha;
        IR=1;
        while (p_it>=exp(-mu))
            alpha=rand;
            p_it=p_it*alpha;
            IR=IR+1;
        end
    else
        IR=RNNORM(mu,mu);
    end
end