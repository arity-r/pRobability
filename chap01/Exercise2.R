
#' Exercise 2
#' Modify the program CoinTosses so that it tosses a coin n
#' times and records whether or not the propotion of heads is
#' within .1 of .5 (i.e. between .4 and .6)
#' This program repeats this experiment 100 times.
#' About how large must n be so that approximately 95 out of 100
#' times the proportion of heads is between .4 and .6?

n = 100 # maximum number of n

# make coin matrix
coin = matrix(sample(c(T,F), n*100, replace=T), nrow=n, ncol=100)
property = lapply(1:n, function(n)
  apply(coin[1:n, ,drop=F], 2, function(x) length(which(x))/length(x))
  ) # calculate propotion of head
property = matrix(unlist(property), nrow=n, ncol=100, byrow=T) # list -> matrix
plot(1:n, apply(property, 1, function(x) length(x[0.4<x&x<0.6])),
     type='l', xlab='#coin toss', ylab='#>0.4 and <0.6')
