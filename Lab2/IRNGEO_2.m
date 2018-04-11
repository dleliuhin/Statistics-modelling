function IR=IRNGEO_2(p)
    alpha = rand;
    IR=0;
    while (alpha > p)
       alpha=rand; 
       IR=IR+1;
    end
end