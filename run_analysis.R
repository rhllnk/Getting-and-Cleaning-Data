#downloading the file
# Check if folder exists: if folder does not exists, create the folder and 
#download file to that folder
if(!file.exists("./Assignment")){dir.create("./Assignment")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Assignment/Dataset.zip")

unzip(zipfile="./Assignment/Dataset.zip", exdir="./Assignment")
Path <- getwd()

#--Reading Test Data

ActivityTest <- read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "test", "Y_test.txt"),header = FALSE)
FeaturesTest <- read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "test", "X_test.txt"),header = FALSE)
SubjectTest <-  read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "test", "subject_test.txt"),header = FALSE)

nrow(ActivityTest)
nrow(FeaturesTest)
nrow(SubjectTest)

#--Reading Training Data
ActivityTrain <- read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "train", "Y_train.txt"),header = FALSE)
FeaturesTrain <- read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
SubjectTrain <-  read.table(file.path(Path, "Assignment", "UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)

#-- Combine both train and test data
ActivityData <- rbind(ActivityTrain, ActivityTest)
FeaturesData <- rbind(FeaturesTrain , FeaturesTest)
SubjectData <- rbind(SubjectTrain, SubjectTest)

#Check dimensions
dim(ActivityData)
dim(FeaturesData)
dim(SubjectData)

#-- Setting column names of data frames

names(SubjectData)<-c("subject")
names(ActivityData)<- c("activity")

FeaturesNames <- read.table(file.path(Path, "Assignment", "UCI HAR Dataset",  "features.txt"),header = FALSE)
#head(FeaturesNames)
#summary(FeaturesData)
names(FeaturesData) <- FeaturesNames$V2

#--Combining into single data frame

MergedData <- cbind(FeaturesData,SubjectData, ActivityData)

MergedData #Final merged data

#Checking to see that data is correctly merged
dim(MergedData)
summary(MergedData)
names(MergedData)




#--- 2.Extracts only the measurements on the mean and standard deviation for each measurement.

#Extract Mean and Standard deviation and combine them with other variables which can be later used to subset original complete data
MyVariables <-c(as.character(FeaturesNames$V2[grep(".*mean\\(\\)|.*std\\(\\)", FeaturesNames$V2)]), "subject", "activity" )
#head(myVariables)
#str(myVariables)

MeasurementData <- subset(MergedData, select = MyVariables)
str(MeasurementData)

#-- 3.Uses descriptive activity names to name the activities in the data set

# In this scenario, renaming activity names means renaming levels.

MergedData$activity <- as.factor(MergedData$activity)
levels(MergedData$activity)
levels(MergedData$activity)[levels(MergedData$activity)=="1"] <- "WALKING"
levels(MergedData$activity)[levels(MergedData$activity)=="2"] <- "WALKING_UPSTAIRS"
levels(MergedData$activity)[levels(MergedData$activity)=="3"] <- "WALKING_DOWNSTAIRS"
levels(MergedData$activity)[levels(MergedData$activity)=="4"] <- "SITTING"
levels(MergedData$activity)[levels(MergedData$activity)=="5"] <- "STANDING"
levels(MergedData$activity)[levels(MergedData$activity)=="6"] <- "LAYING"
levels(MergedData$activity)

names(MergedData)
dim(MergedData)

#-- 4.Appropriately labels the data set with descriptive variable names.

names(MergedData)<-gsub("^t", "Time", names(MergedData))
names(MergedData)<-gsub("^f", "Frequency", names(MergedData))
names(MergedData)<-gsub("Acc", "Accelerometer", names(MergedData))
names(MergedData)<-gsub("Gyro", "Gyroscope", names(MergedData))
names(MergedData)<-gsub("BodyBody", "Body", names(MergedData))
names(MergedData)<-gsub("Mag", "Magnitude", names(MergedData))
names(MergedData)<-gsub("-mean()", "Mean", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-std()", "Std", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-min()", "Min", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-max()", "Max", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("-freq()", "Frequency", names(MergedData), ignore.case = TRUE)
names(MergedData)<-gsub("angle", "Angle", names(MergedData))
names(MergedData)<-gsub("gravity", "Gravity", names(MergedData))

names(MergedData)

#-- 5.  Independent tidy data set with the average of each variable for each activity and each subject.
install.packages("dplyr")
library(dplyr)
#install.packages("plyr", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))
#install.packages(Rcpp)
#library(Rcpp)
#?aggregate
TidyDataSet2<-aggregate(. ~subject + activity, MeasurementData, mean)
TidyDataSet2 <-TidyDataSet2[order(TidyDataSet2$subject, TidyDataSet2$activity),]
head(TidyDataSet2)

write.table(TidyDataSet2, file = "TidyDataSet2.txt",row.name=FALSE)

















