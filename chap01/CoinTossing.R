
#' Example 1.2 (Coin Tossing)
#' We can ask a computer to pick a random real number in the interval
#' [0, 1] and test to see if this number is less than 1/2.
#' If so, we shall call the outcome heads; if not we call it tails.
#' The program carries out the experiment of tossing a coin n times.

n = 20 # the amount of tossing experiment
sample(c('H', 'T'), n, replace=T)
