plott=function(r)
{
  par(mfrow=c(1, 2))
  res<-hist(r, freq = FALSE, col = "lightblue",
            main="",
            xlab = "x",
            ylab = "f(x)")
  lines(density(r,bw=0.6),col = "red", lwd = 2)
  
  plot(sort(r), (1:length(r))/length(r), type="S", col="seagreen",lwd=2, main="",xlab="x",ylab="F(x)")
  x = seq(0, 10, by=0.25)
  lines(x, pnorm(x, mean=mean(r), sd=sd(r)), type="l", col="orange", lwd=1)
}

IRNPOI=function(mu)
{
  if(mu<88)
  {
    alpha<- runif(1,min=0,max=1)
    p_it <- exp(-10)
    m <- 1
    while((alpha - p_it) >= 0)
    {
      alpha <- alpha - p_it
      p_it <- p_it*(mu/m)
      m<- m+1
    }
  }
  else{
    m<-rnorm(1,mean=mu,sd=mu)
  }
  return(m)
}
r<- integer(0)
for(i in 1:10000)
{
  r<-c(r,IRNPSN(10))
}
M<- mean(r)
D<- (sd(r))^2
print(M)
print(D)
plott(r)

IRNPSN=function(mu)
{
  if(mu<88)
  {
    alpha<- runif(1,min=0,max=1)
    p_it <- alpha
    m <- 1
    while(p_it>=exp(-mu))
    {
      alpha<- runif(1,min=0,max=1)
      p_it <- p_it*alpha
      m<- m+1
    }
  }
  else{
    m<-rnorm(1,mean=mu,sd=mu)
  }
  return(m)
}
