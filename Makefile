# will need to be updated with addition of code
report_${WHICH_CONFIG}.html: Code/05_render_report.R Output/Baseline_characteristics.rds\
Output/primary_outcome_${WHICH_CONFIG}.Rds Output/bar.png install
	Rscript Code/05_render_report.R

# Install R packages using renv
.PHONY: install
install: Code/00_renv.R 
	Rscript Code/00_renv.R

# Code/01_load_data.R: run load data code
Data/f75.rds: Data/f75_interim.csv Code/01_load_data.R install
	Rscript Code/01_load_data.R

# baseline characteristic
Output/Baseline_characteristics.rds: Code/02_baseline_table.R Data/f75.rds 
	Rscript Code/02_baseline_table.R

#Table 1: Code/03_primary_outcome
Output/primary_outcome_${WHICH_CONFIG}.Rds: Code/03_primary_outcome.R Data/f75.rds 
	Rscript Code/03_primary_outcome.R

# bar chart
Output/bar.png: Code/04_secondary_outcome.R Data/f75.rds 
	Rscript Code/04_secondary_outcome.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html && rm -f output/*.png && rm -f Data/f75.Rds