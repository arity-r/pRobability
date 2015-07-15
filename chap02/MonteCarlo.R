
#' Example 2.2 MonteCarlo
#' This program will estimate the area of the
#' region E under the curve y=x^2 in the unit square

n = 1000 # the number of experiments
inside_num = 0 # the number of points under the curve y=x^2
xdata = runif(n) # x value of point
ydata = runif(n) # y value of point
for (i in 1:n) {
  # plot a point on unit square at random
  x = xdata[i]
  y = ydata[i]
  if (y < x*x) {
    inside_num = inside_num + 1
  }
}

# draw y = x^2
x = seq(0, 2, 0.001)
y = x ^ 2
px = c(x, rev(x))
py = c(rep(0, length(x)), rev(y))

plot(x, y, axes=F, type='l', xlim=c(0, 1), ylim=c(0, 1), asp=1)
polygon(px[px<1&py<1], py[px<1&py<1], col='skyblue')
lines(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))
points(xdata, ydata, cex=.01)

cat('Estimate of area is ', inside_num / n)
