# repo
==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project
Version 1.0
==================================================================

The dataset being used is: 
Human Activity Recognition Using Smartphones
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset includes the following files:
=========================================

- 'README.txt'

- 'run_analysis.R': Contains code for the project.

- 'tidydata.txt': List of mean and standard deviations of all activities, variables and subjects.


#Program Function
##0. Initial Setup  
#####Set Working directory using setwd()    
#####Download Data file using download.file()  
#####Unzip file projectfile usin the unzip R function
#####Set variable for Test, Train, Features, Activity Datasets  

##1. Merge Datasets (and set variables)
#####Merged Test data and set variable: X_test.txt, Y_test.txt using the rbind function        
#####Merged Train data and set variable: X_train.txt, Y_train.txt using the rbind function         
#####Set varaible for Features   
#####Set varaible for Activity labels  

##2. Mean and STD. Deviation   
#####Extracted mean and std. deviation for each measurement using the grep() function

##3. Descriptive activity name  
#####Used the activityData variable to include descriptive activity name  

##4. Label Data
#####Used gusb function for patter matching and replacement    

##5. Create second data file: tidydata.txt
#####Using output from 4 (per instruction) generated tidydata.txt which contained data set with the average of each variable for each activity and each subject. Used write.table() to create the tidydata.txt     
