
rankall <- function(outcome,num = "best"){
  found <- 0
  data <- read.csv("outcome-of-care-measures.csv" , colClasses = "character")
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
    #data_split <- subset(data_split, data_split[,2] == state)    
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
    #data_split <- data_split[order(data_split[,3],data_split[,1],decreasing = dec),1:3][num,]    
    ##sorted <- data_split[order(data_split[,2],data_split[,3],decreasing = FALSE),1:3]
    
    ##sorted <- data_split[order(data_split[,3],decreasing = FALSE),1:3]
  
    sorted <- split(data_split, data_split[,2])   
    df = data.frame()
    
    for( name in names(sorted)){
      aux <- sorted[[name]]
      aux <- aux[order(aux[,3],aux[,1], decreasing =  dec), 1:3]
      #print(name)
      #print(aux[num,1])
      newRow <- data.frame(aux[num,1],name) 
      df <- rbind(df, newRow)
      
    }
  colnames(df) <- c('hospital','state')      
  rownames(df) <- df$state
  
    return(df)

}

#print(head(rankall("heart attack", 20)))
#warnings()

