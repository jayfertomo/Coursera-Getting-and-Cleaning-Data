#Preparing the data sets for analysis

##Checking if the file exists in the system
##If it exists, the code will proceed to unzip it
##If it does not exists, the code will download it and then unzip it

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(file.exists("UCI HAR Dataset.zip")) {
  unzip("UCI HAR Dataset.zip")}
if(!file.exists("UCI HAR Dataset.zip")) {
  download.file(fileURL, destfile = "./", method = "curl");
  unzip("UCI HAR Dataset.zip")}
  
  
