
#' Exercise 1
#' In the spinner problem divide the unit
#' circumferece into three arcs of length
#' 1/2, 1/3, 1/6.
#' This program simulates the spiner experiment
#' 1000 times and print out what fraction of the
#' outcomes fall in each of the three arcs.
#' Now plot a bar graph whose bars have width
#' 1/2, 1/3, 1/6 and areas equal to the corresponding
#' fractions as determined by the simulation.
#' Show that the heights of the bars are all
#' nearly the same.

n = 1000
r = runif(n)
num1 = length(r[r < 1/2]) # the number of 1/2
num2 = length(r[r >= 1/2 & r < 1/2+1/3]) # the number of 1/3
num3 = length(r[r >= 1/2+1/3]) # the number of 1/6

par(mfrow=c(1,1))
barplot(c(num1/n/(1/2), num2/n/(1/3), num3/n/(1/6)),
        width=c(1/2, 1/3, 1/6),
        ylim=c(0, 1), axes=F)
