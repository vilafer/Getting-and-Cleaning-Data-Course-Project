library(dplyr)

filename <- "UCI HAR Dataset.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Loading Feature and Activities labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Load train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#STEP 1 - Merges the training and the test sets to create one data set.

# Merge train and test sets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
AllData <- cbind(Subject, Y, X)


#STEP 2 - Extract only the measurements on the mean and standard deviation for each measurement
SelectedData <- AllData[, grepl("code|subject|mean|Mean|std", colnames(AllData))]


# STEP 3 - Uses descriptive activity names to name the activities in the data set

SelectedData$code <- activities[SelectedData$code, 2]


#STEP 4 - Appropriately labels the data set with descriptive variable names.
names(SelectedData)[2] = "activity"
names(SelectedData) <- gsub("Acc", "accelerometer", names(SelectedData))
names(SelectedData) <- gsub("Gyro", "gyroscope", names(SelectedData))
names(SelectedData) <- gsub("BodyBody", "body", names(SelectedData))
names(SelectedData) <- gsub("Mag", "magnitude", names(SelectedData))
names(SelectedData) <- gsub("^t", "time", names(SelectedData))
names(SelectedData) <- gsub("^f", "frequency", names(SelectedData))
names(SelectedData) <- gsub("tBody", "timebody", names(SelectedData))
names(SelectedData) <- gsub("-mean()", "mean", names(SelectedData), ignore.case = TRUE)
names(SelectedData) <- gsub("-std()", "STD", names(SelectedData), ignore.case = TRUE)
names(SelectedData) <- gsub("-freq()", "frequency", names(SelectedData), ignore.case = TRUE)


#STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalTidySet <- SelectedData %>% 
  group_by(subject, activity) %>%
  summarise_each(mean)

write.table(FinalTidySet, "TidySet.txt", row.name=FALSE)