here::i_am(
  "Code/05_render_report.R"
)

active_config <- Sys.getenv("WHICH_CONFIG", unset = "default")
config_list <- config::get(config = active_config)

rmarkdown::render(
  here::here("Report.Rmd"), 
  output_file = paste0(here::here(), "/Report_", active_config, ".html")
)
