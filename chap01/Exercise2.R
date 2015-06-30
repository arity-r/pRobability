
#' Exercise 2
#' Modify the program CoinTosses so that it tosses a coin n
#' times and records whether or not the propotion of heads is
#' within .1 of .5 (i.e. between .4 and .6)
#' This program repeats this experiment 100 times.
#' About how large must n be so that approximately 95 out of 100
#' times the proportion of heads is between .4 and .6?

N = 100      # maximum number of n
x = c(1:N)    # data for x axis
y = rep(0, N) # data for the proportion of heads is between .4 and .6
for (n in 1:N) {
  count_p = 0
  for (i in 1:100) { # run 100 experiments
    count_head = 0
    for (j in 1:n) { # toss a coin n times
      if (runif(1) < 1/ 2) { # if a result is a head
        count_head = count_head + 1
      }
    }
    
    property = count_head / n
    if (0.4 < property && property < 0.6) {
      count_p = count_p + 1
    }
    
  }
  
  y[n] = count_p
  
}

plot(x, y, main='The number of experiments', type='l')
