# Origin: Code for week 4 of programming class.
# Author: Laura Green
# Title: week_4_code.ipynb
# Last modified: 2016.10.05


# Load the package
# NOTE: Uncomment this line if need to install package
#install.packages("MASS", repos="http://cran.rstudio.com/")
require(MASS)

# Set the correlation parameter and mean
beta = 0.5
SIGMA = matrix(c(1,beta,beta,1), ncol=2)
MU = c(2.0, 1.0)

# Set the sample size
N = 50

# Draw your sample
out <- mvrnorm(N, mu = MU, Sigma = SIGMA)

# Look at a section of the data
dim(out)
out[1:10,]

# Plot the random variables in the x-y plane
plot(out)

# Add a regression line 
plot(out)
abline(lm(out[,2]~out[,1]), col="red") # regression line (y~x)


# Our data set is named `out`, which we split into y and X
y <- out[, 2]
X <- out[, 1]

# Now carry out intermediate calculations
XT = t(X)
XTX = XT%*%X
invXTX = solve(XTX)
XTy = XT%*%y
beta = invXTX %*% XTy
beta

# Now add this line to the plot
plot(out)
abline(lm(out[,2]~out[,1]), col="red") # regression line (y~x) 
abline(a=0, b=beta, col="blue")


