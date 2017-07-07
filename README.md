==================================================================
Coursera Getting and Cleaning Data Final Project
==================================================================

This respository contains files that modify the UCI HAR dataset to produce a tidy dataset containing only the averages of the 
measures corresponding to means and standard deviations of all measures.



The dataset includes the following files:
=========================================

- 'README.md' : This file.

- 'getdata%2Fprojectfiles%2FUCI HAR Dataset.zip' : ZIP file containing the original UCI HAR dataset.  This file must be uncompressed into the working directory.  

- 'run_analysis.R': R script that transforms the UCI HAR dataset into the tidy dataset.  It assumes the UCI HAR dataset has been uncompressed to create the folder "UCI HAR Dataset" in the working directory.  This script creates a folder called "tidydata" which contains the tidy dataset (tidydata.txt).


Data transformations:
======
Please refer to the README.txt in the UCI HAR Dataset directory for complete details of the original dataset.  

The files ./UCI HAR Dataset/test/X_test.txt and ./UCI HAR Dataset/train/X_train.txt were concatenated (row-wise) in that order to combine the test and training data into one dataset.

The corresponding y_test.txt and y_train.txt were concatenated to get the complete list of activity labels for each observation.

The corresponding subject_test.txt and subject_train.txt were concatenated to obtain the corresponding list of subjects for each observation.

Variables corresponding to mean (mean()) and standard deviation (std()) measures were extracted.  

Variable names were normalized to be lower case with only alphanumeric characters.  The existing names are sufficiently descriptive to identify the variables.  Any changes to the names to make them more descriptive would have required adding a mapping file to map the new names to the original data variable names.  This would have made the results less tidy.

Activity values from the y_test.txt and y_train.txt files were replaced with their corresponding descriptive values from activity_labels.txt.

The subject list, descriptive activity list, and extracted mean and std data were combined to form a complete dataset.  Each variable was then averaged across subject and activity to produce the final dataset.

Code Book for tidydata.txt:
=======
"subject": integer value corresponding to the test subject
"activity"" : descriptive text for activity performed for the measurement

The following variables are the average values for all measures from a given subject-activity pair.  See description below.
"tbodyaccmeanx" 
"tbodyaccmeany" 
"tbodyaccmeanz" 
"tbodyaccstdx" 
"tbodyaccstdy" 
"tbodyaccstdz" 
"tgravityaccmeanx" 
"tgravityaccmeany" 
"tgravityaccmeanz" 
"tgravityaccstdx" 
"tgravityaccstdy" 
"tgravityaccstdz" 
"tbodyaccjerkmeanx" 
"tbodyaccjerkmeany" 
"tbodyaccjerkmeanz" 
"tbodyaccjerkstdx" 
"tbodyaccjerkstdy" 
"tbodyaccjerkstdz" 
"tbodygyromeanx" 
"tbodygyromeany" 
"tbodygyromeanz" 
"tbodygyrostdx" 
"tbodygyrostdy" 
"tbodygyrostdz" 
"tbodygyrojerkmeanx" 
"tbodygyrojerkmeany" 
"tbodygyrojerkmeanz" 
"tbodygyrojerkstdx" 
"tbodygyrojerkstdy" 
"tbodygyrojerkstdz" 
"tbodyaccmagmean" 
"tbodyaccmagstd" 
"tgravityaccmagmean" 
"tgravityaccmagstd" 
"tbodyaccjerkmagmean" 
"tbodyaccjerkmagstd"
"tbodygyromagmean" 
"tbodygyromagstd" 
"tbodygyrojerkmagmean" 
"tbodygyrojerkmagstd" 
"fbodyaccmeanx" 
"fbodyaccmeany" 
"fbodyaccmeanz" 
"fbodyaccstdx" 
"fbodyaccstdy" 
"fbodyaccstdz" 
"fbodyaccjerkmeanx" 
"fbodyaccjerkmeany" 
"fbodyaccjerkmeanz" 
"fbodyaccjerkstdx" 
"fbodyaccjerkstdy" 
"fbodyaccjerkstdz" 
"fbodygyromeanx" 
"fbodygyromeany" 
"fbodygyromeanz" 
"fbodygyrostdx" 
"fbodygyrostdy" 
"fbodygyrostdz" 
"fbodyaccmagmean" 
"fbodyaccmagstd" 
"fbodybodyaccjerkmagmean" 
"fbodybodyaccjerkmagstd" 
"fbodybodygyromagmean" 
"fbodybodygyromagstd" 
"fbodybodygyrojerkmagmean" 
"fbodybodygyrojerkmagstd"

Description of data from features_info.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

