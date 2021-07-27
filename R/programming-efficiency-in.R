# purpose: to understand ways to efficiently program in R
# author: sebastian marin

# set working directory to where the current file is located
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# update current packages (this could take awhile)
update.packages()

# load libraries
install.packages('pacman')
pacman::p_load( tidyverse, psych, anMC, MASS, rbenchmark )

# temp workspace 