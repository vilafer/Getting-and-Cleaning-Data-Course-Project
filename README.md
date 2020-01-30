# Getting and Cleaning Data Course Project

This repository was built for the course project of the "Getting and Cleaning Data" course at Coursera by the Johns Hopkins University.  This is the third module in the Data Science specialization.

## Project Summary

The goal of this project is to create a tidy data set with R from the data obtaind form a Samsung Galaxy S smartphone. [Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The `run_analysis.R` script should be run on the [data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and it will perform the following steps to generate a tiny data set.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Repository Information

This repository contains 3 main files:

 - `run_analysis.R` - This script will extract and load al the information, also will generate a tidy version of the information for later                        study.
 - `tidySet.txt` - This is the final output from the `run_analysis.R` script.
 - `CodeBook.md` - Contains the definitions of each of the columns in our generated `tidySet.txt` file.


