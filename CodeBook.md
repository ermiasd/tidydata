# Code book
| column |description |
|------- | ---------- |
| 01 | subject           
| 02 | activity
| 03 | activityDescription
| 04 | tBodyAcc.mean...X
| 05 | tBodyAcc.mean...Y
| 06 | tBodyAcc.mean...Z
| 07 | tGravityAcc.mean...X
| 08 | tGravityAcc.mean...Y
| 09 | tGravityAcc.mean...Z
| 10 | tBodyAccJerk.mean...X
| 11 | tBodyAccJerk.mean...Y
| 12 | tBodyAccJerk.mean...Z
| 13 | tBodyGyro.mean...X
| 14 | tBodyGyro.mean...Y
| 15 | tBodyGyro.mean...Z
| 16 | tBodyGyroJerk.mean...X
| 17 | tBodyGyroJerk.mean...Y
| 18 | tBodyGyroJerk.mean...Z
| 19 | tBodyAccMag.mean..
| 20 | tGravityAccMag.mean..
| 21 | tBodyAccJerkMag.mean..
| 22 | tBodyGyroMag.mean..
| 23 | tBodyGyroJerkMag.mean..
| 24 | fBodyAcc.mean...X
| 25 | fBodyAcc.mean...Y
| 26 | fBodyAcc.mean...Z
| 27 | fBodyAccJerk.mean...X
| 28 | fBodyAccJerk.mean...Y
| 29 | fBodyAccJerk.mean...Z
| 30 | fBodyGyro.mean...X
| 31 | fBodyGyro.mean...Y
| 32 | fBodyGyro.mean...Z
| 33 | fBodyAccMag.mean..
| 34 | fBodyBodyAccJerkMag.mean..
| 35 | fBodyBodyGyroMag.mean..
| 36 | fBodyBodyGyroJerkMag.mean..
| 37 | tBodyAcc.std...X
| 38 | tBodyAcc.std...Y
| 39 | tBodyAcc.std...Z
| 40 | tGravityAcc.std...X
| 41 | tGravityAcc.std...Y
| 42 | tGravityAcc.std...Z
| 43 | tBodyAccJerk.std...X
| 44 | tBodyAccJerk.std...Y
| 45 | tBodyAccJerk.std...Z
| 46 | tBodyGyro.std...X
| 47 | tBodyGyro.std...Y
| 48 | tBodyGyro.std...Z
| 49 | tBodyGyroJerk.std...X
| 50 | tBodyGyroJerk.std...Y
| 51 | tBodyGyroJerk.std...Z
| 52 | tBodyAccMag.std..
| 53 | tGravityAccMag.std..
| 54 | tBodyAccJerkMag.std..
| 55 | tBodyGyroMag.std..
| 56 | tBodyGyroJerkMag.std..
| 57 | fBodyAcc.std...X
| 58 | fBodyAcc.std...Y
| 59 | fBodyAcc.std...Z
| 60 | fBodyAccJerk.std...X
| 61 | fBodyAccJerk.std...Y
| 62 | fBodyAccJerk.std...Z
| 63 | fBodyGyro.std...X
| 64 | fBodyGyro.std...Y
| 65 | fBodyGyro.std...Z
| 66 | fBodyAccMag.std..
| 67 | fBodyBodyAccJerkMag.std..
| 68 | fBodyBodyGyroMag.std..
| 69 | fBodyBodyGyroJerkMag.std..


#Study design
This data extracts and summarizes the mean and std measurments grouped by subject and activity.
Each row represents the average of measurments of a subject doing a partiular activity for the extracted variables.

The data is obtained by running **run_Analysis.R** on the zipped data set provided.

**run_Analysis.R** processes the data in the following way:

1. Downloads and unzip activity data collected from accelerometers of the Samsung Galaxy S smartphone provided in the course project page.
   A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Reads in  subject ID, activity labels and datasets in training and test sets
3. Labels the dataset with descriptive variable names using information obtained from the files:
   - features.txt
   - features_info.txt
   - README.txt
4. Merges the training set, with it's activity label and subject ID. Repeat for test set
5. Merges the training and test sets from step 4 together to create one dataset
6. Extracts only the measurements on the mean and standard deviation for each measurement
7. creates a second, independent tidy data set with the average of each variable for each activity and each subject

