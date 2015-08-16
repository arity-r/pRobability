
#' Exercise 5
#' Consider the bet that all three dice will turn up sixes at least
#' once in n rolls of three dice.
#' Calculate f(n), the probability of at least one triple-six
#' when three dice are rolled n times.
#' Determine the smallest value of n necessary for a favorable bet
#' that a triple-six will occur when time three dice are rolled n times.

n = 160

# roll three dices
dice = function(dummy) paste(sample(1:6, 3, replace=T), collapse=' ')
# make dice matrix (attention: string format)
dice = matrix(sapply(1:(n*100), dice), nrow=n, ncol=100)

win = lapply(1:n, function(n)
  apply(dice[1:n, ,drop=F], 2, function(x) length(which(x=='6 6 6'))>0)
) # winning game
win = matrix(unlist(win), nrow=n, ncol=100, byrow=T) # list -> matrix
plot(1:n, apply(win, 1, function(x) length(which(x))/ncol(win)),
     main='Probability of at least one triple-six',
     type='l', xlab='#dice roll', ylab='proberbility to win')
