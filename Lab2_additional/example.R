countres=function(r, n)
{
  s <- 0
  for (i in 1:length(r))
  {
    if(r[i] == n)
    {
      s <- s+1
    }
  }
  return(s)
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

#��������� ������� �� 10000 ��������
p<- 0.5
r<- integer(0)
N<-10000
for(i in 1:N)
{
  r<-c(r,IRNGEO_1(p))
}
#��������� ������ ������
x <- 0:max(r)
f <- c()
for (i in x)
{
  f <- c(f,countres(r,i))
}
sum(f)
hi<- data.frame(x,f)
#���������� �������
x.mean <- 1/N*sum(x*f)
hi<- data.frame(hi, x*f)
#� �������� ������:
x.p<- 1/(1+x.mean)
#������������� �������� �����������: p(k)=(1-x.p)^x*x.p
x.px<- (1-x.p)^x*x.p
hi<- data.frame(hi, x.px)
x.nk<- N*x.px
hi<- data.frame(hi, x.nk)
x.hi <- (f-x.nk)^2/(x.nk)
hi<- data.frame(hi, x.hi)
sum(x.hi)