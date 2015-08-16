
#' Example 1.3 (Dice Rolling)
#' This program simulates de Mere's second bet that a pair of sixes will
#' occur in n rols of a pair of dice.

n = 25
dice = function(dummy) {
  sample(1:6, 1) == 6 & sample(1:6, 1) == 6
}
any(sapply(1:n, dice))
