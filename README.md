# JHUDSS03-Getting-and-Cleaning-Data
Repo for Coursera course Getting and Cleaning Data by Johns Hopkins University
## This repo contains the following files:
* run_analysis.R script
* ReadMe markdown document
* Codebook markdown document
* data folder that includes all the raw data

## Instruction for running the R script:
1. First download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip unzip the folder and rename it as "data". Or directly download the data folder in this repo. 
2. Make sure the data folder and the run_analysis.R file are both in the current working directory.
3. If you don't have tidyverse package installed, please first run `install.packages("tidyverse")` in RStudio.
4. Use the command `source("run_analysis.R")` in RStudio console.
5. You will find one output file called "tidyset.txt" in your working directory.
6. Use the command `checkdata<-read.table("./tidyset.txt",header = T)` in RStudio to read the file. The dataset has 180 means (30 subjects * 6 activities) of 81 features. 

## Outline of the tidying process:
1. Merge the measurement set (X), the activity_label set (Y) and the subject set for both the training set and the test set respectively, then merge the training set and the test set into the set **all**. 

2. Rename the variables in the set **all** by the measured features. Extract only the features with the function mean() and std() using `grep()` to create a new dataset **all_sub**. I choose to exclude the features with angle() because they are not measuring the mean, but the angle between different vectors. The following variables are selected.
* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

3. In the activity column, replace the numbers 1-6 with the descriptive labels such as "walking", "sitting" etc.

4. In the column/variable names, remove "()" and "-" and replace "mean" with "Mean", "std" with "Std".

5. Group the set **all_sub** by both subject and activity using the `group_by` function from the dplyr package. Then use the `summarize_all` function to find the average of each variable for each subject and each activity. The resulting dataset is named **tidyset**.