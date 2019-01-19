# JHUDSS03-Getting-and-Cleaning-Data
* The site where the original data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The original data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The data collection 

The features selected for this database come from the **accelerometer** and **gyroscope** 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These **time domain** signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into **body** and **gravity** acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the **magnitude** of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate **frequency domain** signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ\
tGravityAcc-XYZ\
tBodyAccJerk-XYZ\
tBodyGyro-XYZ\
tBodyGyroJerk-XYZ\
tBodyAccMag\
tGravityAccMag\
tBodyAccJerkMag\
tBodyGyroMag\
tBodyGyroJerkMag\
fBodyAcc-XYZ\
fBodyAccJerk-XYZ\
fBodyGyro-XYZ\
fBodyAccMag\
fBodyAccJerkMag\
fBodyGyroMag\
fBodyGyroJerkMag


A set of variables, such as mean and standard deviation, were estimated from these signals, which made up the original dataset.

## The output tidy data

From the original dataset, we extract only the measurements on the mean and standard deviation for each measurement.

The variables selected are: 

* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The result of the data cleaning is a tidy data set with dimensions 180 by 81.

In the tidy data set, there are 180 rows each corresponding to one subject doing one activity. There are 30 subjects and 6 activities, and therefore 180 rows.

In the tidy data set, there are 81 variables as follows:
 
 [1] "subject" : integer values 1-30 representing the individuals from whom we obtained the measurements. There are 30 participants total in this study.    
 [2] "activity" : factor with 6 levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
 
**In the following variables, the prefix t- denotes time domain, f- frequency domain**\
**The following variables are the average of measurements for each activity and each subject.**

 [3] "tBodyAccMeanX": body acceleration mean in X               
 [4] "tBodyAccMeanY": body acceleration mean in Y      
 [5] "tBodyAccMeanZ": body acceleration mean in Z   
 
 [6] "tGravityAccMeanX": gravity acceleration mean in X          
 [7] "tGravityAccMeanY": gravity acceleration mean in Y           
 [8] "tGravityAccMeanZ": gravity acceleration mean in Z
 
 [9] "tBodyAccJerkMeanX": body acceleration jerk mean in X       
[10] "tBodyAccJerkMeanY": body acceleration jerk mean in Y        
[11] "tBodyAccJerkMeanZ": body acceleration jerk mean in Z 

[12] "tBodyGyroMeanX": body angular velocity mean in X            
[13] "tBodyGyroMeanY": body angular velocity mean in Y            
[14] "tBodyGyroMeanZ": body angular velocity mean in Z    

[15] "tBodyGyroJerkMeanX": body angular velocity jerk mean in X\
[16] "tBodyGyroJerkMeanY": body angular velocity jerk mean in Y   
[17] "tBodyGyroJerkMeanZ": body angular velocity jerk mean in Z

[18] "tBodyAccMagMean": body acceleration magnitude mean         
[19] "tGravityAccMagMean": gravity acceleration magnitude mean    
[20] "tBodyAccJerkMagMean": body acceleration jerk magnitude mean \
[21] "tBodyGyroMagMean": body angular velocity magnitude mean            
[22] "tBodyGyroJerkMagMean": body angular velocity jerk magnitude mean 

[23] "fBodyAccMeanX": body acceleration mean in X               
[24] "fBodyAccMeanY": body acceleration mean in Y               
[25] "fBodyAccMeanZ": body acceleration mean in Z         

[26] "fBodyAccMeanFreqX": body acceleration mean frequency in X           
[27] "fBodyAccMeanFreqY": body acceleration mean frequency in Y           
[28] "fBodyAccMeanFreqZ": body acceleration mean frequency in Z     

[29] "fBodyAccJerkMeanX": body acceleration jerk mean in X            
[30] "fBodyAccJerkMeanY": body acceleration jerk mean in Y            
[31] "fBodyAccJerkMeanZ": body acceleration jerk mean in Z 

[32] "fBodyAccJerkMeanFreqX": body acceleration mean frequency in X        
[33] "fBodyAccJerkMeanFreqY": body acceleration mean frequency in Y        
[34] "fBodyAccJerkMeanFreqZ": body acceleration mean frequency in Z   

