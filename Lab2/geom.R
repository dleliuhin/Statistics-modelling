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

IRNGEO_1=function(p)
{
  alpha<- runif(1,min=0,max=1)
  p_it <- p
  m <- 0
  while ((alpha - p_it) >= 0)
  {
    alpha <- alpha - p_it
    p_it <- p_it*(1-p)
    m<- m+1
  }
  return(m)
}

IRNGEO_2=function(p)
{
  alpha<- runif(1,min=0,max=1)
  k<-0
  while(alpha>p)
  {
    alpha<- runif(1,min=0,max=1)
    k<-k+1
  }
  return(k)
}

IRNGEO_3=function(p)
{
  alpha<- runif(1,min=0,max=1)
  m <- round(log(alpha)/log(1-p))+1
  return(m)
}

r<- integer(0)
for(i in 1:10000)
{
  r<-c(r,IRNGEO_3(0.5))
}
M<- mean(r)
D<- (sd(r))^2
print(M)
print(D)
plott(r)