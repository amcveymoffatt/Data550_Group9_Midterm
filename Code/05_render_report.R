here::i_am(
  "Code/05_render_report.R"
)
config_list <- config::get(
  config= Sys.getenv("WHICH_CONFIG")
)

active_config <- Sys.getenv("WHICH_CONFIG")
#rmarkdown::render(here::here("Report.Rmd"))

rmarkdown::render(
  here::here("Report.Rmd"), 
  output_file = paste0(here::here(), "/Report_", active_config, ".html")
)
