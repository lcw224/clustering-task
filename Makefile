# Makefile for Clustering Project
all: results/plots/gap_plot.png results/plots/spectral_gap_plot.png

#run K-means Gap simulation
results/data/gap_results.csv: scripts/run_gap_simulation.R scripts/generate_data.R
	Rscript scripts/run_gap_simulation.R

#plot k-means gap statistic results
results/plots/gap_plot.png: results/data/gap_results.csv scripts/plot_results.R
	Rscript scripts/plot_results.R

#run spectral clustering gap statistic simulation
results/data/spectral_gap_results.csv: scripts/run_spectral_simulation.R scripts/generate_shell_clusters.R scripts/spectral_clustering.R
	Rscript scripts/run_spectral_simulation.R

#plot spectral clustering gap statistic results
results/plots/spectral_gap_plot.png: results/data/spectral_gap_results.csv scripts/plot_spectral_results.R
	Rscript scripts/plot_spectral_results.R

#clean results
clean:
	rm -f results/data/*.csv
	rm -f results/plots/*.png
