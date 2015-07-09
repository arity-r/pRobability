
#' Example 2.3 BuffonsNeedle
#' This program will estimate the area of the
#' region E under the curve d=1/2*sin(theta) in the
#' theta:[0, pi/2], d:[0, 1/2]

n = 10000 # the number of experiments
cross_num = 0 # the number of needles crossing a line
theta_data = rep(0, n) # angle of needles
ddata = rep(0, n) # the distance from the center of needle to the nearest lines
xdata = rep(0, n) # x value of points
ydata = rep(0, n) # y value of points
for (i in 1:n) {
  # plot a point on unit square at random
  d = runif(1) * 0.5
  t = runif(1) * 0.5 * pi
  if (d / sin(t) < 1 / 2) {
    cross_num = cross_num + 1
  }
  theta_data[i] = t
  ddata[i] = d
  xdata[i] = runif(1) * 10
  ydata[i] = runif(1) * 5
}

theta = seq(0, pi / 2, 0.001)
d = 0.5 * sin(theta)
pt = c(theta, rev(theta))
pd = c(rep(0, length(theta)), rev(d))

par(mfrow=c(1, 2))
plot(theta, d, type='l', xlim=c(0, pi/2), ylim=c(0, 1/2))
polygon(pt, pd, col='skyblue')
points(theta_data, ddata, cex=.01)

plot(1, type='n', xlab='', ylab='', main='Needles', axes=F,
     xlim=c(0, 10), ylim=c(0, 5))
for (i in 0:5) {
  abline(h=i, v=-1)
}

for (i in seq(1, n, 100)) {
  x = xdata[i]
  y = ydata[i]
  t = theta_data[i]
  d = ddata[i]
  lines(c(x - 0.5*cos(t), x + 0.5*cos(t)),
        c(y + d - 0.5*sin(t), y + d + 0.5*sin(t)),
        col='skyblue')
}

cat('Estimate of area is ', cross_num / n * (pi / 4))
