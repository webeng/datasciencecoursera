corr <- function(directory, threshold = 0) {
  
  correlations <- c()
  
  all_files <- list.files(directory, full.names = TRUE)
  for(i in 1:length(all_files)){
    ##print(all_files[i])
    data <- read.csv(all_files[i])   
    complete_values <- subset(data , !is.na(data$sulfate) & !is.na(data$nitrate))
    ##print(complete_values)
    if(nrow(complete_values) > threshold){
      sulfate <- complete_values[,2]
      nitrate <- complete_values[,3]
      correlations <- append(correlations, cor(nitrate, sulfate))
    }
  }

  return(correlations)
}
cr <- corr("specdata", 150)
head(cr)
summary(cr)