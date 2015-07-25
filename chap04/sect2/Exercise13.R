
#' Exercise 13
#' This program compare the strategies play-the winner and
#' play-the-best-machine for the two-armed bandit problem of
#' Example 4.24. Then, determine the initial payoff probabilities
#' for each machine by chosing a pair of random numbers between
#' 0 and 1.
#' This program carries out 20 plays and keep track of the number
#' of wins for each of the two strategies. Finally, make 1000
#' repetitions of the 20 plays and compute the average winning
#' per 20 plays.

N = 1000 # the number of repetitions
n = 20 # the number of plays
x = c(.6, .7) # winning probability
play_the_winner = numeric(0)
play_the_best_machine = numeric(0)
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
  
  play_the_winner[i] = length(which(win$Result == 1))
  play_the_best_machine[i]= length(which(best$Result == 1))
}

barplot(c(mean(play_the_winner / n),
          mean(play_the_best_machine / n)),
        ylim=c(0,1),
        main=sprintf('The average winning per %d plays', n),
        names.arg=c('play_the_winner', 'play_the_best_game'))
