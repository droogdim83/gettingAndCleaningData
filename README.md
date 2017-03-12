# Getting and Cleaning Data Course Project

Files included in this repository:

* README.md - This README file for the repository
* CodeBook.md - Provides background on the data, a description of the zip file contents, the variables, and any variable transformations
* run_analysis.R - The script that downloads the data, reads in the data, makes the data tidy, subsets the data and writes the tidy data to a file
* tidy_data.txt - The tidy dataset output by the included R script

How to use the run_analysis.R script:

1. Open R and the set the working directory to the repository folder. 
2. Type `source("run_analysis.R")` into the command line. 
3. The script will proceed to download the original dataset if needed and transform it according to the description in the CodeBook.md file. 
4. The final output of the script will be stored in the tidy.txt file.
