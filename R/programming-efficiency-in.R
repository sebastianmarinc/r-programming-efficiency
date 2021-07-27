# purpose: to understand ways to efficiently program in R
# author: sebastian marin

# set working directory to where the current file is located
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# update current packages (this could take awhile)
update.packages()

# load libraries
install.packages('pacman')
pacman::p_load( tidyverse, psych, anMC, MASS, rbenchmark )

# let's start coding! 

get_random_df <- 
  function(n_elements, ncol, min = 0, max = 1, seed = 42) {
    seed <- set.seed(seed)
    n <- n_elements #number of elements in a vector
    x <- runif(n, min = min, max = max) #random vector of real numbers
    x <- matrix(x, ncol=ncol)
    x <- as.data.frame(x)
    return(x)
  }

n <- 1e5
col <- 100
data <- get_random_df(n_elements = n, ncol = col)

rbenchmark::benchmark(
  rds = saveRDS(data, "../data/data.rds"),
  utils = write.csv(data, "../data/data_utils.csv"),
  readr = write_csv(data, "../data/data_readr.csv"),
  data.table = fwrite(data,"../data/data_dt.csv"), 
  vroom = vroom_write(data, "../data/data_vroom.csv"),
  
  replications = 1,
  columns = c('test', 'elapsed'),
  order = 'elapsed'
)
