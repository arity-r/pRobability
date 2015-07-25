
#' Exercise 20
#' The Polya urn model for contagion is as follows:
#' We start with and urn which contains one white ball
#' and one black ball.
#' At each second we choose a ball at random from the
#' urn and replace this ball and add one more of the
#' color chosen.

n = 10000 # number of draw
n_white = 1 # number of white ball in urn
n_black = 1 # number of black ball in urn

for (i in 1:n) {
  if (runif(1) < n_white / (n_white + n_black)) {
    # draw white and add white
    n_white = n_white + 1
  } else {
    # draw black and add black
    n_black = n_black + 1
  }
}

par(mfrow=c(1,1))
barplot(c(n_white/(n_white+n_black), n_black/(n_white+n_black)),
        main='the proportion of <color> ball',
        ylim=c(0,1),
        names.arg=c('white', 'black'))
