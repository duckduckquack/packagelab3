euclidean <- function(x, y) {
  #finds GCD of x and y, x and y must be integers
  
  #check that x and y are integers 
  if(!(is.integer(x) & is.integer(y))) {
    stop("Inputs must be integers")
  }
  
  a <- max(x, y)
  b <- min(x, y)
  
  #base case
  if(b == 0){
    return(a)
  }
  
  #recursive case
  return(euclidean(b, a %% b))
}

