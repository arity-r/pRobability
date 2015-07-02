
#' Exercise 6
#' In Las Vegas, a roulette wheel has 38 slots numbered
#' 0, 00, 1, 2, ..., 36. The 0 and 00 slots are green
#' and half of the remaining 36 slots are red and
#' half are black.
#' A croupier spins the wheel and throws in an ivory ball.
#' If you bet 1 dollar on red, you win 1 dollar if the ball
#' stops in a red slot and otherwise you lose 1 dollar.

n = 1000 # the number of bets
bet_num = c(1:n)
winnings = rep(0, n+1) # the amount of total winnings
winnings[1] = 0
for (i in 2:n+1) {
  if (runif(1) < 18.0 / 36) {
    winnings[i] = winnings[i-1] + 1 # win this game
  } else {
    winnings[i] = winnings[i-1] - 1 # lose 1 dollar
  }
}

winnings = winnings[(2:n+1)] # remove 1st element by slicing
plot(bet_num, winnings[(1:n)], type='l')
