
#' Exercise 7
#' Another form of bet for roulette is to bet that a specific
#' number (say 17) will turn up. If the ball stops on your
#' number, you get your dollar back plus 35 dollars.
#' If not, you lose your dollar.

n = 1000 # the number of bets
dollar = ifelse(runif(n) < 1 / 36, 35, -1)
winnings = cumsum(dollar)
plot(1:n, winnings, type='l',
     xlab='bet_num', ylab='winnings')
