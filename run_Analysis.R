# Qn #1 Merge training and test datasets
library(data.table)
library(dplyr)

if (!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")
unzip("Dataset.zip", exdir = "./Dataset")
setwd("./data/Dataset/")

# get test data set and labels
testSubject <- read.table("./UCI HAR Dataset//test/subject_test.txt")
testSet <- read.table("./UCI HAR Dataset//test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset//test/y_test.txt")

trainSubject <- read.table("./UCI HAR Dataset//train//subject_train.txt")
trainSet <- read.table("./UCI HAR Dataset//train//X_train.txt")
trainLabels <- read.table("./UCI HAR Dataset//train//y_train.txt")

trainSubject <- read.table("./UCI HAR Dataset//train//subject_train.txt")
trainSet <- read.table("./UCI HAR Dataset//train//X_train.txt")
trainLabels <- read.table("./UCI HAR Dataset//train//y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")


# Rename test subject and lablels
testSubject <- rename(testSubject, subject = V1)
testLabels <- rename(testLabels, activity = V1)

# Rename training subject and labels
trainSubject <- rename(trainSubject, subject = V1)
trainLabels <- rename(trainLabels, activity = V1)

features <- rename(features, featureID = V1, feature = V2)
activityLabels <- rename(activityLabels, activity =V1, description = V2)

# rename datasets
oldName <- names(testSet)
newName <- as.vector(features$feature)
setnames(testSet, oldName, newName)

oldName <- names(trainSet)
setnames(trainSet, oldName, newName)

#merge training & testing set separately
trainDataset <- cbind(trainSubject,trainLabels, trainSet)
testDataset <- cbind(testSubject,testLabels,testSet)

# join train and test data sets
Dataset <- rbind(trainDataset,testDataset)

# Qn2 Extract measurments on the mean and std dev of each measurement

Dataset_mean <- Dataset[,grepl("mean()",names(Dataset), fixed = TRUE)]
Dataset_std <- Dataset[,grepl("std()",names(Dataset), fixed = TRUE)]
Dataset_mean_std <- cbind(Dataset[,1:2], Dataset_mean,Dataset_std)

# Qn3 Use descriptive activity names by replacing activity label to names like WALKING, etc
activityDescription <- as.vector(activityLabels$description)
# add 'activityDescription' column to dataset and match it to activity label ID 
Dataset_mean_std$activityDescription <- activityDescription[Dataset_mean_std$activity]

# Qn4 Appropriately label data set with despecriptive variable names
# => done in the 'rename datasets' segment already. 

# Qn 5 summarize data set with the average of each variable for each activity and each subject.
Dataset_mean_std<- group_by(Dataset_mean_std, subject, activity, activityDescription)
Dataset_mean_std_Summary <- summarise_each(Dataset_mean_std, funs(mean))

# or alternatively one can use %>%
# Dataset_mean_std %>% group_by(subject, activity, activityDescription) %>% summarise_each(funs(mean))

write.table(Dataset_mean_std_Summary, file = "Dataset_mean_std_summary.txt", row.names = FALSE, sep = "\t", quote = FALSE)

