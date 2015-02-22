## the makeCacheMatrix function creates a cacheMatrix wrapping object for it's input matrix x
## cacheSolve is also a wrapping method that tries to return a matrix's inverse from its cache.


## creates a wrapping cacheMatrix object
## get method returns the original x matrix
## set/getreverse store and retrieve the cached inverse from the original matrix x

makeCacheMatrix <- function(x = matrix()) {
	get <- function() x
	set <- function(y) x <<- y
	setreverse <- function(r) attr(x,"reverse") <<- r
	getreverse <- function() attr(x,"reverse")
	list(set= set,
		 get = get,
		 setreverse = setreverse,
		 getreverse = getreverse )
}


## A wrapping method that tries to resolves the cached inverse from the original matrix through getreverse

cacheSolve <- function(x, ...) {
 # ## Return a matrix that is the inverse of 'x'
  if(!is.null( x$getreverse()))   
	x$getreverse()
  else  
    x$setreverse(solve(x$get()))	   
}


   