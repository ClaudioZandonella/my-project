#============================#
#====    My Functions    ====#
#============================#

#----    get_my_data    ----

get_my_data <- function(file){
  res <- read.csv(file = file)
  
  return(res)
}


#----    get_plot_obs    ----

get_plot_obs <- function(data){
  boxplot(y~x, data = data)
}


#----    get_lm_fit    ----

get_lm_fit <- function(data){
  
  res <- lm(y ~ x, data = data)
  
  return(res)
}

tictoc::tic()
#-----