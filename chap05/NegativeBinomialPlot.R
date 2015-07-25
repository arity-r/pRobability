
#' Negative Binomial Plot
#'   u(x, k, p) = choose(x-1, k-1) * p^(k) * q^(x-k)

n=20
x=0:n
p=0.25
k=2
y=sapply(x, function(x) choose(x-1, k-1) * p^(k) * (1-p)^(x-k))

par(mfrow=c(1,1))
plot(c(), xlab='', ylab='', ylim=c(0,max(y)), xlim=c(0,n),
     main=sprintf('Negative Binomial distribution (k=%d, p=%0.3f)', k, p),)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, y[i]))
}
