function IR=IRNBIN(N,p)
    if (N>=100)
        IR = round(RNNORM(N*p,sqrt(N*p*(1-p)))+0.5);
    else
        alpha = rand;
        p_it = (1-p)^N;
        IR = 0;
        while ((alpha-p_it)>=0)
           alpha = alpha - p_it; 
           p_it = p_it*(p*(N-IR))/((IR+1)*(1-p));
           IR = IR + 1;
        end
    end
end