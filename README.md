# JHUDSS03-Getting-and-Cleaning-Data
Repo for Coursera course Getting and Cleaning Data by Johns Hopkins University\
#This repo contains the following files:
* a run_analysis.R script
* a ReadMe markdown document
* a Codebook markdown document
* a data folder that includes all the raw data

#Instruction for running the R script:
1. first download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip unzip the folder and rename it as "data". Or directly download the data folder in this repo. 
2. Make sure the data folder and the run_analysis.R file are both in the current working directory.
3. Use the command `source("run_analysis.R")` in RStudio console.
4. You will find one output file called "tidyset.txt" in your working directory.
5. Use the command `checkdata<-read.table("./tidyset.txt",header = T)` in RStudio to read the file. The dataset has 180 means (30 subjects * 6 activities) of 81 features. 
