#function to generate n clusters
generate_n_clusters <- function(n, k, side_length, noise_sd = 1.0) {
  
  #create one cluster centre per axis for n clusters
  centers <- diag(rep(side_length, n))
  
  #repeat the code once for each cluster i 
  #store results of each run in data_list
  data_list <- lapply(1:n, function(i) {
    #create normally distributed random noise
    noise <- matrix(rnorm(k * n, mean = 0, sd = noise_sd), ncol = n)
    
    #move all noise points so each cluster is centred at correct position
    cluster_points <- noise + centers[i, ]
    return(cluster_points)
  })
  
  #join all cluster point matrices into one matrix
  data <- do.call(rbind, data_list)
  
  #create cluster labels so each cluster (with k points) has k labels
  labels <- rep(1:n, each = k)
  
  #output the data and labels as a single list
  return(list(data = data, labels = labels))
}
