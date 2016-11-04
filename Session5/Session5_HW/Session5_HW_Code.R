# Origin: Code for HW 5 of programming class.
# Author: Laura Green
# Title: Session5_HW_Code.R
# Last modified: 2016.10.07

require(devtools)
library(devtools)

getwd()

dir <- '~/GitHub/RepoLauraProgramming/Session5_HW'
name <- 'HWPackage'
setwd(dir)
create(name)


dir <- '~/GitHub/RepoLauraProgramming/Session5_HW/'
name <- 'HWPackage'
dir.create(paste(paste(dir, name, sep=""), "man", sep="/"))


setwd(paste(dir, name, sep=""))
document()

file.create("LICENSE")

dir <- '~/GitHub/RepoLauraProgramming/Session5_HW'
setwd(dir)
install(name)

sum_of_roots(9, 25)
?sum_of_roots

setwd(paste(dir, name, sep=""))
devtools::use_testthat()

setwd(paste(dir, name, sep=""))
devtools::test()

setwd(paste(dir, name, sep=""))
build()

# R CMD check HWPackage_0.0.0.9000.tar.gz --as-cran

Sys.which("pdflatex")
Sys.getenv("PATH")