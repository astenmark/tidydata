# Codebook

This codebook describes the data variables and processing performed to create the tidy data set in tidymeans.txt.

## Original Dataset

The data have been summarized from the following dataset:

<pre>
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
</pre>

Further information can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data Files

Input data were taken from the following data files:

* test/X_test.txt
* test/subject_test.txt
* test/y_test.txt
* train/X_train.txt
* train/subject_train.txt
* train/y_train.txt
* activity_labels.txt
* features.txt

Inertial signals were not necessary to create the tidy means dataset, and have been ignored.  The resulting tidy dataset is output to tidymeans.txt

## Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist.  These are the activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Using the embedded accelerometer and gyroscope, the project captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Feature Selection 

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

## Processing

This section describes the processing performed by the script run_analysis.R.

Data is first imported from the original text files and combined into a data frame, first the training set, then the test set.  Column names are set according to features.txt, and the dataset is then subset in order to get only the mean and std variables.

Subject numbers and activities are added as separate variables (Subject and Activity respectively) to the dataset, and activity labels are set in the ActivityLabel variable.

Variable names are then cleaned up.  For readability, the long variable names have been capitalized.  Punctuation (hyphens, parantheses, etc) have been removed from variable names.

Finally, the cleaned up data is aggregated into a tidy dataset summarized by subject and activity, and exported to the file tidymeans.txt.

## List of Variables

For reference, here is the list of variables used in the tidy means dataset.  All variables are numeric.

<pre>
Activity
Subject
FBodyAccJerkMagMean
FBodyAccJerkMagStd
FBodyAccJerkMeanX
FBodyAccJerkMeanY
FBodyAccJerkMeanZ
FBodyAccJerkStdX
FBodyAccJerkStdY
FBodyAccJerkStdZ
FBodyAccMagMean
FBodyAccMagStd
FBodyAccMeanX
FBodyAccMeanY
FBodyAccMeanZ
FBodyAccStdX
FBodyAccStdY
FBodyAccStdZ
FBodyGyroJerkMagMean
FBodyGyroJerkMagStd
FBodyGyroMagMean
FBodyGyroMagStd
FBodyGyroMeanX
FBodyGyroMeanY
FBodyGyroMeanZ
FBodyGyroStdX
FBodyGyroStdY
FBodyGyroStdZ
TBodyAccJerkMagMean
TBodyAccJerkMagStd
TBodyAccJerkMeanX
TBodyAccJerkMeanY
TBodyAccJerkMeanZ
TBodyAccJerkStdX
TBodyAccJerkStdY
TBodyAccJerkStdZ
TBodyAccMagMean
TBodyAccMagStd
TBodyAccMeanX
TBodyAccMeanY
TBodyAccMeanZ
TBodyAccStdX
TBodyAccStdY
TBodyAccStdZ
TBodyGyroJerkMagMean
TBodyGyroJerkMagStd
TBodyGyroJerkMeanX
TBodyGyroJerkMeanY
TBodyGyroJerkMeanZ
TBodyGyroJerkStdX
TBodyGyroJerkStdY
TBodyGyroJerkStdZ
TBodyGyroMagMean
TBodyGyroMagStd
TBodyGyroMeanX
TBodyGyroMeanY
TBodyGyroMeanZ
TBodyGyroStdX
TBodyGyroStdY
TBodyGyroStdZ
TGravityAccMagMean
TGravityAccMagStd
TGravityAccMeanX
TGravityAccMeanY
TGravityAccMeanZ
TGravityAccStdX
TGravityAccStdY
TGravityAccStdZ
</pre>
