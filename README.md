Course Project: Getting and Cleaning Data
==========================

First:
--------------
This script assumes that you have all the needed files (*UCI HAR Dataset*) into your default working directory, which you can download here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

Second:
--------------
Open the file **run_analysis.R** and run the code step by step, you should see all the data frames loaded into your global environment.

Third:
--------------
In general, the script works in this way:

- It loads the all the data sets ( 7 ) with the function read.table()

- There is some processing to data sets to change the activities codes (which are enconded as numbers) into meaninful names.

- Then the data sets are combined with the function rbind() to get one final super set. (*tidy*)

- The calculations made to the *tidy* data sets are the mean (average) and standard deviation.

- Finally a separate data set is created (independent) which is generated with the function aggregate(), this is to get  the average of each variable (columns) for each activity and each subject. (i.e. people that participated in that experiment.)


Fourth:
--------------
At the end the data set *independent* is exported with the function write.table() to the text file:  **independent_tidy.txt**.  Also you can verify that was correctly exported by loading it and visualizing the correspondent data frame. (*test*)
