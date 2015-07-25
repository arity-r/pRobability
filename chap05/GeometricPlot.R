
#' Geometric Distribution
#'   P(T=n) = q^n-1p
#' where q = 1-p

n=20
x=0:n
p=0.5
y=sapply(x, function(n) (1-p)^(n-1) * p)

par(mfrow=c(1,1))
plot(c(), xlab='', ylab='', ylim=c(0,max(y)), xlim=c(0,n),
     main=sprintf('Geometric distribution (p=%0.3f)', p),)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, y[i]))
}
