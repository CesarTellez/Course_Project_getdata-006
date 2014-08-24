Code Book
==========================

COURSERA - Getting and Cleaning Data
--------------
(August 2014 - getdata-006)  
--------------
Peer Assessments / Getting and Cleaning Data Course Project  
--------------



:: Data ::
--------------

Data consists of 7 data sets, which were divided originally from 1 data set.

According with the authors, the original whole data set was divided into 2 parts consisting of 70%  and 30%.

They called the files:

- X_train.txt  (70% of pre-processed data from sensors)
- X_test.txt   (30% of re-processed  data from sensors)

- subject_train.txt   (70% of subject / people code list )
- subject_test.txt    (30% of subject / people code list )

- y_train.txt      (70% of 6 activities list)
- y_test.txt       (30% of 6 activities list)

- features.txt    (100% of column names describing pre-processed data from sensors)



:: Transformations ::
--------------

- The column names were chosen from the list or vector provided in the file *features.txt*.  It was processed to get rid off symbols like commas, parentheses, minus, dots, etc.
and replaced them by the symbol underscore. "_"

For example the column name "tBodyAcc-mean()-X" was changed to "tBodyAcc_mean_X"  or the column name "tBodyAcc-correlation()-X,Y" was changed to "tBodyAcc_correlation_X_Y"

The election of the symbol underscore was made in order to get clear and meaninful column names.


Additions made to 'features.txt':
--------------
There were a couple of additions made to the original list:
- Activity:  

Which consists of 6 activities: Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Laying.

These activities were performed by 30 people with an age range from 19 to 48 years. 

- Subject:

Subject column represents the people that participated in this experiment, their names were not provided, instead it was given a list of codes from 1 to 30 that
represents each of them.

So the final list of columns consists of 561 + 2 = 563 names.




:: List of variable names ::
--------------
The complete original "feature.txt" list has 561 names which correspond to the names for every column in the data sets: 

- X_train.txt
- X_test.txt

** For a more detailed description of the variable names and the raw / pre-processed data, you can refer to the files: "feature.txt", 'features.info' and 'README.txt' which are provided by the authors. **


For each record in the dataset it is provided: 
--------------

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

*Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*


Information about the authros of data sets : 
--------------

Human Activity Recognition Using Smartphones Dataset
Version 1.0
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
