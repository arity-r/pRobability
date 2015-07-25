
#' Exercise 2
#' This program simulates the same as in Exercise 1
#' but divide the unit circumference into five
#' arcs of length
#' 1/3, 1/4, 1/5, 1/6, 1/20

n = 1000
r = runif(n)
props = c(1/3, 1/4, 1/5, 1/6, 1/20)
nums = numeric(0)
accumlate = 0
for (i in 1:5) {
  nums[i] = length(r[r >= accumlate & r < accumlate + props[i]])
  accumlate = accumlate + props[i]
}

par(mfrow=c(1,1))
barplot(nums/n/(props),
        width=props,
        ylim=c(0, 1), axes=F)
