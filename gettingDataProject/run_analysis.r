
# run_analysis 
# Extracts, transforms, and summarizes accelerometer data from: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

run_analysis <- function(xL=1) {
    
    library(dplyr)
    
    activity_labels <- read.table("activity_labels.txt", stringsAsFactors=F)    
    
    subject_train <- read.table("subject_train.txt", col.names = "Subject", stringsAsFactors=F)
    subject_test <-  read.table("subject_test.txt", col.names = "Subject", stringsAsFactors=F)
    
    
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
    
    x_train <- read.table("x_train.txt", stringsAsFactors=F)
    x_test <- read.table("x_test.txt", stringsAsFactors=F)    
    
    traindf <- cbind(subject_train, y_train, x_train[, 1:6])
    testdf <- cbind(subject_test, y_test, x_test[, 1:6])   
    
    resultdf <- rbind(traindf, testdf)
    resultdf <- rename(resultdf, tBodyAcc_mean_X = V1, tBodyAcc_mean_Y = V2, 
                                 tBodyAcc_mean_Z = V3, tBodyAcc_std_X  = V4,
                                 tBodyAcc_std_Y  = V5, tBodyAcc_std_Z  = V6)
     
    summarydf <- summarize(group_by(resultdf, Subject, Activity), 
                            mean(tBodyAcc_mean_X), mean(tBodyAcc_mean_Y), 
                            mean(tBodyAcc_mean_Z), mean(tBodyAcc_std_X),
                            mean(tBodyAcc_std_Y),  mean(tBodyAcc_std_Z))
    
    write.table(summarydf, "wearables.txt", row.name=F)
    
}