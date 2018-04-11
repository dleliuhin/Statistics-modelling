IRNUNI = function(ILOW,IUP)
{
  u<- runif(1, min=0, max=1) 
  r = round(((IUP - ILOW + 1)*u + ILOW),0)
  
  return(r)
}
x <- integer(0)
iup<-100
ilow<-1
N<-100
for(i in 1:N)
{
  x = c(x,IRNUNI(ilow,iup))  
}
p<-rep(1/iup-ilow,N)
plot(x,p)
P<-(x-ilow)/(iup-ilow)
plot(x,P)
M <- mean(x)
D <-(sd(x))^2
