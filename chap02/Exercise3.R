
#' Exercise 3
#' Alter the program MonteCarlo to estimate the area of
#' the circle of radius 1/2 with center at (1/2, 1/2)
#' inside the unit square by choosing 1000 points at random.

n = 1000 # the number of experiments
inside_num = 0 # the number of points under the curve y=x^2
xdata = runif(n) # x value of point
ydata = runif(n) # y value of point
for (i in 1:n) {
  x = xdata[i]
  y = ydata[i]
  if ((x-1/2)^2 + (y-1/2)^2 < 1/4) {
    inside_num = inside_num + 1
  }
}

x = seq(0, 1, 0.001)
uppery = 1/2 + sqrt(1/4 - (x-1/2)^2)
lowery = 1/2 - sqrt(1/4 - (x-1/2)^2)
polyx = c(x, rev(x))
polyy = c(lowery, uppery)

plot(c(), c(), main='circle in unit square',
     axes=F, xlab='', ylab='', xlim=c(0,1), ylim=c(0,1), asp=1)
lines(c(0, 1, 1, 0, 0), c(0, 0, 1, 1, 0))

polygon(polyx, polyy, col='skyblue')
points(xdata, ydata, cex=.01)

cat('Estimate of area is ', inside_num / n)
cat('Estimate of pi is ', inside_num / n * 4)
