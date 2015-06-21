## makeCacheMatrix is a (main)function that stores a list of functions,
## namely set(),get(),setinv() & getinv().

## COMMENT
## get is a function that returns the vector x stored in main function.
## set is a function that changes the vector stored in the main function.
## "x <<- y" substitutes the matrix x with y (the input) in the main function (makeCacheMatrix)
## setinv & getinv simply store the value of the input in a variable m into the main function makeCacheMatrix (setinv) and return it (getinv).
## storing the 4 functions in the function makeCacheMatrix by using the function list(), so as to assign makeCacheMatrix to an object, the object has all the 4 functions.
makeCacheMatrix <- function(x = matrix()){
  m<-NULL
set<-function(y){
  x<<-y
  m<<-NULL
                }
get<-function() x
setinv<-function(solve) m<<- solve
getinv<-function() m
list(set=set, get=get,
     setinv=setinv,
     getinv=getinv)

                                          }

## COMMENT
## In function cacheSolve we assign m(which will be evaluated in this function) the same value as getinv.
## The first thing cacheSolve does is to verify the value m, stored previously with getinv, exists and is not NULL. If it exists in memory, it simply returns a message and the value m.
## If it was the case, "return(m)" would have ended the function. So everything that follows this if() is a sort of else {}. matrix1 gets the matrix x stored with makeCacheMatrix, m calculates the inverse of the vector and x$setinv(m) stores it in the object generated assigned with makeCacheMatrix
## m(inverse of matrix x) is evaluated using function solve(), here variable matrix is assigned the value of get ie the matrix x, and using solve(matrix) inverse of x is evaluated.

cacheSolve <- function(x, ...) {
  m<-x$getinv()
if(!is.null(m)){
  message("getting cached data")
  return(m)
    }
  matrix1<-x$get()
  m<-solve(matrix1)
  x$setinv(m)
  m
}
