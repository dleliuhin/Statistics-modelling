function IR=IRNGEO_3(p)
    alpha=rand;
    IR=round(log(alpha)/log(1-p))+1;
end