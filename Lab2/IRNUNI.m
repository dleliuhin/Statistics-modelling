function IR = IRNUNI(ILOW, IUP)
    IR = round(((IUP-ILOW+1)*rand+ILOW), 0);
end