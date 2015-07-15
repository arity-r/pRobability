
#install.packages('plotrix')
require(plotrix) # for drawing circle

#' Example 2.6 (Bertrand's Paradox)
n = 10000

#' Simulation 1
#' We choose values for x and y from [-1, 1] at random.
x = c()
y = c()
while (length(x) < n) {
  tmpx = runif(1) * 2 - 1
  tmpy = runif(1) * 2 - 1
  r = tmpx^2 + tmpy^2
  # Is this point on the circle?
  if (r < 1) {
    x = c(x, tmpx)
    y = c(y, tmpy)
  }
}
L = 2 * sqrt(1-(x^2+y^2))
res1 = length(L[L >= sqrt(3)])

#' Simulation 2
#' We take account of the fact that any rotation of
#' the circle does not change the length of the chord,
#' so we might as well assume in advance that
#' the chord is horizontal.
#' Then we choose r from [-1, 1] at random.
r = runif(n) * 2 - 1
L = 2 * sqrt(1 - r^2)
res2 = length(L[L >= sqrt(3)])

#' Simulation 3
#' We assume that one endpoint, say B, lies at (1, 0)
#' (i.e. that beta=0). Then we choose a value for alpha
#' from [0, 2pi] at random and compute the length of
#' the resulting chord.
alpha = runif(n) * 2 * pi
L = sqrt(2 - 2 * cos(alpha))
res3 = length(L[L >= sqrt(3)])

par(mfrow=c(2,3))

# Drawing first circle
plot(c(), c(), axes=F, xlim=c(-1,1), ylim=c(-1,1), xlab='', ylab='', asp=1)
draw.circle(0, 0, 1, border='black')
for (i in seq(1, n, 100)) {
  sx = x[i]^2
  sy = y[i]^2
  sr = sx + sy
  if (x[i] * y[i] < 0) {
    lines(c(x[i] + sqrt(sx-sr+sy/sr), x[i] - sqrt(sx-sr+sy/sr)),
          c(y[i] + sqrt(sy-sr+sx/sr), y[i] - sqrt(sy-sr+sx/sr)),
          col='skyblue', asp=1)
  } else {
    lines(c(x[i] - sqrt(sx-sr+sy/sr), x[i] - sqrt(sx-sr+sy/sr)),
          c(y[i] + sqrt(sy-sr+sx/sr), y[i] + sqrt(sy-sr+sx/sr)),
          col='skyblue', asp=1)
  }
}

# Drawing second circle
plot(c(), c(), axes=F, xlim=c(-1,1), ylim=c(-1,1), xlab='', ylab='', asp=1)
draw.circle(0, 0, 1, border='black')
for (i in seq(1, n, 100)) {
  lines(c(-sqrt(1-r[i]^2), sqrt(1-r[i]^2)),
        c(r[i], r[i]),
        col='skyblue', asp=1)
}

# Drawing third circle
plot(c(), c(), axes=F, xlim=c(-1,1), ylim=c(-1,1), xlab='', ylab='', asp=1)
draw.circle(0, 0, 1, border='black')
for (i in seq(1, n, 100)) {
  lines(c(1, cos(alpha[i])),
        c(0, sin(alpha[i])),
        col='skyblue', asp=1)
}

# Drawing bars
barplot(res1/n, ylim=c(0, 1), main=n)
barplot(res2/n, ylim=c(0, 1), main=n)
barplot(res3/n, ylim=c(0, 1), main=n)

cat('1st method: ', res1/n)
cat('2nd method: ', res2/n)
cat('3rd method: ', res3/n)
