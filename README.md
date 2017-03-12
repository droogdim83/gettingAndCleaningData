# Getting and Cleaning Data Course Project

## Files included in this repository:

* README.md - This README file for the repository
* CodeBook.md - Provides background on the data, a description of the zip 
  file contents, the variables, and any variable transformations
* run_analysis.R - The script that downloads the data, reads in the data, 
  makes the data tidy, subsets the data and writes the tidy data to a file
* tidy_data.txt - The tidy dataset output by the included R script

## How to use the run_analysis.R script:

1. Open R and the set the working directory to the repository folder. 
2. Type `source("run_analysis.R")` into the command line. 
3. The script will proceed to download the original dataset if needed and 
  transform it according to the description in the CodeBook.md file. 
4. The final output of the script will be stored in the tidy.txt file.


## What makes the final dataset tidy data?
1. Each column contains only one variable.
2. Each row represents a separate observation (set of measurements for a 
	particular subject performing a particular activity).
3. The table contains a single observational unit comprised of a subject 
	identifier, activity identifier, and the associated measurements.  Although
	it's possible to split the table into two tables (subject, activity) and 
	(subject, measurements) it would make data manipulation more difficult and 
	neither table would be very useful on its own.
4. Any factor variables, in this case "activity", have descriptive values 
	rather than just numbers.
5. The variable names are descriptive without being too long and do not contain
	underscores or camelCapitalization which can make troubleshooting and 
	readability difficult.  Although it's not usually preferred, the names 
	include spaces to improve readability.
