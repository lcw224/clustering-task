# Makefile for Clustering Project
# Automates data generation, clustering, and plotting

all: results/plots/gap_plot.png results/plots/spectral_gap_plot.png

# Run K-means Gap Statistic simulation
results/data/gap_results.csv: scripts/run_gap_simulation.R scripts/generate_data.R
	Rscript scripts/run_gap_simulation.R

# Plot results for K-means
results/plots/gap_plot.png: results/data/gap_results.csv scripts/plot_results.R
	Rscript scripts/plot_results.R

# Run Spectral Clustering simulation
results/data/spectral_gap_results.csv: scripts/run_spectral_simulation.R scripts/generate_shell_clusters.R scripts/spectral_clustering.R
	Rscript scripts/run_spectral_simulation.R

# Plot results for Spectral Clustering
results/plots/spectral_gap_plot.png: results/data/spectral_gap_results.csv scripts/plot_spectral_results.R
	Rscript scripts/plot_spectral_results.R

# Clean up all generated results
clean:
	rm -f results/data/*.csv
	rm -f results/plots/*.png
