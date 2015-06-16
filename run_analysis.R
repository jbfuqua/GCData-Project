# Prepare a tidy dataset for later analysis using the following source data:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Data are stored locally in "./UCI HAR Dataset/*"

# Operations to perform:

# 1. Merge training and test datasets to create one dataset
# 2. Extract only means and standard deviations for each measurement
# 3. Use descriptive activity names
# 4. Use decriptive variable names in the dataset
# 5. From the new dataset, create a separate tidy data set with the average for each value for each activity and
#    subject

require(dplyr)

# store the data directory path

datadir <- './UCI HAR Dataset'

# read and store the files

# training

meas_train<-read.table(paste (datadir,"train/X_train.txt",sep='/'))
activ_train<-read.table(paste (datadir,"train/y_train.txt",sep='/'))
subject_train<-read.table(paste (datadir,"train/subject_train.txt",sep='/'))

#test

meas_test<-read.table(paste (datadir,"test/X_test.txt",sep='/'))
activ_test<-read.table(paste (datadir,"test/y_test.txt",sep='/'))
subject_test<-read.table(paste (datadir,"test/subject_test.txt",sep='/'))

# merge the data (task 1)

meas_data <- rbind(meas_train, meas_test)
activ_data <- rbind (activ_train, activ_test)
subject_data <- rbind (subject_train, subject_test)

merged_data <- cbind( subject_data, activ_data, meas_data)

# load feature and activity names and label the columns of the new dataset (task 3)

features<- read.table(paste(datadir,"features.txt", sep='/'))
activities <- read.table(paste(datadir,"activity_labels.txt",sep='/'))

columns <- as.character(features[,2])
columns <- c("Subject", "Activity", columns)

# add activity names and label variables

merged_data[,2] <- as.character(activities[merged_data[,2],2])

colnames(merged_data)<-columns

merged_data[,2]<-as.factor(merged_data[,2])

# select only columns for mean and std dev (task 2)

data_subset <- merged_data[,c(1,2, grep("mean()|std()", colnames(merged_data)))]

# note we need to exclude columns labeled 'Freqmean' as they are not relevant
data_subset <- data_subset[,grep("meanFreq", colnames(data_subset), invert=TRUE)]

# final steps - create a tidy data set that summarizes variable means by activity and subject (task 5)

                   
tidy_data <- aggregate(data_subset[,3:ncol(data_subset)], by=list(Subject=data_subset[,1], Activity=data_subset[,2]), FUN=mean, simplify=TRUE)                       
write.table(tidy_data,"./tidy_data.txt",sep=" ",row.names=FALSE)                         
                         