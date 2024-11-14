library(here)

here::i_am(
  "Code/04_weight_diff.R"
)

data <- read.csv(here::here("f75_interim.csv"))

wilcox.test(weight ~ arm, data = data)

