Group 9 Midterm: F75 Milk
================
Arnetta McVey Moffatt, Danyang Chen, Iris Cho, Xintian Song, and Yu-Jou
Li

### Report Overview

Children with medically complicated severe acute malnutrition (SAM) face
a high risk of inpatient mortality. Factors such as diarrhea,
carbohydrate malabsorption, and refeeding syndrome may contribute to
early mortality and hinder recovery. [Bandsam et
al.](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1002747)
tested whether a lactose-free, low-carbohydrate F75 milk could mitigate
these risks, potentially reducing the duration of the stabilization
phase.

This project aims to replicate part of the analysis published in the
article *A reduced-carbohydrate and lactose-free formulation for
stabilization among hospitalized children with severe acute
malnutrition: A double-blind, randomized controlled trial.*

### Repository Organization

- `Code directory`: Contains all R script files required for the
  analysis in the final report
- `Data directory`: Stores the data set used in the report
  - `f75_codebook.xlsx`: Data dictionary
  - `f75_interim.csv`: Initial dataset
- `Output directory`: Holds all intermediate data generated during the
  analysis
- `Makefile`: Automates the analysis workflow and output generation

### Customization

Two versions of the report can be generated. The cox model in table 3
can be altered through the use of the `config.yml` file. Depending on
the version, the second variable in the model will be either: 1.
Breastfed Status 2. Height

### Requirements

- `Packages`: Includes here, tidyverse, survival, and gtsummary.
  - Missing packages are identified and installed in `01_load_data.R`
- `R`
- `Make`
- `Git` (optional)

### How to Generate Report

1.  Clone the repository via Git or download via zip file
2.  Set which version of the report to generate by running the following
    commands in the terminal
    1.  Breastfed Status: `export WHICH_CONFIG="default"`
    2.  Height: `export WHICH_CONFIG="secondary"`
3.  Generate the final report
    1.  In the terminal run `Make report_${WHICH_CONFIG}.html`
4.  Remove all files generated when running
    `Make report_${WHICH_CONFIG}.html`
    1.  In the terminal run `Make clean`
