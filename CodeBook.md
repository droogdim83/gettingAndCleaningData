# Codebook




##	Data Source and Analysis Script
This project analyzes the "Human Activity Recognition Using Smartphones 
Dataset," from the UC Irvine Machine Learning Repository.  This dataset records
the movement of 30 subjects measured by the gyroscope (measures orientation in 
the x, y, and z planes) and accelerometer (measures the change in speed) in 
smartphones. The movememnts were labeled as 1 of 6 activities (Walking, Walking 
upstairs, Walking downstairs, Sitting, Standing still, or Laying).  The data 
from 70% of the subjects was made into a "training" dataset, while the 
remaining 30% of the subjects made up the "test" data set.  The subjects were 
randomly assigned to either the "training" or "test" dataset.

The source data can be downloaded here:
[Human Activity Smartphone Dataset] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

This repository includes a script, "run_analysis.R" which downloads
the data and converts it into "tidy data." 




##	Sensor Measurements and Calculations
The following "features" were measured or calculated from the sensor data.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

*t* denotes time-domain data 
*f* denotes frequency-domain data (calculated using Fast Fourier Transform)

*Body* indicates the *body* component of the acceleration 
*Gravity* indicates the *gravity* component of the acceleration

*Acc* indicates that the data came from the *accelerometer*.
*Gyro* indicates that the data came from the *gyroscope*.

*AccJerk* is a calculated linear acceleration
*GyroJerk* is a calculated angular velocity

*-XYZ* indicates that there are 3 separate variables, one for each plane *x*, 
*y*, and *z*.

The following variables, most of which are statistical measures, are calculated
for the time-domain and frequency-domain from the "features" listed above
* mean(): Mean value [x, y, and z components]
* std(): Standard deviation [x, y, and z components]
* mad(): Median absolute deviation [x, y, and z components]
* max(): Largest value in array [x, y, and z components]
* min(): Smallest value in array [x, y, and z components]
* sma(): Signal magnitude area [single value]
* energy(): Energy measure. Sum of the squares divided by the number of values. 
	[x, y, and z components]
* iqr(): Interquartile range [x, y, and z components]
* entropy(): Signal entropy [x, y, and z components]
* arCoeff(): Autorregresion coefficients with Burg order equal to 4 [x, y, and 
	z components]
* correlation(): correlation coefficient between two signals

The following variables only apply to frequency-domain data
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean 
	frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT 
	of each window.

The following vectors are calculated by averaging the value of the signal in 
the FFT window.  These are used to calculate the *angle()* between two vectors.
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

*The entire list of the variables resulting from the **"Sensor Measurement and 
Calculations"** is included in the **features.txt** file.  Since there are 
over 560 variables, all the names will not be repeated here*

*Note:  Many of these variables will be removed from the final data set which 
only consists of variables with **mean** and **standard deviation** values for 
each measurement.* 




##	Files included in zip file
*activity_labels.txt* - the activities are recorded as numbers in the files 
	*y_test.txt* and *y_train.txt*.  *activity_labels* converts these numbers
	to descriptive activity names.
	
*features_info.txt* - includes a more verbose version of the information 
	included in the "Sensor Measurements and Calculations" section above

*features.txt* - includes the names of all 561 variables described in the 
	"Sensor Measurements and Calculations" section above.

*README.txt* - includes a lot of background information on the project

*X_test.txt* and *X_train.txt* - include the numeric values for each sample of
	the 561 variables listed in *features.txt* for the test and the training 
	datasets, respectively

*y_test.txt* and *y_train.txt* - includes the numeric activity for the test and 
	the training datasets, respectively

*subject_test.txt* and *subject_train.txt* - identifies the person in the study
	(labeled as 1-30 since the data was anonymized)

**Note:  The other files located in the *Inertial Signals* subdirectories are 
	more raw data from the sensors.  These files will not be used for this 
	analysis.** 


	
##	Remaining Variables
**subject** - identifies the person in the study (labeled as 1-30)

**activity** - identifies which of the following 6 activities the user was 
		performing during the measurement time 
