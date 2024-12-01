if (!("renv" %in% row.names(installed.packages()))) {
  install.packages("renv")  
}

renv::activate()
renv::restore()  
