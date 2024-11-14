library(here)
library(ggplot2)

here::i_am(
  "Code/04_weight_diff.R"
)

data <- read.csv(here::here("f75_interim.csv"))

wilcox.test(weight ~ arm, data = data)

bar <- ggplot(data, aes(x = arm, y = weight, fill = arm)) +
  geom_boxplot() +
  labs(title = "Weight Comparison between Standard and Modified F75 Groups",
       x = "Group (Standard F75 vs. Modified F75)",
       y = "Weight") +
  theme_minimal()

ggsave(
  here::here("Output/bar.png"),
  plot = bar,
  device = "png"
)


