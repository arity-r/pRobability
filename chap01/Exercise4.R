
#' In raquetball, a player continues to serve as long as she is winning:
#' a point is scored only when a player is serving and wins the volley.
#' The first player to win 21 points wins the game.
#' Assume that you serve first and have a probability 0.6 of winning a
#' volley when you serve
#' and probability 0.5 when your oppornent serves.

n = 1000 # number of games
win_rate = function(is_serve) if (is_serve) 0.6 else 0.5

game = function(is_serve, me, opponent) {
  if (me == 21) T # win the game
  else if (opponent == 21) F # lose the game
  else if (runif(1) < win_rate(is_serve)) # win the point
    game(T, me+1, opponent) # win
  else
    game(F, me, opponent+1) # lose
}

simulation = function(n) {
  sapply(1:n, function(x) game(T, 0, 0))
}

cat('win probability: ', sum(simulation(n)) / n)
