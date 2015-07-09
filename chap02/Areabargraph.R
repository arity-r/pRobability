
#' Example 2.4 Areabargraph
#' This program produces a bar graph with the property
#' that on each interval, the area, rather than the height,
#' of the bar is equal to the fraction of outcomes
#' that fell in the corresponding interval.

func <- function(x) {
  y = rep(0, length(x))
  y[x<=1] = x[x<=1]
  y[x>1] = 2 - x[x>1]
  return(y)
}

# simulation part
n = 1000 # the number of trial
hist = rep(0, 11) # histogram data
for (i in 1:n) {
  sum = runif(1) + runif(1) # sum of 2 numbers
  idx = ceiling(sum / 2 * length(hist)) # which bin should this point on
  hist[idx] = hist[idx] + 1
}
# post simulation process: normalization
hist_max_i = integrate(
  func,
  2.0*floor((length(hist)-1)/2)/length(hist),
  2.0*floor((length(hist)+1)/2)/length(hist))$value
for (i in 1:length(hist)) {
  hist[i] = hist[i] / (n * hist_max_i)
}

# function part
x = seq(0, 2, 0.01)
y = func(x)

# plotting part
par(mfrow=c(1,1))
mp <- barplot(hist, axes=F, ylim=c(0, 1), space=0, width=2.0/(length(hist)))
axis(1, at=c(0:length(hist)-1), labels=c(0:length(hist)-1))
axis(2, seq(0, 1, 0.2), seq(0, 1, 0.2))
lines(x, y)
