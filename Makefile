# will need to be updated with addition of code
report.html: Code/05_render_report.R Output/Baseline_characteristics.rds Output/primary_outcome.Rds Output/bar.png
	Rscript Code/05_render_report.R

# Code/01_load_data.R: run load data code
Data/f75.rds: Data/f75_interim.csv Code/01_load_data.R
	Rscript Code/01_load_data.R

# will need to be updated with addition of code
Output/Baseline_characteristics.rds: Code/02_baseline_table.R Data/f75.rds
	Rscript Code/02_baseline_table.R

#Table 1: Code/03_primary_outcome
Output/primary_outcome.Rds: Code/03_primary_outcome.R Data/f75.rds
	Rscript Code/03_primary_outcome.R


# will need to be updated with addition of code
Output/bar.png: Code/04_secondary_outcome.R Data/f75.rds
	Rscript Code/04_secondary_outcome.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html && rm -f output/*.png && rm -f Data/f75.Rds