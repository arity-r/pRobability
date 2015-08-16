
#' Exercise 6
#' In Las Vegas, a roulette wheel has 38 slots numbered
#' 0, 00, 1, 2, ..., 36. The 0 and 00 slots are green
#' and half of the remaining 36 slots are red and
#' half are black.
#' A croupier spins the wheel and throws in an ivory ball.
#' If you bet 1 dollar on red, you win 1 dollar if the ball
#' stops in a red slot and otherwise you lose 1 dollar.

n = 1000 # the number of bets
dollar = ifelse(runif(n) < 18 / 36, 1, -1)
winnings = cumsum(dollar)
plot(1:n, winnings, type='l',
     xlab='bet_num', ylab='winnings')
