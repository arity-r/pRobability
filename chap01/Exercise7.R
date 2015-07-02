
#' Exercise 7
#' Another form of bet for roulette is to bet that a specific
#' number (say 17) will turn up. If the ball stops on your
#' number, you get your dollar back plus 35 dollars.
#' If not, you lose your dollar.

n = 1000 # the number of bets
bet_num = c(1:n)
winnings = rep(0, n+1) # the amount of total winnings
winnings[1] = 0
for (i in 2:n+1) {
  if (runif(1) < 1.0 / 36) {
    winnings[i] = winnings[i-1] + 35 # win this game
  } else {
    winnings[i] = winnings[i-1] - 1 # lose 1 dollar
  }
}

winnings = winnings[(2:n+1)] # remove 1st element by slicing
plot(bet_num, winnings[(1:n)], type='l')
