
#' Example 5.4 LondonBombs

n = 400 # the number of bombs
area = array(data=0, dim=c(10, 10))
bombs = data.frame(x=runif(n, min=0, max=10), y=runif(n, min=0, max=10))

invisible(apply(bombs, 1, function(x) {
  area[ceiling(x[1]), ceiling(x[2])] <<- area[ceiling(x[1]), ceiling(x[2])] + 1
}))

par(mfrow=c(1,2))
# First, plot where these bomb landed
plot(bombs$x, bombs$y, axes=F, xlab='', ylab='',
     xlim=c(0, dim(area)[1]), ylim=c(0, dim(area)[2]),
     pch=16, cex=.5, col='skyblue', asp=1)
abline(h=c(0:dim(area)[1]))
abline(v=c(0:dim(area)[2]))

# Then, Poisson distribution with simulation result
# poisson distribution
lambda = n / prod(dim(area))
x=0:max(as.vector(area))
y=sapply(x, function(k) lambda^k / factorial(k) * exp(-lambda))

# simulation result as a histgram
histdata$counts = sapply(x, function(x) length(as.vector(area)[as.vector(area) == x]))
histdata$density = sapply(histdata$counts, function(x) x / sum(histdata$counts))

# plot them
plot(c(), xlab='', ylab='', ylim=c(0,max(c(y, histdata$density))), xlim=c(0,length(x)),
     main=sprintf('Poisson distribution (lambda=%0.3f)', lambda),)
for (i in 1:length(x)) {
  lines(c(x[i], x[i]), c(0, max(c(y[i], histdata$density[i]))))
}
points(x, y, pch=16, col='black')
points(x, histdata$density, pch=16, col='skyblue')
