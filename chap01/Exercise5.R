
#' Exercise 5
#' Consider the bet that all three dice will turn up sixes at least
#' once in n rolls of three dice.
#' Calculate f(n), the probability of at least one triple-six
#' when three dice and rolled n times.
#' Determine the smalles value of n necessary for a favorable bet
#' that a triple-six will ocur when time three

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
      if (dice_1 == 6 && dice_2 == 6 && dice_3 == 6) { # if these are all six
        count_win = count_win + 1 # win the game
        break
      }
    }
  }
  
  y[i] = count_win / 100
  
}

plot(x, y)
