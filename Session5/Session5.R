# Origin: Code for week 5 of programming class.
# Author: Laura Green
# Title: Session5.R
# Last modified: 2016.10.05

install.packages("devtools",
                 repos='http://cran.us.r-project.org')
install.packages("testthat",
                 repos='http://cran.us.r-project.org')
install.packages("roxygen2",
                 repos='http://cran.us.r-project.org')

library("devtools")
dir <- '~/GitHub/RepoLauraProgramming'
name <- 'PracticePackage'

# Create your package
setwd(dir)
create(name)

dir <- '~/GitHub/RepoLauraProgramming'
name <- 'PracticePackage2'

# Create your package
package.skeleton(name=name, path=dir)

getwd()
dir <- '~/Session5'

dir <- '~/GitHub/RepoLauraProgramming/'
name <- 'PracticePackage'
dir.create(paste(paste(dir, name, sep=""), "man", sep="/"))

dir <- '~/GitHub/RepoLauraProgramming/'
name <- 'PracticePackage'
file.create("LICENSE")

print_hello_world()

dir <- '~/GitHub/RepoLauraProgramming/'
name <- 'PracticePackage'
setwd(paste(dir, name, sep=""))
document()

?print_hello_world

require(devtools)

setwd(paste(dir, name, sep=""))
devtools::use_testthat()

setwd(paste(dir, name, sep=""))
devtools::test()

getwd()
dir <- '~/GitHub/RepoLauraProgramming/Session4_and_5'
name <- 'PracticePackage'
setwd(paste(dir, name, sep=""))
devtools::use_testthat()

getwd()
setwd(dir = '~/GitHub/RepoLauraProgramming/Session4_and_5/PracticePackage')
devtools::test()
