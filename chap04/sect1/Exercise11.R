
#' Exercise 41
#' This program simulates the Monty Hall problem.

# a function that calculate other door list
# from two doors
different <- function(xdoors, ydoors) {
  door_list <- matrix(c(xdoors, ydoors), nrow=2, byrow=T)
  door_list <- as.list(as.data.frame(door_list))
  opens <- unlist(lapply(door_list, function(x) {
    return(sample(as.list(setdiff(1:3, x)), 1)) } ))
  return(opens)
}

n = 10000 # the number of simulation
cars = sample(1:3, n, replace=T) # car hidden behind the door
players = sample(1:3, n, replace=T) # player choose the door
#cars = rep(1, n)
#players = rep(2, n)
# the dealer opens the door
# (the door must not be
#   player selected
#   car hidden behind it
# )

opens = different(players, cars)

# staying wins...
wins_staying = length(players[players == cars]) / n

# switching wins...
wins_switching = length(players[different(players, opens) == cars]) / n

barplot(c(wins_staying, wins_switching),
        ylim=c(0, 1),
        names.arg=c('staying', 'switching'))
