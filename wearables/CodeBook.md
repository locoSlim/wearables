# Getting Data Class Project

## Transform and Summarize Smart Phone Accelerometer Data

### Input files:

 (Dataset obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* features.txt: List of all measurement variables.
* activity_labels.txt: Subject activity descriptions.
* subject_train.txt and subject_test.txt: Subject and measurements cross reference files.
* y_train.txt and y_test.txt: Activity and measurements cross reference files.
* X_train.txt and X_test.txt: Measurements files.


### Transformations performed:

* Activity descriptions merged with measurement activities data, test and train, into a single dataframe. 
* Variable names stored in a dataframe.  Filtered to contain only mean() and std() variable names.
* Measurements stored in train and test dataframes.  Filtered to contain only mean() and std() data.
* Subject, Activity, and Measurements merged into train and test dataframes.
* Train and test data merged.
* Variable names inserted to produce the final dataset.
* Final dataset summarized by Subject and activity giving discrete averages of all measurements.
* Variable names were adjusted, and the dataset exported to file wearables.txt. 

### Variables
      
  3-axis accelerometer and gyroscope 50 hz time domain signals measured in meters per second squared.
 
* Mean_of_tBodyAcc-mean()-X     Mean_of_tBodyAcc-mean()-Y       Mean_of_tBodyAcc-mean()-Z                 
* Mean_of_tBodyAcc-std()-X      Mean_of_tBodyAcc-std()-Y        Mean_of_tBodyAcc-std()-Z
* Mean_of_tGravityAcc-mean()-X  Mean_of_tGravityAcc-mean()-Y    Mean_of_tGravityAcc-mean()-Z
* Mean_of_tGravityAcc-std()-X   Mean_of_tGravityAcc-std()-Y     Mean_of_tGravityAcc-std()-Z
* Mean_of_tBodyAccJerk-mean()-X Mean_of_tBodyAccJerk-mean()-Y   Mean_of_tBodyAccJerk-mean()-Z  
* Mean_of_tBodyAccJerk-std()-X  Mean_of_tBodyAccJerk-std()-Y    Mean_of_tBodyAccJerk-std()-Z
* Mean_of_tBodyGyro-mean()-X    Mean_of_tBodyGyro-mean()-Y      Mean_of_tBodyGyro-mean()-Z
* Mean_of_tBodyGyro-std()-X     Mean_of_tBodyGyro-std()-Y       Mean_of_tBodyGyro-std()-Z
* Mean_of_tBodyGyroJerk-mean()-X Mean_of_tBodyGyroJerk-mean()-Y Mean_of_tBodyGyroJerk-mean()-Z
* Mean_of_tBodyGyroJerk-std()-X Mean_of_tBodyGyroJerk-std()-Y   Mean_of_tBodyGyroJerk-std()-Z
* Mean_of_tBodyAccMag-mean()    Mean_of_tBodyAccMag-std()  
* Mean_of_tGravityAccMag-mean() Mean_of_tGravityAccMag-std()
* Mean_of_tBodyAccJerkMag-mean() Mean_of_tBodyAccJerkMag-std()
* Mean_of_tBodyGyroMag-mean()   Mean_of_tBodyGyroMag-std()
* Mean_of_tBodyGyroJerkMag-mean() Mean_of_tBodyGyroJerkMag-std()

  Fast Fourier Transform of select measurements yielding frequency domain signals.     

* Mean_of_fBodyAcc-mean()-X     Mean_of_fBodyAcc-mean()-Y       Mean_of_fBodyAcc-mean()-Z
* Mean_of_fBodyAcc-std()-X      Mean_of_fBodyAcc-std()-Y        Mean_of_fBodyAcc-std()-Z
* Mean_of_fBodyAccJerk-mean()-X Mean_of_fBodyAccJerk-mean()-Y   Mean_of_fBodyAccJerk-mean()-Z      
* Mean_of_fBodyAccJerk-std()-X  Mean_of_fBodyAccJerk-std()-Y    Mean_of_fBodyAccJerk-std()-Z       
* Mean_of_fBodyGyro-mean()-X    Mean_of_fBodyGyro-mean()-Y      Mean_of_fBodyGyro-mean()-Z         
* Mean_of_fBodyGyro-std()-X     Mean_of_fBodyGyro-std()-Y       Mean_of_fBodyGyro-std()-Z  
* Mean_of_fBodyAccMag-mean()    Mean_of_fBodyAccMag-std()
* Mean_of_fBodyBodyAccJerkMag-mean()  Mean_of_fBodyBodyAccJerkMag-std()
* Mean_of_fBodyBodyGyroMag-mean()     Mean_of_fBodyBodyGyroMag-std()
* Mean_of_fBodyBodyGyroJerkMag-mean() Mean_of_fBodyBodyGyroJerkMag-std()


### From the study authors:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).















