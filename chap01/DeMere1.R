
#' Example 1.3 (Dice Rolling)
#' This program simulates a large number of experiments, seeing,
#' in each one, if a six turns up in four rolls of a dice.

n = 10000
dice = function(dummy) {
  sample(1:6, 1) == 6 | sample(1:6, 1) == 6 |
  sample(1:6, 1) == 6 | sample(1:6, 1) == 6
}
dice = sapply(1:n, dice)
length(dice[dice]) / n
