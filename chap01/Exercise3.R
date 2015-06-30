
#' Exercise 3
#' This program simulate the roll of three dice a large number of times
#' and keep track of the proportion of times that the sum is 9 and 10

n = 10000
num_9 = num_10 = 0 # counts the number of sum 9 and 10

for (i in 1:n) {
  dice_1 = as.integer(runif(1) * 6 + 1) # roll three dices
  dice_2 = as.integer(runif(1) * 6 + 1)
  dice_3 = as.integer(runif(1) * 6 + 1)
  
  if (dice_1 + dice_2 + dice_3 == 9) {
    num_9 = num_9 + 1
  }
  if (dice_1 + dice_2 + dice_3 == 10) {
    num_10 = num_10 + 1
  }
}

barplot(c(num_9, num_10),
        main='Dice sum',
        names.arg=c('9', '10'))
