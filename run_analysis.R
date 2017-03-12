##                      Getting and Cleaning Data Project
##                            Weston Carloss

##   This data set includes "fitness tracker" data collected from smartphones.
##   The data comes from the UC Irvine Machine Learning Repository.

##   30 subjects were asked to perform one of 6 activities:
##   1.  Walking (on a level surface or slight incline)
##   2.  Walking upstairs
##   3.  Walking downstairs
##   4.  Sitting
##   5.  Standing still
##   6.  Laying

##   The movement of the subjects was recorded using a smartphone.

##   There are two types of sensors in the smartphone which provide measurement 
##   data.  An accelerometer measures the change in speed, and a gyroscope 
##   measures orientation (in the x, y, and z planes).  When the data from these 
##   sensors are combined, you can figure out how fast an object is moving and 
##   in what direction.

##   The measurements for 70% of the subjects were labeled as the training 
##   data set.  The measurement for the rehumanActicitying 30% of the subjects 
##   were labeled as the test data set.


##        Clear out the workspace to reduce memory usage
rm(list = ls())

##        Download the zip file and extract the contents
ZipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("humanActivity.zip")) {
download.file(ZipUrl, dest="humanActivity.zip") 
}
unzip ("humanActivity.zip")
setwd("UCI HAR Dataset")

##        Read in the Subject ID data for both data sets and combine them
subjectTrain <- read.table("./train/subject_train.txt")
subjectTest <- read.table("./test/subject_test.txt")
subjectID <- rbind(subjectTrain, subjectTest)

##        Read in the Activity labels and the activity numbers for both data 
##        sets.  Combine the two data sets and give the activities descriptive
##        names rather than numbers.  The activity labels are already 
##        desciptive, but underscores and capital letters are not considered 
##        tidy so we'll make the descriptions all lowercase and replace 
##        underscores with spaces to humanActicitytain readability.
activityLabels <- read.table("./activity_labels.txt")
activityLabels[,2] <- tolower(as.character(activityLabels[,2]))
activityLabels[,2] <- gsub("_", " ", activityLabels[,2])

activityTrain <- read.table("./train/y_train.txt")
activityTest <- read.table("./test/y_test.txt")
activity <- rbind(activityTrain, activityTest)

##        Reg Expressions should be used along with as.factor to convert 
##        activity into a factor variable with the levels and descriptions 
##        coming from activityLabels.  But this works.
activity[,1] <- gsub("1", activityLabels[1,2], activity[,1])
activity[,1] <- gsub("2", activityLabels[2,2], activity[,1])
activity[,1] <- gsub("3", activityLabels[3,2], activity[,1])
activity[,1] <- gsub("4", activityLabels[4,2], activity[,1])
activity[,1] <- gsub("5", activityLabels[5,2], activity[,1])
activity[,1] <- gsub("6", activityLabels[6,2], activity[,1])

##        Read in the measurement data for both data sets and combine them
measurementTrain <- read.table("train/X_train.txt")
measurementTest <- read.table("test/X_test.txt")
measurement <- rbind(measurementTrain, measurementTest)

##        Read in the feature (measured and calculated data)names
features <- read.table("features.txt", colClass = "character")

##        Combine the subject ID, activity, and the measurement values
##        Assign names to the variables (columns).
humanActivity <- cbind(subjectID, activity, measurement)
names(humanActivity) <- c("Subject", "Activity", features[, 2])

##        Now we need to subset down the dataset to remove all the undesired 
##        columns.  The project description states to only keep the mean and 
##        standard deviation values for each measurement.  I'm interpreting this
##        as any name with "mean()" or "std()".  Of course we also need to keep
##        the subject ID and activity.
humanActivity <- humanActivity[, (names(humanActivity) == "Subject" | 
                                       names(humanActivity) == "Activity" | 
                                       grepl("mean\\(\\)", names(humanActivity)) | 
                                       grepl("std\\(\\)", names(humanActivity)))]
##        Now we need to give the variables tidy names (no underscores, 
##        capitalization, descriptive names).  The names will contain spaces
##        to maintain some level of readability.  The names were slightly 
##        shortened to avoid being too verbose.
names(humanActivity) <- gsub("^t", "time", names(humanActivity))
names(humanActivity) <- gsub("^f", "freq", names(humanActivity))
names(humanActivity) <- gsub("-", " ", names(humanActivity))
names(humanActivity) <- gsub("X", "x", names(humanActivity))
names(humanActivity) <- gsub("Y", "y", names(humanActivity))
names(humanActivity) <- gsub("Z", "z", names(humanActivity))
names(humanActivity) <- gsub("mean\\(\\)", "mean", names(humanActivity))
names(humanActivity) <- gsub("std\\(\\)", "std dev", names(humanActivity))
names(humanActivity) <- gsub("Body", " body", names(humanActivity))
names(humanActivity) <- gsub("Gyro", " gyro", names(humanActivity))
names(humanActivity) <- gsub("Acc", " accel", names(humanActivity))
names(humanActivity) <- gsub("Mag", " size", names(humanActivity))
names(humanActivity) <- gsub("Jerk", " jerk", names(humanActivity))
names(humanActivity) <- gsub("Gravity", " grav", names(humanActivity))
names(humanActivity) <- gsub("body body", "body", names(humanActivity))

##        Now we need to create a new tidy data set that contains the average 
##        (mean) value for each measurement when subsetted by Subject and 
##        Activity.  "aggregate()" allows us to compute summary statistics on 
##        one or more subsets.  We can feed in the values to use for subsetting
##        using "by = c()".  Subject and Activity are capitalized to avoid 
##        conflicts the "activity" variable used earlier.  The names are then
##        converted back to lowercase to make them tidy.
tidySubsets <- aggregate(humanActivity[, -(1:2)], 
                         by = list(Subject = humanActivity$Subject, 
                                   Activity = humanActivity$Activity), 
                         FUN = mean)
names(tidySubsets) <- tolower(names(tidySubsets))

##        Finally, we need to write the tidy data to a new file in working 
##        directory
setwd("..")
write.table(tidySubsets, "tidy_data.txt", row.names = FALSE, col.names = TRUE)

##        Confirm that reading the tidy_data file back in gives tidy data 
tidyReread <- read.table("tidy_data.txt", header = TRUE, as.is = TRUE)