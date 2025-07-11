#Peer-graded Assignment: Getting and Cleaning Data Course Project
This repository is a submission for Getting and Cleaning Data course project.
It has the instructions on how to run an analysis on Human Activity recognition
dataset.

##Dataset
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
)

##Files
- `run_Analysis_CodeBook.md` a code book that describes the variables, the data,
and any transformations or work that was performed to clean up the data

- `run_Analysis.R` performs the data preparation and then followed by the 5 steps
outlined by the course project instructions:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for
      each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with
      the average of each variable for each activity and each subject.
  
- `FinalTidyData.txt` is the exported final data after going through all the
sequences described above.