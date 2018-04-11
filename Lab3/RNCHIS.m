function R=RNCHIS(N)
    R = sum((normrnd(0,1,1,N)).^2);
end