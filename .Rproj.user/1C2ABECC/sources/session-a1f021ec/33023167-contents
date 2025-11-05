generate_shell_clusters <- function(n_shells, k_per_shell, max_radius, noise_sd = 0.1) {
  # radii equally spaced from 1 to max_radius
  radii <- seq(1, max_radius, length.out = n_shells)
  total_points <- n_shells * k_per_shell
  data <- matrix(0, nrow = total_points, ncol = 3)
  labels <- rep(1:n_shells, each = k_per_shell)
  
  idx <- 1
  for (r in radii) {
    # random spherical coordinates
    theta <- runif(k_per_shell, 0, 2 * pi)
    phi <- runif(k_per_shell, 0, pi)
    radius <- r + rnorm(k_per_shell, 0, noise_sd)
    x <- radius * sin(phi) * cos(theta)
    y <- radius * sin(phi) * sin(theta)
    z <- radius * cos(phi)
    data[idx:(idx + k_per_shell - 1), ] <- cbind(x, y, z)
    idx <- idx + k_per_shell
  }
  return(list(data = data, labels = labels))
}