[35] "fBodyGyroMeanX": body angular velocity mean in X                
[36] "fBodyGyroMeanY": body angular velocity mean in Y               
[37] "fBodyGyroMeanZ": body angular velocity mean in Z        

[38] "fBodyGyroMeanFreqX": body angular velocity mean frequency in X           
[39] "fBodyGyroMeanFreqY": body angular velocity mean frequency in Y           
[40] "fBodyGyroMeanFreqZ": body angular velocity mean frequency in Z 

[41] "fBodyAccMagMean": body acceleration magnitude mean             
[42] "fBodyAccMagMeanFreq": body acceleration magnitude mean frequency         
[43] "fBodyBodyAccJerkMagMean": body acceleration jerk magnitude mean     
[44] "fBodyBodyAccJerkMagMeanFreq": body acceleration jerk magnitude mean frequency

[45] "fBodyBodyGyroMagMean": body angular velocity magnitude mean        
[46] "fBodyBodyGyroMagMeanFreq": body angular velocity magnitude mean frequency    
[47] "fBodyBodyGyroJerkMagMean": body angular velocity jerk magnitude mean    
[48] "fBodyBodyGyroJerkMagMeanFreq": body angular velocity jerk magnitude mean frequency

[49] "tBodyAccStdX": body acceleration standard deviation in X               
[50] "tBodyAccStdY": body acceleration standard deviation in Y                
[51] "tBodyAccStdZ": body acceleration standard deviation in Z  

[52] "tGravityAccStdX": gravity acceleration standard deviation in X             
[53] "tGravityAccStdY": gravity acceleration standard deviation in Y             
[54] "tGravityAccStdZ": gravity acceleration standard deviation in Z 

[55] "tBodyAccJerkStdX": body acceleration jerk standard deviation in X            
[56] "tBodyAccJerkStdY": body acceleration jerk standard deviation in Y            
[57] "tBodyAccJerkStdZ": body acceleration jerk standard deviation in Z  

[58] "tBodyGyroStdX": body angular velocity standard deviation in X               
[59] "tBodyGyroStdY": body angular velocity standard deviation in Y                
[60] "tBodyGyroStdZ": body angular velocity standard deviation in Z  

[61] "tBodyGyroJerkStdX": body angular velocity jerk standard deviation in X            
[62] "tBodyGyroJerkStdY": body angular velocity jerk standard deviation in Y           
[63] "tBodyGyroJerkStdZ": body angular velocity jerk standard deviation in Z  

[64] "tBodyAccMagStd": body acceleration magnitude standard deviation              
[65] "tGravityAccMagStd": gravity acceleration magnitude standard deviation            
[66] "tBodyAccJerkMagStd": body acceleration jerk magnitude standard deviation           
[67] "tBodyGyroMagStd": body angular velocity magnitude standard deviation             
[68] "tBodyGyroJerkMagStd": body angular velocity jerk magnitude standard deviation 

[69] "fBodyAccStdX": body acceleration standard deviation in X                
[70] "fBodyAccStdY": body acceleration standard deviation in Y                
[71] "fBodyAccStdZ": body acceleration standard deviation in Z          

[72] "fBodyAccJerkStdX": body acceleration jerk standard deviation in X            
[73] "fBodyAccJerkStdY": body acceleration jerk standard deviation in Y            
[74] "fBodyAccJerkStdZ": body acceleration jerk standard deviation in Z     

[75] "fBodyGyroStdX": body angular velocity standard deviation in X               
[76] "fBodyGyroStdY": body angular velocity standard deviation in Y               
[77] "fBodyGyroStdZ": body angular velocity standard deviation in Z    

[78] "fBodyAccMagStd": body acceleration magnitude standard deviation              
[79] "fBodyBodyAccJerkMagStd": body acceleration jerk magnitude standard deviation       
[80] "fBodyBodyGyroMagStd": body angular velocity magnitude standard deviation         
[81] "fBodyBodyGyroJerkMagStd": body angular velocity jerk magnitude standard deviation 
