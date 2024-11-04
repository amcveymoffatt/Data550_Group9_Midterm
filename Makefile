# will need to be updated with addition of code
report.html: Report.Rmd Code/04_render_report.R .output1 .output2 .output3
	Rscript Code/04_render_report.R


# will need to be updated with addition of code
Output1: Code/01_baseline_char.R f75_interim.csv
	Rscript Code/01_baseline_char.R
	
# will need to be updated with addition of code
Output2: Code/02_serum_diff.R f75_interim.csv
	Rscript Code/02_serum_diff.R

# will need to be updated with addition of code
Output3: Code/03_blood_chem.R f75_interim.csv
	Rscript Code/03_blood_chem.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html && rm -f .random_numbers