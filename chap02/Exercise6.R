
#' Exercise 6
#' Run BuffonsNeedle.R several times for each of 100, 1000, and 10000
#' experiments.
#' Does the accuracy of the experimental approximation
#' for pi improve as the number of experiments increases?

N = c(100, 1000, 10000)
est_pi = rep(0, length(N))
for (i in 1:length(N)) {
  n = N[i]
  theta_data = runif(n) * pi / 2 # angle of needles
  ddata = runif(n) / 2 # the distance from the center of needle to the nearest lines
  est_pi[i] = 2 / (length(ddata[ddata / sin(theta_data) < 1 / 2]) / n) # estimate pi
}

par(mfrow=c(1,1))
barplot(sqrt((pi-est_pi)^2), main='Deviation between true pi and estimated pi',
        xlab='N', names.arg=N)
