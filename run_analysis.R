# ------------------------------------------------------------------------------
# |     COURSERA - Getting and Cleaning Data (August 2014 - getdata-006)       |
# ------------------------------------------------------------------------------
# |       Peer Assessments / Getting and Cleaning Data Course Project          |
# ------------------------------------------------------------------------------


#  --- Setting the working directory. ---

##   NOTE:  This script assumes that you have all the needed files into your
##          default working directory.

setwd("./UCI HAR Dataset")

## -----------------------------------------------------------------------------
## Loading training and testing data sets.

x_train <- read.table("./train/X_train.txt")

x_test  <- read.table("./test/X_test.txt")

## -----------------------------------------------------------------------------
#  Loading features.txt

features <- read.table("features.txt")

## -----------------------------------------------------------------------------
#  Loading subject_train and subject_test

subject_train <- read.table("./train/subject_train.txt")

subject_test  <- read.table("./test/subject_test.txt")

## -----------------------------------------------------------------------------
#  Loading Activity data

y_train <- read.table("./train/y_train.txt")

y_test  <- read.table("./test/y_test.txt")

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##############
##  Part 1  ##  Merges the training and the test sets to create one data set.
##############

full_data <- rbind(x_train, x_test)
    
## -----------------------------------------------------------------------------
##############
##  Part 2  ##  Extracts only the measurements on the mean and standard 
##############  deviation for each measurement. 

colMeans(full_data)

apply(full_data, 2, sd)


## -----------------------------------------------------------------------------
#  Stacking subject_train on subject_test  to get a whole set:

full_subject <- rbind(subject_train, subject_test)
    
## -----------------------------------------------------------------------------
#  Stacking y_train on y_test to get a whole set:

full_activity <- rbind(y_train, y_test)

## *****************************************************************************
##############
##  Part 3  ##  Uses descriptive activity names to name the activities 
##############  in the data set.

for( x in 1:10299)
{
    if(full_activity[ x, 1 ] == 1)
    {
        full_activity[ x, 1 ] <- "WALKING"
        
    }else if(full_activity[ x, 1 ] == 2){
        
        full_activity[ x, 1 ] <- "WALKING_UPSTAIRS"
        
    }else if(full_activity[ x, 1 ] == 3){
        
        full_activity[ x, 1 ] <- "WALKING_DOWNSTAIRS"
        
    }else if(full_activity[ x, 1 ] == 4){
        
        full_activity[ x, 1 ] <- "SITTING"
        
    }else if(full_activity[ x, 1 ] == 5){
        
        full_activity[ x, 1 ] <- "STANDING"
        
    }else if(full_activity[ x, 1 ] == 6){
        
        full_activity[ x, 1 ] <- "LAYING"
    }
}

## #############################################################################
#  Modifying features names:

features <- gsub(" - ", "", features[ , 2] )

features <- gsub("-",   "_", features)
features <- gsub("()-", "_", features)
features <- gsub("\\()", "", features)
features <- gsub("\\(", "_", features)
features <- gsub("\\)",  "", features)
features <- gsub(",",   "_", features)

## /////////////////////////////////////////////////////////////////////////////
#  Adding 2 names ("subject" & "activity") at the beggining of 'features' vector

features <- c( c("activity", "subject"), features)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Combining sets: full_activity + full_subject + full_data into the tidy dataset

tidy <- cbind(full_activity, full_subject, full_data)

## =============================================================================
##############
##  Part 4  ##  Appropriately labels the data set with descriptive 
##############  variable names.

# Substituting generic column names (V1, V2, ...) with features names.

colnames(tidy) <- features

################################################################################
##############
##  Part 5  ##  Creates a second, independent tidy data set with the average 
##############  of each variable for each activity and each subject.

independent <- aggregate(tidy, by = list(tidy$subject, tidy$activity), FUN = mean)

# Droping out extra columns that were added by aggregate()

independent$Group.1  <- NULL
independent$activity <- NULL

# Setting column names for the final independent tidy dataset:

colnames(independent) <- features

## Exporting to a  .txt  document:

write.table(independent, file = "independent_tidy.txt", sep = " ", row.names = FALSE)

#-------------------------------------------------------------------------------
#  *** Testing the  output of  .txt file:
test <- read.table("independent_tidy.txt", header = TRUE)

View(test)
#-------------------------------------------------------------------------------

## END ##