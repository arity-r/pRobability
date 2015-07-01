
#' In raquetball, a player continues to serve as long as she is winning:
#' a point is scored only when a player is serving and wins the volley.
#' The first player to win 21 points wins the game.
#' Assume that you serve first and have a probability 0.6 of winning a
#' volley when you serve
#' and probability 0.5 when your oppornent serves.

n = 1000 # number of games
win_count = 0 # the number of games which I won
for (i in 1:n) {
  score_me = score_oppornent = 0
  is_serve_me = TRUE
  while (score_me < 21 && score_oppornent < 21) {
    
    # if I serve, win with probability 0.6 and oppornent serve, win with probability of 0.5
    if (is_serve_me && runif(1) < 0.6 || !is_serve_me && runif(1) < 0.5) {
      score_me = score_me + 1
      is_serve_me = TRUE
    } else {
      score_oppornent = score_oppornent + 1
      is_serve_me = FALSE
    }
    
  if (score_me > score_oppornent) {
    win_count = win_count + 1
  }
  
}

cat(win_count / n)
