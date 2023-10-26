# Homework1 functions

# Function to load data
load_data <- function() {
  #Load Heart failure data here. 
  #Requirement:
  #1. Remove time columns.
  #2. Convert columns into category if applicable.
  data<-data.frame()
  stop("Code must be provided.")
  return(data)
}

# a. Plot distributions
plot_distributions <- function(data) {
  #data should  from load_data()
  #Plot distributions of each numerical attribute grouped by class. You can use histograms or boxplots
  #Remeber to plot all numerical attribute
  stop("Code must be provided.")
  
}

# c. Compute mean and standard deviation
compute_summary <- function(data) {
  #data should  from load_data()
  #For each numerical feature, compute the mean and standard deviation for each class.
  stop("Code must be provided.")
  
}

# d. Compute frequency table
compute_frequency <- function(data) {
  #data should  from load_data()
  #For each categorical feature, create a frequency table containing counts for each category in each class.
  stop("Code must be provided.")
  
}

#e.perform appropriate transformation and normalization
perform_transformation <- function(data) {
  #data should  from load_data()
  #For numerical features, perform appropriate transformation and normalization to make them comparable.
  #you should save the transformed data as 'heart_failure_scaled.rds' into folder.
  stop("Code must be provided.")
}