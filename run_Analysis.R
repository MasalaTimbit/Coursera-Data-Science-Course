library(dplyr)

#Downloading and unzipping the file

zipfilename <- "Assignment4.zip"

# Downloading only if the file doesn't already exists
if (!file.exists(zipfilename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, zipfilename, method="curl")
}  

# Unzipping only if the folder doesn't exist
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfilename) 
}

# Assigning names to all the data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))


activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))


subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)


y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")


subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")


x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)


y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merging the training and test sets
X <- rbind(x_train, x_test)
Y <-rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
whole_merged_data <- cbind(subject, Y, X)

# Extracting the measurements on the mean and standard deviation for each measurements
# Using a pipeline to make it easier

finaldata <- whole_merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Renaming the activities in the final data using descriptive names
finaldata$code <- activity_labels[finaldata$code, 2]

# Renaming the final data labels with more descriptive names
names(finaldata)[2] = "activity"
names(finaldata) <- gsub("Acc", "Accelerometer", names(finaldata))
names(finaldata) <- gsub("Gyro", "Gyroscope", names(finaldata))
names(finaldata) <- gsub("BodyBody", "Body", names(finaldata))
names(finaldata) <- gsub("Mag", "Magnitude", names(finaldata))
names(finaldata) <- gsub("^t", "Time", names(finaldata))
names(finaldata) <- gsub("^f", "Frequency", names(finaldata))
names(finaldata) <- gsub("tBody", "TimeBody", names(finaldata))
names(finaldata) <- gsub("-mean()", "Mean", names(finaldata), ignore.case = TRUE)
names(finaldata) <- gsub("-std()", "STD", names(finaldata), ignore.case = TRUE)
names(finaldata) <- gsub("angle", "Angle", names(finaldata))
names(finaldata) <- gsub("gravity", "Gravity", names(finaldata))

#Creating a separate, tidy data set with the average of each variable for each activity and each subject
FinalTidyData <- finaldata %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

write.table(FinalTidyData, "FinalTidyData.txt", row.names = FALSE)

