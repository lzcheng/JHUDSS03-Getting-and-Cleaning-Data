#install.packages("tidyverse")
library(tidyverse)

##loading the datasets 
#activity_labels: motions to be predicted
activity_labels<-read.table("./data/activity_labels.txt")
#features: column/variable names
features<-read.table("./data/features.txt")
#subject: the individual participants
subject_train<-read.table("./data/train/subject_train.txt")
X_train<-read.table("./data/train/X_train.txt")
#Y: the recorded activity/motion
Y_train<-read.table("./data/train/Y_train.txt")
subject_test<-read.table("./data/test/subject_test.txt")
X_test<-read.table("./data/test/X_test.txt")
Y_test<-read.table("./data/test/Y_test.txt")

#-----------------------------------------------
##first look at the datasets
dim(activity_labels)
dim(features)
dim(subject_test)
dim(subject_train)
dim(X_test)
dim(Y_test)
dim(X_train)
dim(Y_train)

table(subject_train)
table(Y_train)
table(subject_test)
table(Y_test)

#-----------------------------------------------------
#1.	Merge the training and the test sets to create one data set
train<-cbind(X_train,Y_train,subject_train)
test<-cbind(X_test,Y_test,subject_test)
all<-rbind(train,test)

#----------------------------------------------------------
#2a. Renaming the variables by features
names(all)<-c(as.character(features$V2),"activity","subject")
head(names(all))
tail(names(all))

#2b. Extracts only the measurements on the mean and standard deviation for each measurement
indices1<-grep("mean()",names(all),ignore.case = T)
indices2<-grep("std()",names(all))
names(all)[c(indices1,indices2)]
#subsetting all columns with mean() and std() and the Y column("activity label")
all_sub<-all[,c(indices1,indices2,ncol(all)-1,ncol(all))]
names(all_sub)

#-----------------------------------------------------------
#3.	Uses descriptive activity names to name the activities in the data set (replacing the numbers in Y column with names of the activities)
for (i in 1:nrow(activity_labels)){
  all_sub$activity<-sub(i,activity_labels[i,2],all_sub$activity)
}

table(all_sub$activity)

#--------------------------------------------------------
#4.	Appropriately labels the data set with descriptive variable names. ( change the column names)
#already done in step 2a
names(all_sub)

#-----------------------------------------------------------
#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
table(all_sub$activity)

table(all_sub$subject)
table(all_sub$activity,all_sub$subject)

tidyset<-all_sub%>%group_by(subject,activity)%>%summarize_all(mean)
head(tidyset)

write.table(tidyset, file = "tidyset.txt",row.names = F)

#checkdata<-read.table("./tidyset.txt",header = T)
