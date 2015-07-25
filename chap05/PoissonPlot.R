
#' Poisson Distribution
#'   P(X=k) = lambda^k / factorial(k) * exp(-lambda)

n=20
x=0:n
lambda = 3
y=sapply(x, function(k) lambda^k / factorial(k) * exp(-lambda))

par(mfrow=c(1,1))
plot(c(), xlab='', ylab='', ylim=c(0,max(y)), xlim=c(0,n),
     main=sprintf('Poisson distribution (lambda=%d)', lambda),)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, y[i]))
}
