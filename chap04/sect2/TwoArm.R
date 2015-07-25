
#' Example 4.24 (Two-armed bandit problem)
#' The probability that the first machine pays off
#' a dollar is x and that the second machine pays off
#' a dollar is y.
#' You are permitted to make a series of ten plays.
#' each time choosing one machine or the other.
#' How should you choose to maximize the number of
#' time that you win?
n = 10

#' Strategy 1: At every stage, the probability that each
#' machine will pay off and choose the machine with the
#' higher probability.
#' Let win(i), for i=1, 2, be the number of times that you
#' have won on the i-th machine. Similarly, let lose(i) be
#' the number of times you have lose on the i-th machine.
#' Then, from Example 4.23, the probability p(i) that you
#' win if you choose the i-th machine is
#'   p(i) = (win(i) + 1) / (win(i) + lose(i) + 2)
#' Thus, if p(1) > p(2) you would play machine 1 and otherwise
#' you would play machine 2.

x = c(.6, .7) # winning probability

best = data.frame(Machine=numeric(0), Result=numeric(0))
for (i in 1:n) {
  # for each machine, count winning game
  w = sapply(1:length(x), function(x) length(which(best$Machine == x & best$Result == 1)))
  # and losing game
  l = sapply(1:length(x), function(x) length(which(best$Machine == x & best$Result == 0)))
  
  p = (w + 1) / (w + l + 2)
  machine = which.max(p)
  result = runif(1) < x[machine]
  best[nrow(best)+1, ] = c(machine, result)
}
# convert 0,1 to 'L','W'
best$Result = sapply(best$Result, function(x) if(x) 'W' else 'L')

#' Strategy 2: For this strategy we choose the same machine when
#' we win and switch machines when we lose.

win = data.frame(Machine=numeric(0), Result=numeric(0))
machine = 1 # first, we play machine 1
for (i in 1:n) {
  result = runif(1) < x[machine]
  win[nrow(win)+1, ] = c(machine, result)
  # update machine
  machine = if(result) machine else sample(as.list(setdiff(1:length(x), machine)), 1)[[1]]
}
# convert 0,1 to 'L','W'
win$Result = sapply(win$Result, function(x) if(x) 'W' else 'L')

# now, plot the result
strategy = list(best, win)
names = c('Play the best machine', 'Play the winner')
par(mfrow=c(length(strategy), 1))
for (s_i in 1:length(strategy)) {
  s = strategy[s_i][[1]]
  print(s)
  # counting winning/losing with this strategy and each machine
  w = sapply(1:length(x), function(i) length(which(s$Machine == i & s$Result == 'W')))
  l = sapply(1:length(x), function(i) length(which(s$Machine == i & s$Result == 'L')))
  p = seq(0, 1, 0.001)
  
  plot(c(), main=names[s_i],
       xlim=c(0, 1), ylim=c(0, 5),
       xlab='', ylab='', type='n')
  for (i in 1:length(x)) {
    d = dbeta(p, w[i]+1, l[i]+1)
    lines(p, d, lty='solid')
  }
}

# print result
'Strategy 1:'
best

'Strategy 2:'
win
