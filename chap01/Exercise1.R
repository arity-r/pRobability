
#' Exercise 1
#' Modify the program CoinTosses to toss a coin n times and 
#' print out after every 100 tosses
#'   the proportion of heads minus 1 / 2
#'   the number of heads minus half the number of tosses
#' Do these numbers appear to approach 0 as n increases?

n = 4000 # number of coin tossing
count_head = 0 # this counts the number of head
x = c(1:(n/100))
y1 = rep(0, n/100) # the proportion of heads minus 1 / 2
y2 = rep(0, n/100) # the number of heads minus half the number of tosses
for (i in 1:n) {
  
  if (runif(1) < 1 / 2) { # if a result is a head
    count_head = count_head + 1 # inccrease count by 1
  }
  
  if (i %% 100 == 0) { # every 100 tosses
    y1[i / 100] = count_head / i - 1 / 2 # store the proportion of head minus 1 / 2
    y2[i / 100] = count_head - i / 2 # store the number of heads minus half the number of tosses
  }
}

par(mfrow=c(2, 1)) # 2 figures arranged in 2 rows and 2 columns
cat(length(x))
cat(length(y1))
cat(length(y2))
plot(x, y1, main='The proportion of heads minus 1 / 2', type='l')
plot(x, y2, main='The number of heads minus half the number of tosses', type='l')
