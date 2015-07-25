
#' Exercise 14
#' Consider the two-armed bandit problem of Example 4.24,
#' Bruce Barnes proposed the following strategy.
#' The machine with the greatest probability of winning
#' is layed unless the following two conditions hold:
#'   (a) the difference in the probabilities for winning
#'   is less than .08
#'   (b) the ratio of the number of times played on the
#'   more often played machine is greater than 1.4
#' 
#' 

N = 1000 # the number of repetitions
n = 20 # the number of plays
x = c(.6, .7) # winning probability
play_the_winner = numeric(0)
play_the_best_machine = numeric(0)
bruce_barnes = numeric(0)
for (i in 1:N) {
  
  best = data.frame(Machine=numeric(0), Result=numeric(0))
  for (j in 1:n) {
    # for each machine, count winning game
    w = sapply(1:length(x), function(x) length(which(best$Machine == x & best$Result == 1)))
    # and losing game
    l = sapply(1:length(x), function(x) length(which(best$Machine == x & best$Result == 0)))
    
    p = (w + 1) / (w + l + 2)
    machine = which.max(p)
    result = runif(1) < x[machine]
    best[nrow(best)+1, ] = c(machine, result)
  }
  
  #' Strategy 2: For this strategy we choose the same machine when
  #' we win and switch machines when we lose.
  
  win = data.frame(Machine=numeric(0), Result=numeric(0))
  machine = sample(1:length(x), 1)
  for (j in 1:n) {
    result = runif(1) < x[machine]
    win[nrow(win)+1, ] = c(machine, result)
    # update machine
    machine = if(result) machine else sample(as.list(setdiff(1:length(x), machine)), 1)[[1]]
  }
  
  #' Strategy 3: Bruce Barnes
  bruce = data.frame(Machine=numeric(0), Result=numeric(0))
  machine = sample(1:length(x), 1)
  result = runif(1) < x[machine]
  bruce[nrow(bruce)+1, ] = c(machine, result)
  for (j in 1:n-1) {
    # times this machine is played
    m = sapply(1:length(x), function(x) length(which(bruce$Machine == x)))
    # for each machine, count winning game
    w = sapply(1:length(x), function(x) length(which(bruce$Machine == x & bruce$Result == 1))) / m
    if (max(w) - min(w) > 0.08 & min(m) / max(m) > 1 / 1.4) {
      machine = which.min(w)
    } else {
      machine = which.max(w)
    }
    
    result = runif(1) < x[machine]
    bruce[nrow(bruce)+1, ] = c(machine, result)
  }
  
  play_the_winner[i] = length(which(win$Result == 1))
  play_the_best_machine[i]= length(which(best$Result == 1))
  bruce_barnes[i] = length(which(bruce$Result == 1))
}

barplot(c(mean(play_the_winner / n),
          mean(play_the_best_machine / n),
          mean(bruce_barnes / n)),
        ylim=c(0,1),
        main=sprintf('The average winning per %d plays', n),
        names.arg=c('play_the_winner', 'play_the_best_game', 'bruce_barnes'))
