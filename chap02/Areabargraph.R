
#' Example 2.4 Areabargraph
#' This program produces a bar graph with the property
#' that on each interval, the area, rather than the height,
#' of the bar is equal to the fraction of outcomes
#' that fell in the corresponding interval.

xlim = c(0, 2)
func <- function(x) {
  y = rep(0, length(x))
  y[x<=1] = x[x<=1]
  y[x>1] = 2 - x[x>1]
  return(y)
}

# simulation part
n = 1000 # the number of trial
bins = 11 # the number of bins
data = runif(n) + runif(n) # sum of two random numbers
histinfo = hist(data, breaks=seq(xlim[1], xlim[2], l=bins+1))

# function part
x = seq(xlim[1], xlim[2], 0.01)
y = func(x)

# plotting part
par(mfrow=c(1,1))
barplot(histinfo$density, ylim=c(0, 1), space=0,
        width=max(x)/(length(histinfo$density)),
        names.arg=histinfo$mids)
lines(x, y)
