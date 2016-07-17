# Getting and Cleaning Data Course Project Codebook

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data for this project 
is the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

[Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Below is Dataset

[Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Dataset Details:

The dataset includes data from the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt' :  subject who performed the activity (train) 
* 'test/subject_test.txt' :  subject who performed the activity (test) 

## Dependencies:
* Script installs necessary libraries.

## Naming Convention:
* CamelCase naming convention is followed.

## Data Load and Manipulation:

### Download and unzip
* Code checks to see if folder exists in the working directory; If folder exists, data is downloaded into that folder else a new folder **Assignment** is created 
  and data is downloaded into it. Data is unzipped and saved to same folder using **unzip** command.
  
  
### Variables Details:  

*  Test labels data is read to **ActivityTest** variable  
*  Test Set data is read to **FeaturesTest** variable
*  Test Subject data is read to **SubjectTest** variable
*  Train labels data is read to **ActivityTrain** variable  
*  Train Set data is read to **FeaturesTrain** variable
*  Train Subject data is read to **SubjectTrain** variable
*  Training and test activity data is stored in **ActivityData** variable
*  Training and test features data is stored in **FeaturesData** variable
*  Training and test Subject data is stored in **SubjectData** variable
* **myVariables** includes combined values of names of extracted mean and std. deviation variables, **subject** and **activity** variables 

### Merging Data

* Training and Test data of each category is merged using **rbind()** function. Variables **ActivityData, FeaturesData, SubjectData** store these data.
* The names for these data frames are assigned accordingly. Featurenames are read from features data file and are assigned to FeaturesData variable.
* Above three variables are combined using **cbind()** function which Merges the training and the test sets into one data set. 
  This is saved as **mergedData** variable.


### Extracting Mean and Standard Deviation measurements
 
* All the variables having mean or standard deviation are extracted using **grep()** function.
* Above extracted variables of **mergedData**, **subject** and **activity** variables are combined and saved in **myVariables** variable, 
  which is used in select parameter of **subset()** function to extract measurement data.
* Data Frame **measurementData** holds this data.
 
### Adding descriptive activity names 

* activity variable is factorized(as its data is saved as integer) and levels are reassigned as per **activity_labels.txt** data fie using **levels()** function.

### Appropriately labels the data set with descriptive variable names.

* Substring values t,f, Acc etc are replaced by meaningful descriptions using **gsub()** function. Below is complete list of replacements:

    ** Acc -->  Accelerometer
	** Gyro -->  Gyroscope
	** BodyBody -->  Body
	** Mag -->  Magnitude
	** t -->  Time
	** f -->  Frequency
	** tBody -->  TimeBody
	** mean() -->  Mean
	** std() -->  STD 
	** freq() --> Frequency
	** angle -->  Angle
	** gravity -->  Gravity


### Independent tidy data set with the average of each variable for each activity and each subject.

* Average of each variable for each activity and each subject is calculated using **aggregate()** function. Package **dplyr** is installed for this purpose.
* Variable **tidyDataSet2** holds this tidy dataset.
* Above tidy dataset is written to **TidyDataSet2.txt** file using **write.tabe()** function.

















