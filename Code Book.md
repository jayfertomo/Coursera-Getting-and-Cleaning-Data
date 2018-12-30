# Code Book by jay fernando
The run_analysis.R script executes a series of functions to prepare the raw data given and make it into a tidy data.

The Final Output.txt is the tidy data produced by performing the run_analysis.R script.

### The following are the procedures and details of what happened when run_analysis.R were performed in R.
1. Check whether the data are already in your working directory by analyzing if "UCI HAR Dataset.zip" is in the directory.

     If not, the script will use the download.file() function and get the zip file from the url given for this assignment. Then it will unzip it to make a folder "UCI HAR Dataset" and put the data sets in it.
     
     If the file is already in the working directory, the script will just proceed to unzipping the file.

2. Reading the data sets and preparing them for the manipulation in R

    Each data sets were put into individual data frames named "features", "activity_labels", "subject_test", "x_test", "y_test", "subject_train", "x_train", "y_train".
    
3. Merging the training and test data sets to make one data set.
    
    rbind() function is used to combine the x_train and x_test to make the X data set by their rows; rbind() is used also to combine by their rows the y_train and y_test to create the Y data set; rbind() is also used to combine subject_train and subject_test to create the subject data set
    
    cbind() function is then used to combine X, Y, subject data sets by their columns to make the merged_set
    
4. Extracting the measurements on the mean and standard deviation for each measurement
    
    select() function is used on the merged_set, selecting only the columns subject and label, and the measurements on the mean and std
    
5. Renaming the variable names into understandable names

    the "label" column in tidy_data were replaced with "activity"
    
    gsub() function is used in order to rename vague variable like "Acc" into "Accelerometer" in order to make it clear for other readers data sets
    
6. Producing the final output
    
    final_data is made with summarizing the tidy_data set, grouping by subject and activity variables, and taking the means of each variable of each activity and subject.
    
    "Final Output.txt" is then produced to export the tidy, final data
    

### END, THANK YOU!
