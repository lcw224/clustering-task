library(ggplot2)

results <- read.csv("results/data/spectral_gap_results.csv")

ggplot(results, aes(x = max_radius, y = estimated_k)) +
  geom_line(colour = "steelblue", size = 1.2) +
  geom_hline(yintercept = 4, linetype = "dashed", colour = "red") +
  labs(title = "Spectral Clustering: Estimated Number of Clusters vs Max Radius",
       x = "Maximum Radius",
       y = "Estimated Number of Clusters (k)") +
  theme_minimal()

ggsave("results/plots/spectral_gap_plot.png", width = 8, height = 6)
