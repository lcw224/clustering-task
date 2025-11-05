library(cluster)
source("scripts/generate_shell_clusters.R")
source("scripts/spectral_clustering.R")

#run spectral clustering simulation across different shell radii
run_spectral_simulation <- function() {
  #create empty dataframe to store results
  results <- data.frame()
  #loop through radii from 10 down to 0
  for (radius in seq(10, 0, by = -1)) {
    set.seed(123)
    dat <- generate_shell_clusters(n_shells = 4, k_per_shell = 100, max_radius = radius)
    gap <- clusGap(dat$data,
                   FUN = function(x, k) spectral_clustering(x, k, d_threshold = 1),
                   K.max = 6, B = 20)
    best_k <- which.max(gap$Tab[, "gap"])
    #add current radius and best_k to results table
    results <- rbind(results, data.frame(max_radius = radius, estimated_k = best_k))
  }
  write.csv(results, "results/data/spectral_gap_results.csv", row.names = FALSE)
}

run_spectral_simulation()
