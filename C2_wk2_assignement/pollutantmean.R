pollutantmean <- function(directory, pollutant, id = 1:332) {
  df = data.frame()
  
  for(i in id){
    if(i < 10){
      id_aux <- paste("00" , i , sep="")  
    }
    if((i >= 10) && (i < 100)){
      id_aux <- paste("0" , i , sep="")  
    }
    if( i>= 100){
      id_aux <- i
    }
    fullpath <- paste(id_aux, "csv" , sep=".")
    fullpath <- paste(directory, fullpath, sep="/")
    data <- read.csv(fullpath)
    df <- rbind(df,data)
  }
  
  if(pollutant == "sulfate"){
    m_col <- 2
  }
  
  if(pollutant == "nitrate"){
    m_col <- 3
  }
  data_filtered <- df[,m_col]
  empty_values = is.na(data_filtered)
  col_data <- data_filtered[!empty_values]  
  return(mean(col_data))
}
##pollutantmean("specdata", "sulfate", 1:10)
