#Preparing the data sets for merging

##Checking if the file exists in the system
##If it exists, the code will proceed to unzip it
##If it does not exists, the code will download it and then unzip it

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(file.exists("UCI HAR Dataset.zip")) {
  unzip("UCI HAR Dataset.zip")}
if(!file.exists("UCI HAR Dataset.zip")) {
  download.file(fileURL, destfile = "./", method = "curl");
  unzip("UCI HAR Dataset.zip")}
  
##Reading the files to R and assigning data frames

features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "label")

#Analysis and Merging of data sets

##Merging the training and the test sets to create one data set

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_set <- cbind(subject, Y, X)

##Extracting the measurements on the mean and standard deviation for each measurement

tidy_data <- merged_set %>% select(subject, label, contains("mean"), contains("std"))

##Renaming the variable names into understandable names

tidy_data$label <- activity_labels[tidy_data$label, 2]
names(tidy_data)[2] = "activity"
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data))
names(tidy_data) <- gsub("-std()", "StandardDeviation", names(tidy_data))
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))

#Final output; with the average of each variable for each activity and each subject

final_data <- tidy_data %>% group_by(subject, activity) %>% summarize_all(funs(mean))
write.table(final_data, "Final Output.txt", row.names = FALSE)

##END, Thank you!

