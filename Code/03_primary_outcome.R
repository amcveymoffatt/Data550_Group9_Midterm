rm(list = ls())

pacman::p_load(
  here, DescTools, tidyverse, magrittr, janitor,
  knitr, survival, ggpubr, gt, gtsummary
)


here::i_am(
  "Code/03_primary_outcome.R"
)


f75 <- readRDS(here::here("Data/f75.rds"))

## assume the censoring day is 10 day from birth 
f75 %<>%
  mutate(
    status = if_else(days_stable == 999, 0, 1),
    time = if_else(days_stable == 999, 10, days_stable)
  )

var_labels <- list(bfeeding = "Whether Breast Fed?",
                   sex = "Baby's Gender")

fit.cox <- coxph(Surv(time, status) ~ arm + site + sex + bfeeding, data = f75)
p<- fit.cox %>%
  tbl_regression(exponentiate = TRUE, 
                 label = var_labels) %>%
  bold_labels() %>%
  add_global_p %>%
  bold_p() %>%
  modify_header(estimate = "**HR**") %>%
  as_gt()


saveRDS(p, here::here("Output/primary_outcome.rds"))


