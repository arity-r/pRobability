
#' Exercise 7
#' For Buffon's needle problem, Laplace considered a grid
#' with horizontal and vertical lines one unit apart.
#' He showed that the probability that a needle of
#' length <= 1 crosses at least one line is
#'     p = (4*L - L^2) / pi
#' This program does the proceduire for 100, 1000, and 10000
#' experiments, and compare the results

L = 1 # needle length
N = c(100, 1000, 10000)
est_pi = rep(0, length(N))
for (i in 1:length(N)) {
  n = N[i]
  theta_data = runif(n, min=0, max=pi/2) # angle of needles
  d1data = runif(n, min=0, max=0.5) # the distance from the needle to horizontal lines
  d2data = runif(n, min=0, max=0.5) # the distance from the needle to vertical lines
  cross_num = length(ddata[d1data < L/2*sin(theta_data) |
                             d2data < L/2*cos(theta_data)])
  est_pi[i] = (4*L - L^2) / (cross_num / n)
}

par(mfrow=c(1,1))
barplot(sqrt((pi-est_pi)^2), main='Deviation between true pi and estimated pi',
        xlab='N', names.arg=N)
