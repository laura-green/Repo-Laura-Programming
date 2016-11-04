# Origin: Code for week 6 of programming class.
# Author: Laura Green
# Title: Session6_code.R
# Last modified: 2016.10.07

# graph theory (= network theory)
# directed vs. undirected graphs 
# adjacency matrix

install.packages("igraph", repos = 'http://cran.us.r-project.org')
# star graph 
# 1st way to create a matrix
A <- matrix(c(0,1,1,1,1,0,0,0,1,0,0,0,1,0,0,0), nrow = 4)
A

# 2nd way to create a matrix
a1 <- c(0,1,1,1)
a2 <- c(1,0,0,0)
A <- cbind(a1, a2, a2, a2)
A

# 3rd way to create a matrix
n <- 4
A <- matrix(0, nrow=n, ncol=n)

for(i in 1:n){
  for(j in 1:n){
    if(i != j){
      if(i == 1 | j == 1){
        A[i, j] <- 1
      }
    }
  }
}
A

# Vectorize (i.e. make these loops into a compact vector)
# Combine the 2 "if" statements:

for(i in 1:n){
  for(i in 1:n){
  if(i != j){ 
    if(runif(1) <= p){
      A[i, j] <- 1
  }
  }
  }
}
A

# Then we gave up because too complicated in this case

# Plot this
require(igraph)
plot(graph_from_adjacency_matrix(A))

# Random graph
# Bernoulli (p) -> prob that there is an edge between 2 nodes for n nodes
n <- 4
p <- 0.5
A <- matrix(0, nrow=n, ncol=n)

for(i in 1:n){
  if(i != j & (i == 1 | j == 1)){
    A[i, j] <- 1
  }
}
A
plot(graph_from_adjacency_matrix(A))

# Triangular matrix (what's below the diagonal = 0)
n <- 4
p <- 1.0
A <- matrix(0, nrow=n, ncol=n)

for(i in 1:n){
  for(j in 1:i){
    if(i != j){
      if(runif(1) <= p){
        A[i, j] <- 1
      }
  }
   
  }
}
A <- A + t(A)
A
plot(graph_from_adjacency_matrix(A))


# Trying something else 
n <- 4
p <- 1.0
A <- matrix(0, nrow=n, ncol=n)

for(i in 2:n){
  for(j in 1:(i-1)){
    print(c(i,j))
    if(i != j){
      if(runif(1) <= p){
        A[i, j] <- 1
      }
    }
  }  
}
 
A <- A + t(A)
A

# Something else
n <- 4
p <- 1.0
A <- matrix(0, nrow=n, ncol=n)

p <- 1.0
i <- 4
for(j in 1:(i-1)){
  if(runif(1) <= p){
    A[i, j] <- 1
  }
}
A


as.integer(runif(i-1))

# Try vectorize again 

n <- 4
p <- 1.0
A <- matrix(0, nrow=n, ncol=n)

for(i in 2:n){
A[i, 1:(i-1)] <- as.integer(runif(i-1)) <= p
}
A <- A + t(A)

# Don't know why not working

# Sample
n <- 4
p <- 1.0
A <- matrix(0, nrow=n, ncol=n)

# ?sample

# sample(c(0, 1),size=as.integer(n*(n-1)/2), replace = TRUE, prob=c(1-p, p))

A[lower.tri(A)] <- sample(c(0, 1),size=as.integer(n*(n-1)/2), 
                          replace = TRUE, prob=c(1-p, p))
A[lower.tri(A)]

# MUCH faster than loops (not much difference for n = for, 
# but if we try "tic / toc" for n = 1000 for instance, you see a
# big difference)

# degree of distribution (see notes)

# Tyler's stuff
# Bayes' rule 
# Time series 
