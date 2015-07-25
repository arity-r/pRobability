
#' Example 2.3 BuffonsNeedle
#' This program will estimate the area of the
#' region E under the curve d=1/2*sin(theta) in the
#' theta:[0, pi/2], d:[0, 1/2]

n = 10000 # the number of experiments
theta_data = runif(n) * pi / 2 # angle of needles
ddata = runif(n, min=0, max=0.5) # the distance from the center of needle to the nearest lines
xdata = runif(n, min=0, max=10) # x value of points (for drawing needle)
ydata = runif(n, min=0, max=5) # y value of points (for ddrawing needle)
# the number of needles crossing a line
cross_num = length(ddata[ddata / sin(theta_data) < 1 / 2])

par(mfrow=c(1, 2))

# drawing region
theta = seq(0, pi / 2, 0.001)
d = 0.5 * sin(theta)
pt = c(theta, rev(theta))
pd = c(rep(0, length(theta)), rev(d))

plot(theta, d, type='l', xlim=c(0, pi/2), ylim=c(0, 1/2))
polygon(pt, pd, col='skyblue')
points(theta_data[seq(1, n, 10)], ddata[seq(1, n, 10)], cex=.01)

# drawing lattice
plot(1, type='n', xlab='', ylab='', main='Needles', axes=F,
     xlim=c(0, 10), ylim=c(0, 5), asp=1)
for (i in 0:5) {
  abline(h=i)
}

# drawing needles
for (i in seq(1, n, 100)) {
  x = xdata[i]
  y = ydata[i]
  t = theta_data[i]
  d = ddata[i]
  lines(c(x - 0.5*cos(t), x + 0.5*cos(t)),
        c(y + d - 0.5*sin(t), y + d + 0.5*sin(t)),
        col='skyblue', asp=1)
}

cat('Estimate of area is ', cross_num / n * (pi / 4))
cat('Estimate of pi is ', 2 / (cross_num / n))
