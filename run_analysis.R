##loading the datasets 
#activity_labels: motions to be predicted
activity_labels<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/activity_labels.txt")

#features: column names, variable names
features<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/features.txt")

#subject: the individual participants
subject_train<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/train/subject_train.txt")


X_train<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/train/X_train.txt")

#Y: the recorded activity/motion
Y_train<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/train/Y_train.txt")




subject_test<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/test/subject_test.txt")


X_test<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/test/X_test.txt")

Y_test<-read.table("C:/Users/LeiCheng/Documents/2Learn/JHU Coursera/3Getting and Cleaning Data/project data sets/test/Y_test.txt")

#-----------------------------------------------

##first peek into the datasets


#first check out the dimensions (done in RStudio window)

dim(activity_labels)
dim(features)
dim(subject_test)
dim(subject_train)
dim(X_test)
dim(Y_test)
dim(X_train)
dim(Y_train)


#then look at the values 
table(subject_train)

table(Y_train)

table(subject_test)

table(Y_test)


#1.	Merge the training and the test sets to create one data set

train<-cbind(X_train,Y_train,subject_train)

test<-cbind(X_test,Y_test,subject_test)

all<-rbind(train,test)




#2a. renaming the variables by features


#What didn't work
#names(all)<-c(features[,2],"activity")
class(features[,2])
class(features$V2)
class(c(features$V2,"activity"))
class(names(all))
#names(all)
#names(all)<-cat(features[,2],"activity")


#What worked: converting the factors into characters first
names(all)<-c(as.character(features$V2),"activity","subject")
#or equivalently
names(all)<-c(as.character(features[,2]),"activity","subject")

head(names(all))
#names(X_test)<-features$V2 #works fine without concatenation

#Without concatenation, features[,2] is a factor. When concatenated, c() function turned it into numbers.


#2b. Extracts only the measurements on the mean and standard deviation for each measurement

indices1<-grep("mean()",names(all))
names(all)[indices1]
indices2<-grep("std()",names(all))
names(all)[indices2]
class(indices1)
c(indices1,indices2)
class(c(indices1,indices2))
names(all)[c(indices1,indices2)]
#subsetting all columns with mean() and std() and the Y column("activity label")
all_sub<-all[,c(indices1,indices2,ncol(all)-1,ncol(all))]
names(all_sub)


#3.	Uses descriptive activity names to name the activities in the data set (replacing the numbers in Y column with names of the activities)

table(all_sub$activity)
class(all_sub$activity)
activity_labels

for (i in 1:nrow(activity_labels)){
  all_sub$activity<-sub(i,activity_labels[i,2],all_sub$activity)
}

#all_sub$activity<-sub("1",activity_labels[1,2],all_sub$activity)

table(all_sub$activity)

#4.	Appropriately labels the data set with descriptive variable names. ( change the column names)

#names(all_sub)

#wait



#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(tidyverse)
table(all_sub$activity)

table(all_sub$subject)
table(all_sub$activity,all_sub$subject)


xtabs(~all_sub$activity+all_sub$subject)
all_mean<-all_sub%>%group_by(subject,activity)%>%summarize_all(mean)
head(all_mean)
