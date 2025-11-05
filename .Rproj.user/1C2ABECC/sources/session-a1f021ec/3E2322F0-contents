library(cluster)
library(dplyr)

source("scripts/generate_data.R")

#function for Gap Statistic results
simulate_gap <- function() {
  #create empty dataframe to store results
  results <- data.frame()
  ##loop through datasets with different numbers of dimensions and clusters
  for (n in c(6, 5, 4, 3, 2)) {
    for (side_len in seq(10, 1, by = -1)) {
      #set fixed seed for reproducibility
      set.seed(123)
      dat <- generate_hypercube_clusters(n, k = 100, side_length = side_len)
      gap <- clusGap(dat$data, FUN = kmeans, nstart = 20, iter.max = 50, K.max = n + 2, B = 50)
      best_k <- which.max(gap$Tab[, "gap"])
      results <- rbind(results, data.frame(dimension = n, side_length = side_len, estimated_k = best_k))
    }
  }
  write.csv(results, "results/data/gap_results.csv", row.names = FALSE)
}

simulate_gap()
