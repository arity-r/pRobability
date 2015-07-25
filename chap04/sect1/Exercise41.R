
#' Exercise 41
#' Calculate P(r, s)
#'  (a) P(r, N) = 0 if r < N
#'  (b) P(N, s) = 1 if s < N
#'  (c) P(r, s) = p*P(r+1, s) + q*P(r, s+1)
#'      if r < N and s < N
#' 

N = 10
p = 0.1

q = 1 - p
P = matrix(nrow=N+1, ncol=N+1)

# apply (a)
P[N+1, ] = 1
# apply (b)
P[, N+1] = 0

# apply (c)
for (i in N:1) {
  for (j in N:1) {
    P[i, j] = p*P[i+1, j] + q*P[i, j+1]
  }
}

P
