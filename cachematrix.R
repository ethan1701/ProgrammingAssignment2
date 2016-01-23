## Creates a "matrix" with a cacheable inverse.
## gets a matrix, returns the same matrix.
## If invoked via the internal $getSolve function, will cache and return the inverse of the matrix

makeCacheMatrix <- function(m = matrix()) {
  inv <- NULL
  get <- function(){
    m
  }
  
  getInverse <- function(){
    if (is.null(inv)) {
      message("Inverse was not cached. Caching...")
      inv <<- solve(m)
    }
    inv
  }
  list(get = get,
       getInverse = getInverse)
}


## Returns the inverse of a cacheable Matrix, by calling the internal function getInverse

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  x$getInverse()
}
