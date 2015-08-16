
#' Example 1.5 (Horse Races)
#' Four horses (Acorn, Balky, Chestnut, and Dolby) have raced many
#' times. It is estimated that
#'   Acorn wins 30 percent of the time,
#'   Balky 40 percent of the time,
#'   Chestnut 20 percent of the time,
#'   Dolby 10 percent of the time.
#' This program simulates the outcomes of n races.

n = 1000        # the number of race
win_rate = c(.3, .4, .2, .1)
win_horse = c('Acorn', 'Balky', 'Chestnut', 'Dolby')


# cumlative winning rate for a horse
win_rate = cumsum(win_rate / sum(win_rate))
# create table for apply function
rate_table = data.frame(Horse=win_horse, Rate=win_rate)
# generate sentence for eval
sentence = apply(rate_table, 1, function(x) paste(
  c('ifelse(race<', x['Rate'], ',"', x['Horse'], '",\n'), collapse='') )
sentence = paste(c(sentence, rep(')', length(win_horse))), collapse='')

# do simulation
race = runif(n)
result = eval(parse(text=sentence))

barplot(sapply(win_horse, function(x) length(which(result==x))),
        main='Horse Races', names.arg=win_horse)
