# purpose: to understand ways to efficiently program in R
# author: sebastian marin

# set working directory to where the current file is located
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# update current packages (this could take awhile)
update.packages()

# load libraries
install.packages('pacman')
pacman::p_load( tidyverse, psych, anMC, MASS, rbenchmark )

# let's start coding! ????


## Factor analysis 
# ```{r}
# 
# ```
# 
# ```{r}
# cfa <- 
#   foreach (i = qref, .multicombine = T, .errorhandling = "pass") %dopar% {
#     cfa(
#       model =  "skill =~ tc0 + tc1 + tc2 + tc3 + tc4 + tc5 + tc6 + tc7 + tc8 + tc9", 
#       data = ValData[ValData$qref == i,], 
#       ordered = c('tc0','tc1','tc2','tc3','tc4','tc5','tc6','tc7','tc8','tc9')
#     )
#   }
# ```
# 
# ```{r, model values}
# models = foreach(i = 1:length(valCFA), .multicombine = T, .errorhandling = "pass") %dopar% {
#   nobs <- inspect(valCFA[[i]], what ='nobs')
#   fm <- fitMeasures(valCFA[[i]], c("chisq.scaled","df.scaled","pvalue.scaled","cfi.scaled","rmsea.scaled","srmr"))
#   maxLoading <- max(lavInspect(valCFA[[i]], what='est')$lambda)
#   minLoading <- min(lavInspect(valCFA[[i]], what='est')$lambda)
#   
#   as.list(c(qref[i], nobs, fm, maxLoading, minLoading))
# }
# ```
#
# ```{r, model output}
# models_output = rbindlist(models, use.names = F)
# ```

