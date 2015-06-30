
#' Example 1.3 (Dice Rolling)
#' This program simulates de Mere's second bet that a pair of sixes will
#' occur in n rols of a pair of dice.

n = 25
dice = rep(0, n) # stores dice
win = FALSE
for (i in 1:n) {
  dice[i] = as.integer(runif(1) * 6 + 1)
  # if previous result and current result are 6
  if (i > 1 && dice[i] == 6 && dice[i-1] == 6) {
    win = TRUE
    break
  }
}

cat(win)
