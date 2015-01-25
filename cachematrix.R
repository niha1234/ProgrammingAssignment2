## Put comments here that give an overall description of what your
## functions do


library(MASS) ## loads the library for predefined function in R for generic Inverse function ginv()

## Write a short comment describing this function

## makeCacheMatrix function set and get the initial matrix and Inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
	Inv<-NULL
	## sets the passed matrix thorugh the function call
	set<-function(y){
		x<<-y
		Inv<<-NULL
	}
	## gets the matrix through the function call
	get<-function() x
	## sets the inverse of the matrix
	setInv<- function(Inverse){
	Inv<<- Inverse}
	## gets the inverse of the matrix
	getInv<- function() Inv
	list(set=set,get=get,setInv=setInv,getInv=getInv)



}


## Write a short comment describing this function

## cacheSolve function computes the inverse of the matrix passed in makecacheMatrix function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	Inv<-x$getInv		## gets the initial value or cached value

	## if initial value is not NULL returns this message
	if(!is.null(Inv)){
		message("Getting cached data")
		return(Inv)
	
	}
	
	## get matrix data from matrix
	data<-x$get()

	## sets matrix inverse using generic matrix function ginv() 
	## by loading library(MASS)
	## gniv() function computes inverse of any matrix

	Inv<-ginv(data)
	x$setInv(Inv)

	## returns inverse matrix Inv for matrix x 
	Inv	
}
