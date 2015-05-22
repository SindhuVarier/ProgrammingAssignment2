## The functions here find inverse of an invertible matrix
## and cache it, so that other function might use the function from cache
## without recomputing the inverse

## find inverse of matrix and cache it

makeCacheMatrix <- function(x = matrix()) {
m<- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)

}


## find inverse of a matrix, use from cache if already available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- cache$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- cache$get()
  m <- solve(data)
  cache$setinverse(m)
  m
}
