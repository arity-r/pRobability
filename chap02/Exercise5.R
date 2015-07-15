
#' Exercise 5
#' Alter the program MonteCarlo to estimate the area
#' under the graph of y=1/(x+1) in the unit square

n = 10000 # the number of experiments
inside_num = 0 # the number of points under the curve y=x^2
xdata = runif(n) # x value of point
ydata = runif(n) # y value of point
for (i in 1:n) {
  x = xdata[i]
  y = ydata[i]
  if (y < 1/(x+1)) {
    inside_num = inside_num + 1
  }
}

x = seq(0, 1, 0.001)
y = 1 / (x + 1)
polyx = c(x, rev(x))
polyy = c(rep(0,length(x)), rev(y))

plot(c(), c(), main='y = 1 / (x + 1)',
     axes=F, xlab='', ylab='', xlim=c(0,1), ylim=c(0,1), asp=1)
lines(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))

polygon(polyx, polyy, col='skyblue')
points(xdata, ydata, cex=.01)

cat('Estimate of area is ', inside_num / n)
cat('true log2 is ', log(2))
