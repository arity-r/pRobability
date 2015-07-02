
#' Example 1.2 (Coin Tossing)
#' We can ask a computer to pick a random real number in the interval
#' [0, 1] and test to see if this number is less than 1/2.
#' If so, we shall call the outcome heads; if not we call it tails.
#' The program carries out the experiment of tossing a coin n times.

n = 20 # the amount of tossing experiment
for (i in 1:n) {
  if (runif(1) < 1 / 2) { # a random number is less than 1/2 ?
    cat('H') # if so, the result is heads
  } else {
    cat('T') # if not, the result is tails
  }
}
