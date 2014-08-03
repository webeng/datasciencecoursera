complete <- function(directory, id = 1:332) {
  
  df_complete = data.frame()

  for(i in id){
    if(i < 10){
      id_aux <- paste("00" , i , sep="")  
    }
    if((i >= 10) && (i < 100)){
      id_aux <- paste("0" , i , sep="")  
    }
    if(i >= 100){
      id_aux <- i
    }
    fullpath <- paste(id_aux, "csv" , sep=".")
    fullpath <- paste(directory, fullpath, sep="/")
    data <- read.csv(fullpath)
    ##print(names(data))
    complete_values <- subset(data , !is.na(data$sulfate) & !is.na(data$nitrate))
    aux <- c(i,nrow(complete_values))
    df_complete <- rbind(df_complete, aux)  
  }
  colnames(df_complete) <- c('id','nobs')    
  return(df_complete)
}
complete("specdata", c(2, 4, 8, 10, 12))