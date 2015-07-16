
#' Example 2.2 MonteCarlo
#' This program will estimate the area of the
#' region E under the curve y=x^2 in the unit square

n = 1000 # the number of experiments
xdata = runif(n) # x value of point
ydata = runif(n) # y value of point
# the number of points under the curve y=x^2
inside_num = length(xdata[ydata < xdata * xdata])

# draw y = x^2
x = seq(0, 2, 0.001)
y = x ^ 2
px = c(x, rev(x))
py = c(rep(0, length(x)), rev(y))
# empty plot
plot(c(), c(), main='y = x^2',
     axes=F, xlab='', ylab='', xlim=c(0,1), ylim=c(0,1), asp=1)
# drawing region
polygon(px[px<1&py<1], py[px<1&py<1], col='skyblue')
# drawing square
lines(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))
# plotting points
points(xdata, ydata, cex=.01)

cat('Estimated area is ', inside_num / n)
