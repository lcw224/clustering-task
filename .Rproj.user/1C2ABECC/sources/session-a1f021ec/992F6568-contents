#stats library for distance and kmeans functions
library(stats)

spectral_clustering <- function(x, k, d_threshold = 1) {
  #calculate Euclidean distance matrix
  dist_mat <- as.matrix(dist(x))
  
  #create adjacency matrix where points closer than d_threshold are connected
  A <- (dist_mat < d_threshold) * 1
  
  #calculate diagonal matrix diagonal with row sums of adjacency matrix
  D <- diag(rowSums(A))
  
  #calculate unnormalized graph Laplacian
  L <- D - A
  
  D_inv_sqrt <- diag(1 / sqrt(diag(D)))
  D_inv_sqrt[is.infinite(D_inv_sqrt)] <- 0
  L_sym <- D_inv_sqrt %*% L %*% D_inv_sqrt
  
  #eigen-decomposition on Laplacian
  eig <- eigen(L_sym, symmetric = TRUE)
  #select k eigenvectors corresponding to smallest eigenvalues
  eig_vecs <- eig$vectors[, (ncol(eig$vectors) - k + 1):ncol(eig$vectors)]
  
  #cluster points by running k-means on the eigenvector representation
  clusters <- kmeans(eig_vecs, centers = k, nstart = 20, iter.max = 50)
  
  return(list(cluster = clusters$cluster))
}
