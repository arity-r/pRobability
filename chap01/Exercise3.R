
#' Exercise 3
#' This program simulate the roll of three dice a large number of times
#' and keep track of the proportion of times that the sum is 9 and 10

n = 10000
# summation of three dices, n times
dice_sum = apply(matrix(sample(1:6, n*3, replace=T), nrow=n, ncol=3), 1,
                 function(x) sum(x))
barplot(c(length(which(dice_sum==9)), length(which(dice_sum==10))),
        main='Dice sum',
        names.arg=c('9', '10'))
