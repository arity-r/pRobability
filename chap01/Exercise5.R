
#' Exercise 5
#' Consider the bet that all three dice will turn up sixes at least
#' once in n rolls of three dice.
#' Calculate f(n), the probability of at least one triple-six
#' when three dice are rolled n times.
#' Determine the smallest value of n necessary for a favorable bet
#' that a triple-six will occur when time three dice are rolled n times.

n = 160
x = c(1:n)
y = rep(0, n)

for (i in 1:n) {
  count_win = 0
  for (j in 1:100) {
    for (k in 1:i) {
      dice_1 = as.integer(runif(1) * 6 + 1) # roll a dice
      dice_2 = as.integer(runif(1) * 6 + 1) # roll a dice
      dice_3 = as.integer(runif(1) * 6 + 1) # roll a dice
      if (dice_1 == 6 && dice_2 == 6 && dice_3 == 6) { # if three-six
        count_win = count_win + 1 # win the game
        break
      }
    }
  }
  
  y[i] = count_win / 100 # the probability of at least one triple-six
  
}

plot(x, y, main='Probability of at least one triple-six', type='l')
