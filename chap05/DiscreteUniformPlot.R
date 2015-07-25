
#' Discrete Uniform Distribution
#'   1 / n

n=20
x=0:n
y=sapply(x, function(x) 1/n)

par(mfrow=c(1,1))
plot(c(), xlab='', ylab='', ylim=c(0,max(y)), xlim=c(0,n),
     main='Discrete uniform distribution',)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, y[i]))
}
