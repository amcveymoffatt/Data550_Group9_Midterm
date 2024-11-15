# will need to be updated with addition of code
report.html: Report.Rmd Code/05_render_report.R .Output1 .Output2 .Output3
	Rscript Code/05_render_report.R


# will need to be updated with addition of code
.Output1: Code/02_baseline_table.R Code/01_load_data.R
	Rscript Code/02_baseline_table.R
	
# will need to be updated with addition of code
.Output2: Code/03_primary_outcome.R 
	Rscript Code/03_primary_outcome.R

# will need to be updated with addition of code
.Output3: Code/04_secondary_outcome.R Code/01_load_data.R
	Rscript Code/04_secondary_outcome.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html 