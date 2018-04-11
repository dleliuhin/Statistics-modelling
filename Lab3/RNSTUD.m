function R=RNSTUD(N)
    R = normrnd(0,1,1)/sqrt(RNCHIS(N)/N);
end