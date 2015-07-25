
#' Exercise 8
#' A long needle of length L much bigger than 1 is
#' dropped on a grid with horizontal and vertical
#' lines one unit apart.
#' We will see that the average number a of lines
#' crossed is approximately
#'     a = 4*L / pi
#' This program estimate pi by the formula.

L = 100
N = c(100, 1000, 10000)
est_pi = rep(0, length(N))
for (i in 1:length(N)) {
  n = N[i]
  theta_data = runif(n, min=0, max=pi/2) # angle of needles
  cross_num = L*sin(theta_data) + L*cos(theta_data)
  est_pi[i] = (4*L) / (mean(cross_num))
}

par(mfrow=c(1,1))
barplot(sqrt((pi-est_pi)^2), main='Deviation between true pi and estimated pi',
        xlab='N', names.arg=N)
