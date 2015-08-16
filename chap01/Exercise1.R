
#' Exercise 1
#' Modify the program CoinTosses to toss a coin n times and 
#' print out after every 100 tosses
#'   the proportion of heads minus 1 / 2
#'   the number of heads minus half the number of tosses
#' Do these numbers appear to approach 0 as n increases?

n = 4000 # number of coin tossing

# the proportion of head minus 1 / 2
count_head_1 = function(i) {
  coin = runif(i)
  return(length(coin[coin < 1/2])/i - 1/2)
}

# the number of heads minus half the number of tosses
count_head_2 = function(i) {
  coin = runif(i)
  return(length(coin[coin < 1/2]) - i/2)
}

par(mfrow=c(2, 1)) # 2 figures arranged in 2 rows and 2 columns
tosses = seq(1, n, by=100)

plot(tosses, sapply(tosses, count_head_1), main='The proportion of heads minus 1 / 2', type='l')
plot(tosses, sapply(tosses, count_head_2), main='The number of heads minus half the number of tosses', type='l')
