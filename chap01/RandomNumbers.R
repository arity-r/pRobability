
#' Example 1.1 (Random Number Generation)
#' The program generates n random real numbers in the interval
#' [0, 1], where n is chosen by the user.

n = 20 # the amount of random numbers
for (i in 1:n) { # do this n times
  cat(runif(1), "\t") # print a random number with a tab
}
