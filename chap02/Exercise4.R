
#' Exercise 4
#' Alter the program MonteCarlo to estimate the area
#' under the graph of y = sin(pi*x) inside the 
#' unit square by choosing 10000 points at random.

n = 10000 # the number of experiments
xdata = runif(n) # x value of point
ydata = runif(n) # y value of point
# the number of points under the curve y=sin(pi*x)
inside_num = length(xdata[ydata < sin(pi * xdata)])

x = seq(0, 1, 0.001)
y = sin(pi * x)
polyx = c(x, rev(x))
polyy = c(rep(0,length(x)), rev(y))

plot(c(), c(), main='y = sin(pi*x)',
     axes=F, xlab='', ylab='', xlim=c(0,1), ylim=c(0,1), asp=1)
lines(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))

polygon(polyx, polyy, col='skyblue')
points(xdata, ydata, cex=.01)

cat('Estimate of area is ', inside_num / n)
cat('Estimate of pi is ', 2 / (inside_num / n))
