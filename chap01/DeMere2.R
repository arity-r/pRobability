
#' Example 1.3 (Dice Rolling)
#' This program simulates de Mere's second bet that a pair of sixes will
#' occur in n rols of a pair of dice.

n = 25
win = FALSE
for (i in 1:n) {
  dice_1 = as.integer(runif(1) * 6 + 1)
  dice_2 = as.integer(runif(1) * 6 + 1)
  # if previous result and current result are 6
  if (dice_1 == 6 && dice_2 == 6) {
    win = TRUE
    break
  }
}

cat(win)
