
#' Example 1.4 (Heads or Tails)
#' Peter and Paul play a game called heads or tails.
#' In this game, a fair coin is tossed a sequence of times.
#' Each time a head comes up Peter wins 1 penny from Paul,
#' and each time a tail comes up Peter loses 1 penny to Paul.
#' Note: This program may show Peter's winnings

n = 40        # the number of game
x = c(1:n)    # x axis for graph
y = rep(0, n) # y axis for graph (Peter's winnings)
peter = 0     # peter's winnings
for (i in 1:n) {
  if (runif(1) < 1 / 2) { # if a head comes up
    peter = peter + 1     # Peter gets 1 penny
  } else {                # if a tail comes up
    peter = peter - 1     # Peter loses 1 penny
  }
  y[i] = peter            # record Peter's winnings
}

plot(x, y, type='l') # then, draw the graph
