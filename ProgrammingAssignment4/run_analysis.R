# [STEP 1] Read all the necessary data into dataframes
#Read Activity Labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
               sep=" ", 
               col.names=c('id',"name"), 
               fill = FALSE,
               header = FALSE,
               strip.white=TRUE)

#[STEP 4] Read names of the features
features <- read.table("./data/UCI HAR Dataset/features.txt", 
                       sep=" ", 
                       col.names=c('id',"name"), 
                       fill = FALSE,
                       header = FALSE,
                       strip.white=TRUE)

#Read Test DATA - Subject Test
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", 
                       sep=" ", 
                       col.names=c('subject_id'), 
                       fill = FALSE,
                       header = FALSE,
                       strip.white=TRUE)

#Read Test DATA - X Test Samples. Note that use automatically asign column names to this dataframe. This completes [STEP 4]
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", 
                           sep="", 
                           col.names=features[,2], 
                           fill = FALSE,
                           header = FALSE,
                           strip.white=TRUE)

#Read Test Data - y_test
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", 
                          sep="", 
                          col.names=c('y_label'), 
                          fill = FALSE,
                          header = FALSE,
                          strip.white=TRUE)

#Add subjects and activity label to the X_test dataframe
X_test <- cbind(X_test,subject_test)
X_test <- cbind(X_test,y_test)

#Read train data - Subject Train
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", 
                           sep=" ", 
                           col.names=c('subject_id'), 
                           fill = FALSE,
                           header = FALSE,
                           strip.white=TRUE)

#Read train data - X train. Note that we automatically add column names from features, thus it completes [STEP 4] 
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", 
                      sep="", 
                      col.names=features[,2], 
                      fill = FALSE,
                      header = FALSE,
                      strip.white=TRUE)

#Read Train Data - y_train
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", 
                      sep="", 
                      col.names=c('y_label'), 
                      fill = FALSE,
                      header = FALSE,
                      strip.white=TRUE)

#Add subjects and activity label to the X_train dataframe
X_train <- cbind(X_train,subject_train)
X_train <- cbind(X_train,y_train)

#Append X_train to X_test and save it to a new var called data
data <- rbind(X_test,X_train)

#X_data_mean_std <- X_data[, grepl("mean[[:punct::]]*", colnames(X_data))]

#[STEP 2] Filter Out Columns that doesn't contain mean or std. Note that meanFreq features are also included as they are means as well. 
#We could filter out meanFreq by using the following regular expression "mean[[:punct::]]*|std[[:punct::]]*" in the grepl function
data_filtered <- data[, grepl("mean.*|std.*", colnames(data))]

#Add activity identifiers and subjects to data_filtered before merging.
data_filtered$activity_label <- data$y_label
data_filtered$subject <- data$subject_id

#[STEP 3] Merge our data_filtered with activity_labels using activity_label and id as a common key in order to get the descriptive activity names [STEP 3] 
data_filtered <- merge(data_filtered,activity_labels, by.x = "activity_label" , by.y="id", all=TRUE)

#data_filtered$activity_label <- as.factor(data_filtered$activity_label)
#data_filtered$subject <- as.factor(data_filtered$subject)
#data_filtered$name <- as.factor(data_filtered$name)

#[STEP 5] Calculate the average of each variable for each activity and each subject and save it to a new variable called tidy
#tidy <- aggregate(data_filtered, by=list(activity_label = data_filtered$activity_label, subject = data_filtered$subject), mean)
tidy <- aggregate(data_filtered, by=list(name = data_filtered$name,activity_label = data_filtered$activity_label, subject = data_filtered$subject), mean)

#Remove irrelevant fields such as: subject and activity_name. A mean of those has no use
tidy[,4] <- NULL
tidy[,84] <- NULL
tidy[,83] <- NULL

write.table(tidy, file="./data/tidy.txt" , sep="\t", row.name=FALSE)