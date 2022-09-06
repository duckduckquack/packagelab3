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
#' euclidean(45L, 10L)
#' euclidean(10L, 5L)
#' \dontrun{
#' euclidean("b", "a")
#' }
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

