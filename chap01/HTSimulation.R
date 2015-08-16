
#' Example 1.4 (Heads or Tails)
#' Peter and Paul play a game called heads or tails.
#' In this game, a fair coin is tossed a sequence of times.
#' Each time a head comes up Peter wins 1 penny from Paul,
#' and each time a tail comes up Peter loses 1 penny to Paul.
#' Note: This program may show Peter's winnings

n = 40 # the number of game
penny = ifelse(runif(n) < 1/2, 1, -1)
peter = cumsum(penny)

plot(1:n, peter, type='l', xlab='bet', ylab='winnings') # then, draw the graph