1.  walking
2.  walking upstairs
3.  walking downstairs
4.  sitting
5.  standing
6.  laying

The mean [mean()] and standard deviation [std()] variables are included for the 
folliwing signals:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag




##	Reformatting Variable Names
The names of the variables have been reformatted to make them more descriptive
and easy to read.  The resulting variable names are given below.

* subject                           
* activity                          
* time body accel mean x           
* time body accel mean y            
* time body accel mean z            
* time body accel std dev x        
* time body accel std dev y         
* time body accel std dev z         
* time grav accel mean x           
* time grav accel mean y            
* time grav accel mean z            
* time grav accel std dev x        
* time grav accel std dev y         
* time grav accel std dev z         
* time body accel jerk mean x      
* time body accel jerk mean y       
* time body accel jerk mean z       
* time body accel jerk std dev x   
* time body accel jerk std dev y    
* time body accel jerk std dev z    
* time body gyro mean x            
* time body gyro mean y             
* time body gyro mean z             
* time body gyro std dev x         
* time body gyro std dev y          
* time body gyro std dev z          
* time body gyro jerk mean x       
* time body gyro jerk mean y        
* time body gyro jerk mean z        
* time body gyro jerk std dev x    
* time body gyro jerk std dev y     
* time body gyro jerk std dev z     
* time body accel size mean        
* time body accel size std dev      
* time grav accel size mean         
* time grav accel size std dev     
* time body accel jerk size mean    
* time body accel jerk size std dev 
* time body gyro size mean         
* time body gyro size std dev       
* time body gyro jerk size mean     
* time body gyro jerk size std dev 
* freq body accel mean x            
* freq body accel mean y            
* freq body accel mean z           
* freq body accel std dev x         
* freq body accel std dev y         
* freq body accel std dev z        
* freq body accel jerk mean x       
* freq body accel jerk mean y       
* freq body accel jerk mean z      
* freq body accel jerk std dev x    
* freq body accel jerk std dev y    
* freq body accel jerk std dev z   
* freq body gyro mean x             
* freq body gyro mean y             
* freq body gyro mean z            
* freq body gyro std dev x          
* freq body gyro std dev y          
* freq body gyro std dev z         
* freq body accel size mean         
* freq body accel size std dev      
* freq body accel jerk size mean   
* freq body accel jerk size std dev 
* freq body gyro size mean          
* freq body gyro size std dev      
* freq body gyro jerk size mean     
* freq body gyro jerk size std dev




##	Data Transformations

1. Combine the subject data from the train and test datasets by row binding.
2. Combine the activity data from the train and test datasets by row binding.
3. Replaced the numeric activity identifier with descriptive identifiers 
	corresponding to the numbers.
4. Combine the measurement data from the train and test datasets by row binding.
5. Combine the subject, activity, and measurement data by column binding.
6. Add column names to the combined dataset using the features data.
7. Subset the columns of the combined dataset to retain only:  the subject data, 
	activity data, and data corresponding to the mean and standard deviation 
	for each measurement.
8. Tidy up the column names to make them more readable and clear by removing 
	dashes, replacing short abbreviations with more descriptive ones, adding
	spaces to separate abbreviations, and making names all lowercase.  Steps 
	1-8 generate the first tidy data set.
9. Create a second tidy set by aggregating the first tidy dataset according to 
	subject and activity and calculating the mean for each measurement column 
	in the aggregate dataset.



##	Why is the final dataset tidy data?
1.  Each column contains only one variable.
2.  Each row represents a separate observation (set of measurements for a 
	particular subject performing a particular activity).
3.  The table contains a single observational unit comprised of a subject 
	identifier, activity identifier, and the associated measurements.  Although
	it's possible to split the table into two tables (subject, activity) and 
	(subject, measurements) it would make data manipulation more difficult and 
	neither table would be very useful on its own.
4.	Any factor variables, in this case "activity", have descriptive values 
	rather than just numbers.
5.	The variable names are descriptive without being too long and do not contains
	underscores or camelCapitalization which can make troubleshooting and 
	readability difficult.  Although it's not usually preferred, the names 
	include spaces to improve readability.