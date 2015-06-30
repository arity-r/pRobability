
#' Example 1.5 (Horse Races)
#' Four horses (Acorn, Balky, Chestnut, and Dolby) have raced many
#' times. It is estimated that
#'   Acorn wins 30 percent of the time,
#'   Balky 40 percent of the time,
#'   Chestnut 20 percent of the time,
#'   Dolby 10 percent of the time.
#' This program simulates the outcomes of n races.

n = 1000        # the number of race
a_win = b_win = c_win = d_win = 0
for (i in 1:n) {
  r = runif(1)
  if (r < 0.3) {        # Acorn wins
    a_win = a_win + 1
  } else if (r < 0.7) { # Balky wins (0.3 + 0.4)
    b_win = b_win + 1
  } else if (r < 0.9) { # Chestnut wins (0.3 + 0.4 + 0.2)
    c_win = c_win + 1
  } else {              # Dolby wins
    d_win = d_win + 1
  }
}

barplot(c(a_win, b_win, c_win, d_win),
        main='Horse Races',
        names.arg=c('Acorn', 'Balky', 'Chestnut', 'Dolby'))
