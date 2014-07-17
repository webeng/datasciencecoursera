myFunction <- function(x){
  y <- rnorm(100)
  mean(y)
}

secondFunction <- function(x){
	x + rnorm(length(x))
}