##Inintial Setup - Get Data file and Unzip
setwd("Z:/Umair/Data Science/Course 3 - Getting and Cleaning Data/Week 4/repo")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file (fileUrl, destfile="projectdataset.zip") 
unzip("Z:/Umair/Data Science/Course 3 - Getting and Cleaning Data/Week 4/project/projectdataset.zip")

## Features & Activity Dataset Setup
featuresData<-read.table("UCI HAR Dataset/features.txt")
activityData<-read.table("UCI HAR Dataset/activity_labels.txt")

## Test Dataset
XTestData<- read.table("UCI HAR Dataset/test/X_test.txt")
YTestData<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTestData <-read.table("UCI HAR Dataset/test/subject_test.txt")

## Train Dataset
XTrainData<- read.table("UCI HAR Dataset/train/X_train.txt")
YTrainData<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrainData <-read.table("UCI HAR Dataset/train/subject_train.txt")

############################################################################################
##1. Merges the training and the test sets to create one data set.
############################################################################################
X<-rbind(XTestData, XTrainData)
Y<-rbind(YTestData, YTrainData)
Subject<-rbind(SubjectTestData, SubjectTrainData)

dim(X)
dim(Y)
dim(Subject)

############################################################################################
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################
X_mean_std <- X[, grep("-(mean|std)\\(\\)", featuresData[, 2])]
names(X_mean_std) <- featuresData[grep ("-(mean|std)\\(\\)", featuresData[, 2]), 2]
View(X_mean_std)
dim(X_mean_std)

############################################################################################
##3. Uses descriptive activity names to name the activities in the data set
############################################################################################
Y[, 1] <- activityData[Y[, 1], 2]
names(Y) <- "Activity"
View(Y)

############################################################################################
##4. Appropriately labels the data set with descriptive variable names.
############################################################################################
names <-featuresData[index,2]
names(X) <- names
names(Subject)<-"SubjectID"
names(Y)<-"Activity"

OneDataset<-cbind(Subject, Y, X)
head(OneDataset[,c(1:5)]) ## first 5 columns


# Defining descriptive names for all variables.

names(OneDataset) <- make.names(names(OneDataset))
names(OneDataset) <- gsub('Acc',"Acceleration",names(OneDataset))
names(OneDataset) <- gsub('GyroJerk',"AngularAcceleration",names(OneDataset))
names(OneDataset) <- gsub('Gyro',"AngularSpeed",names(OneDataset))
names(OneDataset) <- gsub('Mag',"Magnitude",names(OneDataset))
names(OneDataset) <- gsub('^t',"TimeDomain.",names(OneDataset))
names(OneDataset) <- gsub('^f',"FrequencyDomain.",names(OneDataset))
names(OneDataset) <- gsub('\\.mean',".Mean",names(OneDataset))
names(OneDataset) <- gsub('\\.std',".StandardDeviation",names(OneDataset))
names(OneDataset) <- gsub('Freq\\.',"Frequency.",names(OneDataset))
names(OneDataset) <- gsub('Freq$',"Frequency",names(OneDataset))

View(OneDataset)

############################################################################################
##5. From the data set in step 4, creates a second, independent tidy data set with the 
##   average of each variable for each activity and each subject.
############################################################################################
TidyData<-aggregate(. ~SubjectID + Activity, OneDataset, mean)
TidyData<-TidyData[order(TidyData$SubjectID,TidyData$Activity),]
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
View(TidyData)
