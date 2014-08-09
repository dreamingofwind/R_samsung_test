trainset=c("train/X_train.txt","train/y_train.txt","train/subject_train.txt")

testset=c("test/X_test.txt","test/y_test.txt","test/subject_test.txt")

dir="getdata-projectfiles-UCI HAR Dataset/"

x1 = read.csv(paste(dir,trainset[1],sep=""))
x2 = read.csv(paste(dir,testset[1],sep=""))
x<-unlist(c(x1,x2),use.names=FALSE)

y1 = read.csv(paste(dir,trainset[2],sep=""))
y2 = read.csv(paste(dir,testset[2],sep=""))
y<-unlist(c(y1,y2),use.names=FALSE)
y_labelled=factor(y,labels=c("1 WALKING","2 WALKING_UPSTAIRS","3 WALKING_DOWNSTAIRS","4 SITTING","5 STANDING","6 LAYING"))
y_labelled=as(y_labelled,"vector")

subjects1 = read.csv(paste(dir,trainset[3],sep=""))
subjects2 = read.csv(paste(dir,testset[3],sep=""))
subjects<-unlist(c(subjects1,subjects2),use.names=FALSE)

samsung_data=data.frame(cbind(subjects,x,y_labelled))
samsung_data$x=as(samsung_data$x,"integer")

mean_by_subject=aggregate(samsung_data$x,list(subject=samsung_data$subjects),mean)
sd_by_subject=aggregate(samsung_data$x,list(subject=samsung_data$subjects),sd)
print(mean_by_subject)
print(sd_by_subject)

mean_by_activity=aggregate(samsung_data$x,list(activity=samsung_data$y_labelled),mean)
sd_by_activity=aggregate(samsung_data$x,list(activity=samsung_data$y_labelled),sd)
print(mean_by_activity)
print(sd_by_activity)

all_means=aggregate(samsung_data$x,list(activity=samsung_data$y_labelled,subject=samsung_data$subjects),mean)
all_sds=aggregate(samsung_data$x,list(activity=samsung_data$y_labelled,subject=samsung_data$subjects),sd)
all = cbind(all_means,all_sds[3])
colnames(all) <- c("activity","subject number","mean of X", "standard dev of X")
print(all[order(all[1]),])

sink("output.csv",append=FALSE)
write.table(all[order(all[1]),],file="output.txt",append=FALSE,sep=",",row.names=FALSE)
sink()
