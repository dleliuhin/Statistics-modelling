LFSR=function(x) 
{ 
  T <- 8760 
  return ((((x[1]>T)&(x[2]>T))|(x[3]>T))&(x[4]>T)&(x[5]>T)&((x[6]>T)|(x[7]>T)|(x[8]>T))&((x[9]>T)|(x[10]>T)))
} 

trace = function(L) 
{ 
  N<-53562
  n<-c(3,2,3,1,1) 
  m<-5
  lambda<-c(40*10^(-6), 10*10^(-6), 80*10^(-6), 30*10^(-6), 10*10^(-6)) 
  
  d<-0 
  for(k in 1:N) 
  { 
    x <-c() 
    for(i in 1:m) 
    { 
      t <-c() 
      for(j in 1:n[i]) 
      { 
        alfa<-runif(1,min=0, max=1) 
        t <- c(t,(-log(alfa)/lambda[i])) 
      } 
      for(j in 1:L[i]) 
      { 
        l<-which.min(t) 
        t[l] <- t[l]-log(runif(1,min=0, max=1))/lambda[i] 
      } 
      for(j in 1:n[i]) 
      { 
        x <- c(x,t[j]) 
      } 
    } 
    d <- d + !LFSR(x) 
  } 
  P <- 1-d/N 
  return (P) 
} 

P0 <- 0.99
L<-integer(5) 
for (i in 1:4){ 
  L[1]<-i 
  for(j in 1:4){ 
    L[2]<-j 
    for(k in 1:4){ 
      L[3]<-k 
      for(g in 1:4){
        L[4]<-g
        for(b in 1:4){
          L[5]<-b
          P <- trace(L)
          if(P>P0){ 
            print('P=') 
            print(P) 
            print(L) 
            print(sum(L))} 
        }
      }
    } 
  } 
}
