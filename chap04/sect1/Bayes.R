
#' Example 4.16 Bayes
#' A doctor is trying to decide if a patient has one of three diseases
#' d1, d2, d3. Two tests area to be carried out, each of which results
#' in a positive or a negative outcome.
#' Records have indicated that, for 10000 people having one of these three
#' diseases, the distribution of diseases and test results are as in
#' Diseases.csv.
#' Using Bayes' formula to compute various poterior probabilities.

# read data from file
data = read.csv('Diseases.csv')

col = 2:(length(colnames(data))) # rolumn range
levels = length(data[,1]) # the number of diseases
# make matrix of sum of each columns and divide raw data by
# the metrix, then, transpose
res = t(
  data[,col] /
  matrix(rep(colSums(data[,col]), levels), nrow=levels, byrow=T))
colnames(res) <- data[,1] # add header to result table
res
