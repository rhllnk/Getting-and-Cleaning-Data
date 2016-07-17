# Getting And Cleaning Data - Course Project

This repository contains solution to Getting And Cleaning Data course project. It includes three files README.md, Codebook.md and run_analysis.R script. 
Codebook.md provides details about downloading dataset, reading data, functions and libraries used to create tidy datasets. 
R script performs following steps:

 * Download and Unzip data.
 * Read data into variables.
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement.
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive activity names.
 * Creates a second tidy data set which is the average of each variable for each activity and each subject.
 * Finally, writes second tidy data set to "TidyDataSet2.txt" data file.
 
 Complete details are explained in Codebook.md.
 
 
## Processing Steps
  * Clone the Repository
  * Source run_analysis.R
  * Once script is run, data is downloaded to local disc, read into R variables, single dataset combining training and test is created, 
	variable names in the raw dataset are replaced by appropriate descriptive labels and a second tidy dataset which is average of each 
	activity and each subject is created.
  * Second tidy dataset is written to a file (.txt).
   