
best <- function(state,outcome){
  found <- 0
  data <- read.csv("outcome-of-care-measures.csv" , colClasses = "character")
  if(state %in% data$State){
    if(outcome == "heart attack"){
      found <- 1
      col <- 11
      col_name <- "Heart"
    }
  
    if(outcome == "heart failure"){
      found <- 1
      col <- 17
      col_name <- "Failure"
    }
  
    if(outcome == "pneumonia"){
      found <- 1   
      col <- 23
      col_name <- "Pneumonia"
    }
    if(found == 0){
      stop("invalid outcome")
    }

    data_split <- data[c(7,col)]
    data_split[,2] <- as.numeric(data_split[,2])
    #colnames(data_split)[2] <- col_name  
    #data_split$Failure[is.na(data_split[,2])] <- 1000
    data_split[,2][is.na(data_split[,2])] <- 1000    
    data[,col] <- as.numeric(data[,col])        
    data_split <- subset(data_split, State == state)
    best_hospital <- subset(data, State == state & data[,col] == min(data_split[,2]))[2]          
    
    return(best_hospital[,])
  }else{
    stop("invalid state")
  }
}

##best("TX", "heart attack")
