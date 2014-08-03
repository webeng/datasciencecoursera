
rankhospital <- function(state,outcome,num = "best"){
  found <- 0
  data <- read.csv("outcome-of-care-measures.csv" , colClasses = "character")
  if(state %in% data$State){
    if(outcome == "heart attack"){
      found <- 1
      col <- 11
    }
    
    if(outcome == "heart failure"){
      found <- 1
      col <- 17
    }
    
    if(outcome == "pneumonia"){
      found <- 1   
      col <- 23
    }
    
    if(found == 0){
      stop("invalid outcome")
    }
    
    
    
    data_split <- data[c(2,7,col)]
    data_split[,3] <- as.numeric(data_split[,3])
    data_split <- subset(data_split, data_split[,2] == state)    
    ##Remove rows that have NA data in the Outcome column
    data_split <- data_split[complete.cases(data_split[,3]),]
    
    if(num == "best"){
      num = 1
    }
    dec = FALSE
    if(num == "worst"){
      num = 1
      dec = TRUE
    }
    if(num > dim(data_split)[1]){
      return(NA)
    }
    data_split <- data_split[order(data_split[,3],data_split[,1],decreasing = dec),1:3][num,]    
    return(data_split[1,1])
  }else{
    stop("invalid state")
  }
}

#rankhospital("TX", "heart failure", 4)

