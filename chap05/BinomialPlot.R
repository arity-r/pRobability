
#' Binomial Distribution
#'   b(n, p, k) = _nC_k p^k q^{n-k}
#' where q = 1-p.

n=20
x=0:n
p=0.6
y=sapply(x, function(k) choose(n, k) * p^k * (1-p)^(n-k))

par(mfrow=c(1,1))
plot(c(), xlab='', ylab='', ylim=c(0,max(y)), xlim=c(0,n),
     main=sprintf('Binomial distribution (p=%0.3f)', p),)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, y[i]))
}
