library(ggplot2)
library(dplyr)

#read gap statistic results from csv file
results <- read.csv("results/data/gap_results.csv")

#create line plot showing estimated clusters vs side length for each dimension
ggplot(results, aes(x = side_length, y = estimated_k, colour = factor(dimension), group = dimension)) +
  geom_line(size = 1.2) +
  geom_hline(aes(yintercept = dimension), linetype = "dashed") +
  labs(title = "Estimated Number of Clusters vs Side Length",
       x = "Side Length",
       y = "Estimated Number of Clusters",
       colour = "Dimension") +
  theme_minimal()

ggsave("results/plots/gap_plot.png", width = 8, height = 6)
