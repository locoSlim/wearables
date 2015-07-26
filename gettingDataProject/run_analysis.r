
# run_analysis()   See attached readme.md and codebood.md for details. 
# Extracts, transforms, and summarizes accelerometer data from: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

run_analysis <- function(xL=1) {
    
    library(dplyr)
    library(sqldf)
    
    # read the subject activity descriptions
    activity_labels <- read.table("activity_labels.txt", stringsAsFactors=F)    
    
    # read the subject index files
    subject_train <- read.table("subject_train.txt", col.names = "Subject", stringsAsFactors=F)
    subject_test <-  read.table("subject_test.txt", col.names = "Subject", stringsAsFactors=F)
    
    # read the measurement activity index files and append the activity descriptions 
    y_train <- read.table("y_train.txt", col.names = "Activity_Code", stringsAsFactors=F)
    y_train <- mutate(y_train, Activity = "")
    for (i in 1:nrow(activity_labels)) {
        y_train[y_train$Activity_Code == i, 'Activity'] <- activity_labels[i, 2]       
    }
    y_test <- read.table("y_test.txt", col.names = "Activity_Code", stringsAsFactors=F)
    y_test <- mutate(y_test, Activity = "")
    for (i in 1:nrow(activity_labels)) {
        y_test[y_test$Activity_Code == i, 'Activity'] <- activity_labels[i, 2]       
    }    
    
    # read measurement variable names and store in varnames
    varnames <- read.table("features.txt", stringsAsFactors=F)
    
    # select only the mean() and std() measurement variables for our project
    varnames <- sqldf("SELECT * FROM varnames WHERE V2 LIKE '%mean()%' OR V2 LIKE '%std()%'")
    
    # read in the test and training measurement data
    x_train <- read.table("x_train.txt", stringsAsFactors=F)
    x_test <- read.table("x_test.txt", stringsAsFactors=F)    
    
    # filter out columns that are not mean() or std() measurements
    x_train <- x_train[, varnames[, "V1"]]
    x_test <- x_test[, varnames[, "V1"]]

    # combine subject, activity, and measurement data for training and test
    traindf <- cbind(subject_train, y_train, x_train)
    testdf <- cbind(subject_test, y_test, x_test)   
    
    # combine training and test data into a single data frame
    resultdf <- rbind(traindf, testdf)
    
    # insert the proper measurement variable names
    names(resultdf)[4: (dim(varnames)[1] + 3)] <- varnames[, "V2"]         
    
    # summarize our data into a final tidy data set for export
    finaldf <- data.frame()
    sub_levels <- levels(factor(resultdf$Subject))
    act_levels <- levels(factor(resultdf$Activity))

    # we want average of each measurement, by subject and activity
    for(i in 1: length(sub_levels)) {
        for(j in 1: length(act_levels)) {
            summarydf <- resultdf[resultdf$Subject == sub_levels[i] & resultdf$Activity == act_levels[j], ]
            summarydf <- summarydf[, c(1, 3:69)]
            workdf <- data.frame(summarydf[1, 1:2], stringsAsFactors=F)
            for(k in 3:68) {
                workdf <- cbind(workdf, mean(summarydf[, k]))
            }
            finaldf <- rbind(finaldf, workdf)
        }    
    }                             
    
    # rename the mean(measurement) columns
    for(i in 1:66) {
        names(finaldf)[i + 2] <- paste('Mean_of_', varnames[i, "V2"], sep="")
    }    
        
    # write the export file
    write.table(finaldf, "wearables.txt", row.name=F)
    
}