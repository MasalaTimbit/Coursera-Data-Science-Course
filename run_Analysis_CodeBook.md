#Code book

The `run_Analysis.R` script prepares the given data and completes the 5 steps
outlined by the course project instructions.

###1. Downloads the data set
  - The data set is downloaded and extracted under a folder called
  `UCI HAR Dataset`
  
###2. Assigns each data to a variable
  - `features`: `features.txt`
      The features come from the *accelerometer* and the *gyroscope*, with 3 axial
      raw signals *tAcc-XYZ* and *tGyro-XYZ*
  - `activity_labels`: `activity_labels.txt`
      List of activities performed when each of the measurements were taken and
      their respective codes/ labels
  - `subject_test`: `test/subject_test.txt`
      contains test data of 9/30 test subjects being observed
  - `x_test`: `test/X_test.txt`
      contains recorded X test data of features
  - `y_test`: `test/y_test.txt`
      contains test data of code labels of the activities
  - `subject_train`: `test/subject_train.txt`
      contains train data of 21/30 test subjects being observed
  - `x_train`: `test/X_train.txt`
      contains recorded X train data of features
  - `y_train`: `test/y_train.txt`
      contains train data of code labels of the activities
      
###3. Merges the training and test sets to create one data set
  - `X` is created by merging `x_train` and `x_test` using the **rbind()** function
  - `Y` is created by merging `y_train` and `y_test` using the **rbind()** funcition
  - `subject` is created by merging `subject_train` and `subject_test` using
    **rbind()**
  - `whole_merged_data` is created by merging `subject`, `Y` and `X` using 
    **cbind()**

###4. Extracts only the mean and standard deviation for each measurement
  - `finaldata` is created by subsetting `whole_merged_data`, selecting for the
    columns of `subject`, `code` and the `mean` and standard deviations(`std`) 
    of each measurement

###5. Use descriptive activity names to rename the activities in the data set
  - Entire numbers in the `code` column of `finaldata` are replaced with the
    corresponding activity from the second column of the `activities` variable
    (from step 2)

###6. Appropriately label the columns in the dataset with descriptive names
  - `code` column in `finaldata` renamed into `activities`
  - `Acc` in column names replaced by `Accelerometer`
  - `Gyro` in column names replaced by `Gyroscope`
  - `BodyBody` in column names replaced by `Body`
  - `Mag` in column names replaced by `Magnitude`
  - Any column names starting with character `f` replaced by `Frequency`
  - Any column names starting with character `t` replaced by `Time`
  
###7. From the data set created in step 6, creates a second, independent, tidy
   data set with the average of each variable for each activity and subject
  - `FinalTidyData` is created by summarizing `finaldata`, taking the means of 
  each variable for each activity and each subject after being grouped by each
  - `FinalTidyData` is exported into `FinalTidyData.txt`