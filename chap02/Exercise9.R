
#' Exercise 9
#' This program simulates the waiting times between cars
#' when the average time between cars is 30 seconds.
#' The waiting times are simulated by computing
#'     (-1/30)log(rnd)
#' Also, this program computes an area bar graph for
#' these times by breaking the time interval from
#' 0 to 120 into 24 subintervals.
#' On the same pair of axes, plot the function
#'     f(x) = (1/30)e^(-x/30)

xlim = c(0, 120)
func <- function(x) {
  return((1/30)*exp(-x/30))
}

# simulation part
n = 10000 # the number of trial
bins = 24 # the number of bins
data = (-30) * log(runif(n)) # sum of two random numbers
data = data[data < xlim[2]]
histinfo = hist(data, breaks=seq(xlim[1], xlim[2], l=bins+1))

# function part
x = seq(xlim[1], xlim[2], 0.01)
y = func(x)

# plotting part
par(mfrow=c(1,1))
barplot(main='Density of waiting time (lambda=1/30)',
        xlab='time',
        ylab='density',
        histinfo$density, space=0,
        width=max(x)/(length(histinfo$density)),
        names.arg=histinfo$mids)
lines(x, y)
