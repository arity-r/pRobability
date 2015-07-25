
#' Exercise 10
#' If you take a stick of unit length and break it into
#' three pieces, choosing the breaks at random (i.e. choosing
#' two real numbers independently and uniformly from [0,1]),
#' then the probability that the three pieces form a triangle
#' is 1/4.
#' Consider now a similar experiment: First break the stick
#' at random, then break the longer piece at random.
#' Show that the two experiments are actually quite different.

is_triangle <- function(x) {
  x <- x[order(x)]
  l <- sort(c(x[1], x[2]-x[1], 1-x[2]))
  return(l[3] < l[1] + l[2])
}

n = 1000

#' choosing two breaks at random
data1 = data.frame(x=runif(n), y=runif(n))
data1$is_triangle = apply(data1, 1, is_triangle)

#' break the stick at random,
#' then break the longer piece at random
data2 = data.frame(x=runif(n))
data2$x = sapply(data2$x, function(x) if(x<0.5) x else 1-x)
data2$y = data2$x + runif(n, max=1-data2$x)
data2$is_triangle = apply(data2, 1, is_triangle)

par(mfrow=c(1,1))
barplot(c(
  length(data1$x[data1$is_triangle]) / n,
  length(data2$x[data2$is_triangle]) / n),
  main='The probability that the three pieces form a triangle',
  names.arg=c('Strategy 1', 'Strategy 2'),
  ylim=c(0, 1))
