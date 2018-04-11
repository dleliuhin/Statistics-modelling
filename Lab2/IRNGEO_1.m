function IR=IRNGEO_1(p)
    alpha = rand;
    p_it = p;
    IR=0;
    while ((alpha-p_it)>=0)
        alpha = alpha - p_it;
        p_it = p_it*(1-p);
        IR = IR + 1;
    end
end