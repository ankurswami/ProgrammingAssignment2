## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##the following function creates a special object called matrix that catches its own inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x<<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set=set,
         get=get,
         setInverse=setInverse,
         getInverse=getInverse)
         }    


## Write a short comment describing this function
##this inverse calculates the inverse of the matrix used using the function above.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    m <- x$get()
    inv <- solve(m,...)
    x$setInverse(inv)
    inv
}

source("cachematrix.R")
m <- makeCacheMatrix(matrix(1:4,2,2))
m$get()
