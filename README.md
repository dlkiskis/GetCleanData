
# Coursera Getting and Cleaning Data Final Project
## Summary

This respository contains files that modify the UCI HAR dataset to produce a tidy dataset containing only the averages of the 
measures corresponding to means and standard deviations of all measures.

To run this script, you must download the dataset at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and uncompress it into the working directory. 


## The dataset includes the following files:


- 'README.md' : This file.

- 'run_analysis.R': R script that transforms the UCI HAR dataset into the tidy dataset.  It assumes the UCI HAR dataset has been uncompressed to create the folder "UCI HAR Dataset" in the working directory.  This script creates a folder called - "tidydata" which contains the tidy dataset (tidydata.txt).


## Data transformations:

Please refer to the README.txt in the UCI HAR Dataset directory for complete details of the original dataset.  

The files ./UCI HAR Dataset/test/X_test.txt and ./UCI HAR Dataset/train/X_train.txt were concatenated (row-wise) in that order to combine the test and training data into one dataset.

The corresponding y_test.txt and y_train.txt were concatenated to get the complete list of activity labels for each observation.

The corresponding subject_test.txt and subject_train.txt were concatenated to obtain the corresponding list of subjects for each observation.

Variables corresponding to mean (mean()) and standard deviation (std()) measures were extracted.  

Variable names were normalized to be lower case with only alphanumeric characters.  The existing names are sufficiently descriptive to identify the variables.  Any changes to the names to make them more descriptive would have required adding a mapping file to map the new names to the original data variable names.  This would have made the results less tidy.

Activity values from the y_test.txt and y_train.txt files were replaced with their corresponding descriptive values from activity_labels.txt.

The subject list, descriptive activity list, and extracted mean and std data were combined to form a complete dataset.  Each variable was then averaged across subject and activity to produce the final dataset.
