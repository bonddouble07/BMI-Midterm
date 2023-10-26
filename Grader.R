
#EDIT THIS FILE AT YOUR OWN RISK!
#Editing it will only change the grades locally, and might make you fail Canvas remote tests.
this_file <- rstudioapi::getSourceEditorContext()$path
wd <- dirname(this_file)
setwd(wd)
source('P1.R')

# Grader logic
grade_homework <- function() {
  score <- 0
  total_score <- 10
  
  # Load data
  tryCatch({
    data <- load_data()
    factor_columns <- sapply(data, is.factor)
    num_factors <- sum(factor_columns)
    if (nrow(data) == 299 && ncol(data) == 12 && num_factors==6) {
      score <- score + 2
      print("Data dimension correct. [2/2]")
    } else {
      print("Data dimension not correct. [0/2]")
    }
  }, error=function(e) {
    print(paste("Error in load_data: ", e))
  })
  
  # Check Plot
  tryCatch({
    graphics.off() # Clear previous plots
    func_body <- deparse(body(plot_distributions))
    plot_call<-sum(grepl("hist", func_body))
    plot_call2<-sum(grepl("boxplot", func_body))
    if (plot_call==12 || plot_call2==6) {
      score <- score + 2
      print("Plot All numerical attributes. [2/2]")
    } else {
      plotscore <-  2*max(plot_call/12,plot_call2/6)
      score <- score + plotscore
      print(paste0("Did not Plot All numerical attributes. [",plotscore,"/2]"))
    }
  }, error=function(e) {
    print(paste("Error in plot_distributions: ", e))
  })
  
  # Check Mean and Standard Deviation
  tryCatch({
    func_body <- deparse(body(compute_summary))
    mean_call <- sum(grepl("mean", func_body))
    sd_call <- sum(grepl("sd", func_body))
    aggregate_call <- sum(grepl("aggregate", func_body))
    for_call <- sum(grepl("for", func_body))
    if ( (mean_call==6 && sd_call==6) ||(mean_call>0 && sd_call>0 && aggregate_call+for_call>0)) {
      score <- score + 2
      print("Got Mean and SD for All numerical attributes. [2/2]")
    } else {
      print("Did not get Mean and SD for All numerical attributes. [0/2]")
    }
  }, error=function(e) {
    print(paste("Error in compute_summary: ", e))
  })
  
  
  # Check frequency table
  tryCatch({
    func_body <- deparse(body(compute_frequency))
    table_call <- sum(grepl("table", func_body))
    aggregate_call <- sum(grepl("aggregate", func_body))
    for_call <- sum(grepl("for", func_body))
    if ( (table_call==5 && sd_call==6) ||(table_call>0 && aggregate_call+for_call>0)) {
      score <- score + 2
      print("Got tables for All categorical attributes. [2/2]")
    } else {
      print("Did not get tables for All categorical attributes. [0/2]")
    }
  }, error=function(e) {
    print(paste("Error in compute_frequency: ", e))
  })
  
  # Check Transformation
  tryCatch({
    func_body <- deparse(body(perform_transformation))
    plot_call<-sum(grepl("log", func_body))
    plot_call2<-sum(grepl("scale", func_body))
    if (plot_call+plot_call2>1) {
      score <- score + 2
      print("Transformation are correct. [2/2]")
    } else {
      print("Transformation are incorrect. [0/2]")
    }
  }, error=function(e) {
    print(paste("Error in perform_transformation: ", e))
  })
  print(paste("Total Score: ", score, "/", total_score))
}

# Execute the grader
grade_homework()


