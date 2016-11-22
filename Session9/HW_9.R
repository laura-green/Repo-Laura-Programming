# Origin: HW for week 9 of programming class.
# Author: Laura Green
# Title: HW_9.R
# Last modified: 2016.11.17
 
# I don't understand what I'm doing here.
# Will spend more time understanding it once I get the maths.
# Should really work on Metrics + maths rather than this, 
# seems the wrong way round.

# QUESTION 1 

f <- function(x_i, e_i, param){
  N <- 1000
    for(i in 1:N){
    e_i <- dnorm(N, mean = 0, sd = 1)
    x_i <- dnorm(N, mean = 0, sd = 1)
  }
  return(param[1] + param[2]*x_i + e_i)
}

f(x_3, e_2, 5)
# Not working...