## Main function to run the analysis

run_analysis <- function()
{
    library(dplyr)
    library(reshape2)
  
    ### Merges the training and the test sets to create one data set.
    ## Read in the data from the test and train directories
    
    testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
    testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
    testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
    trainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
    trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    combineddata<- rbind(testdata, traindata)
    combinedlabels <- rbind(testlabels, trainlabels)
    combinedsubjects <- rbind(testsubjects, trainsubjects)
    
    ### Extracts only the measurements on the mean and standard 
    ### deviation for each measurement.
    
    ## Find the columns for only mean() and std()
    # read in the list of features
    features <- read.table("./UCI HAR Dataset/features.txt") 
    
    # find the index of the ones representing means or stds
    chosencolumns <- grep("mean\\(\\)|std\\(\\)", features$V2)
    
    # select out only those columns from the combined dataset
    chosendata <- select(combineddata, chosencolumns)
    
    ### Uses descriptive activity names to name the activities
    ### in the data set
    
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
    activity <- activity_labels$V2[combinedlabels[,1]]
    
    ### Appropriately labels the data set with descriptive 
    ### variable names.
    
    columnnames <- tolower(features$V2[chosencolumns])
    columnnames <- gsub("-", "", columnnames)
    columnnames <- gsub("\\(\\)", "", columnnames)
    
    names(chosendata) <- as.character(columnnames)
    names(combinedsubjects) <- "subject"
    names(activity) <- "activity"
    
    alldata <- data.frame(combinedsubjects, activity, chosendata)
    

    ### From the data set in step 4, creates a second, 
    ### independent tidy data set with the average of each 
    ### variable for each activity and each subject.
    
    # use melt and dcast to aggregate the data by variable and 
    # recast it to calculate the mean by subject and activity
    cdmelt <- melt(alldata, id=c("subject", "activity"))
    cdcast <- dcast(cdmelt, subject+activity ~ variable, mean)
    
    # write out the dataset
    if (!file.exists("./tidydata")) 
    {
      dir.create("./tidydata")
    }
    write.table(cdcast, "./tidydata/tidydata.txt", row.names = FALSE)
    
    # return the dataset
    cdcast
}
