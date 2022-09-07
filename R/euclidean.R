#' Euclidean algorithm.
#' \code{euclidean} returns the GCD of the two arguments.
#' This function uses the Euclidean algorithm to compute
#' the GCD of the two arguments.
#' @param x,y Integer numbers.
#'
#'
#' @return Returns the GCD of x and y as an integer number.
#' @export
#' @references https://en.wikipedia.org/wiki/Euclidean_algorithm
#' @examples
#' euclidean(45, 10)
#' euclidean(10, 5)
#' \dontrun{
#' euclidean("b", "a")
#' }
euclidean <- function(x, y) {
  #finds GCD of x and y, x and y must be integers
  #check that x and y are integers
  if(!(is.numeric(x) & length(x) == 1)) {
    stop("Inputs must be numeric scalars")
  }

  #check that x and y are integers
  if(!(is.numeric(y) & length(y) == 1)) {
    stop("Inputs must be numeric scalars")
  }

  if(x < 0){
    x <- -x
  }

  if(y < 0){
    y <- -y
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

