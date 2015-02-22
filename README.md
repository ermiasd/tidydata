# tidydata
Getting and Cleaning Data course project
=========================================================================

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

The output of the last step is a dataset named **Dataset_mean_std_Summary.txt**.
One can read and inspect the output summary file in R using: 

  `DT <- read.table("./Dataset/Dataset_mean_std_summary.txt", sep = "\t", header =TRUE)`
  `head(names(DT))`


Refer to CodeBook.Rmd for description of variables and transformations performed to process the data.
  
