N<-10
p<-0.5
IRNBIN = function(N,p)
{
  if(N>=100)
  {
    m <-round(rnorm(1,N*p,sqrt(N*p*(1.0-p)))+0.5)  
  }
  else
  {
    alpha<- runif(1,min=0,max=1)
    p_it <- (1 - p)^N
    m <- 0
    while ((alpha - p_it) >= 0)
    {
      alpha <- alpha - p_it
      p_it <- p_it*((p*(N-m))/((m+1)*(1-p)))
      m<- m+1
    }
    return(m)
  }
}
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
r<- integer(0)
for(i in 1:10000)
{
  r<- c(r,IRNBIN(N,p))
}
plott(r)
M<- mean(r)
D<- (sd(r))^2
dM<- M-5
dS<- D-2.5
