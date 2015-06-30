
#' Example 1.3 (Dice Rolling)
#' This program simulates a large number of experiments, seeing,
#' in each one, if a six turns up in four rolls of a dice.

n = 10000
count = 0
for (i in 1:n) {
  # 1st dice
  if (as.integer(runif(1) * 6 + 1) == 6) { # if roll a dice and six turns up
    count = count + 1
  } else if (as.integer(runif(1) * 6 + 1) == 6) { # 2nd dice
    count = count + 1
  } else if (as.integer(runif(1) * 6 + 1) == 6) { # 3rd dice
    count = count + 1
  } else if (as.integer(runif(1) * 6 + 1) == 6) { # 4th dice
    count = count + 1
  }
}

cat(count / n)
