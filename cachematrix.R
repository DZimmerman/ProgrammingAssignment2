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

##FUNCTION PROCESS PROOF - "RUN"
##> x = matrix(sample(1:25), nrow=5, ncol=5)
##> m = makeCacheMatrix(x)
##> m$get()
##     [,1] [,2] [,3] [,4] [,5]
##[1,]   21   13    5   25   14
##[2,]    4   24   18    1    2
##[3,]    6    9   23    3   11
##[4,]    7   10   20   17   15
##[5,]   16   12   22    8   19
##> cacheSolve(m)
##            [,1]        [,2]        [,3]        [,4]        [,5]
##[1,]  0.09644047 -0.03149077  0.19012186 -0.14295390 -0.06495880
##[2,] -0.04156572  0.06459289 -0.15678792  0.04942932  0.07557693
##[3,]  0.04559752 -0.02509307  0.19862410 -0.05083386 -0.10581770
##[4,]  0.04164981 -0.01359994  0.05901337  0.02833169 -0.08579052
##[5,] -0.12529489  0.02050445 -0.31591220  0.13609484  0.21824901
##> cacheSolve(m)
##getting cached data
##            [,1]        [,2]        [,3]        [,4]        [,5]
##[1,]  0.09644047 -0.03149077  0.19012186 -0.14295390 -0.06495880
##[2,] -0.04156572  0.06459289 -0.15678792  0.04942932  0.07557693
##[3,]  0.04559752 -0.02509307  0.19862410 -0.05083386 -0.10581770
##[4,]  0.04164981 -0.01359994  0.05901337  0.02833169 -0.08579052
##[5,] -0.12529489  0.02050445 -0.31591220  0.13609484  0.21824901
##> 
