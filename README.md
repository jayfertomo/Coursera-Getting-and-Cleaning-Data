# READ ME
  This is a project made by John Joseph C. Fernando for the "Getting and Cleaning Data" course.

## The following are files that are in this repository which analyzes the "Human Activity Recognition Using Smartphones" data set.

1. Code Book.md
    
    This describes the variables, the data, and any transformations or work that was performed to tidy the data.
    
2. run_analysis.R
    
    This is a script, loadable in R, that prepare the raw data given into a tidy data. It does the following:
    
    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement.
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive variable names.
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
3. Final Output.txt
    
    This is the exported output, a tidy data set, from executing the run_analysis.R
