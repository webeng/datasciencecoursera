pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  
  if(id < 10){
    id <- paste("00" , id , sep="")  
  }
  if((id > 10) && (id < 100)){
    id <- paste("0" , id , sep="")  
  }
  
  if(pollutant == "sulfate"){
    m_col <- 2
  }
  
  if(pollutant == "nitrate"){
    m_col <- 3
  }
  
  fullpath <- paste(id, "csv" , sep=".")
  fullpath <- paste(directory, fullpath, sep="/")
  ##print(fullpath)
  data <- read.csv(fullpath)
  
  data_filtered <- data[,m_col]
  empty_values = is.na(data_filtered)
  ##print(empty_values)
  ##num_x = length(data_filtered)
  col_data <- data_filtered[!empty_values]  
  ##print(col_data)
  print(mean(col_data))
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}
x <- pollutantmean("/Applications/MAMP/htdocs/datasciencecoursera/specdata/data","nitrate" , c(1))
