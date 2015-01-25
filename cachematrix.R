##In this example we introduce the <<- operator which can be used to assign a value to an object in an environment 
##that is different from the current environment. Below are two functions that are used to create a special object 
##that stores an inverse vector in the cache.

##The first function, makeCacheMatrix creates a special "matrix", which contains a function to:
##set the value of the matrix
##get the value of the matrix
##set the value of the inverse of the matrix
##get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x <<- y - and
inv <<- NULL
}
get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}

##The following function calculates the inverse of the special "matrix" created with the above function. However, it first 
##checks to see if the inverse has already been created. If so, it gets the inverse matrix from the cache and skips the 
##computation. Otherwise, it creates an inveres matrix using the solve() function and sets the inverse matrix in the cache.

cacheSolve <- function(x, ...) {
inv <- x$getinverse()
if(!is.null(inv)) {
message("getting cached data")
return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinverse(inv)
inv
}
