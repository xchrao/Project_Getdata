## Merging Dataset
DatasetTrain_x<-read.table("f:/study/project/UCI HAR Dataset/train/x_train.txt")
DatasetTset_x<-read.table("f:/study/project/UCI HAR Dataset/test/x_test.txt")
Dataset_x<-rbind(DatasetTrain_x,DatasetTset_x)
DatasetTrain_Sub<-read.table("f:/study/project/UCI HAR Dataset/train/subject_train.txt")
DatasetTest_Sub<-read.table("f:/study/project/UCI HAR Dataset/test/subject_test.txt")
Dataset_Sub<-rbind(DatasetTrain_Sub,DatasetTest_Sub)
DatasetAct_Train<-read.table("f:/study/project/UCI HAR Dataset/train/y_train.txt")
DatasetAct_Test<-read.table("f:/study/project/UCI HAR Dataset/test/y_test.txt")
Dataset_Act<-rbind(DatasetAct_Train,DatasetAct_Test)
Dataset_tmp<-cbind(Dataset_Sub,Dataset_x)
Dataset_Cal<-cbind(Dataset_Act,Dataset_tmp)

## Extract the desire dataset
Var<-read.table("f:/study/project/UCI HAR Dataset/features.txt")
Var_mean<-agrep("mean",Var[,2])
Var_Std<-agrep("std",Var[,2])
Var_Cal_tmp<-c(Var_mean,Var_Std)
Var_Cal<-c(1,2,Var_Cal_tmp+2)
Dataset_Cal_Pro<-Dataset_Cal[Var_Cal]
C_Count<-Dataset_Cal_Pro

## Name activity
Ac<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
for(i in 1:nrow(Dataset_Cal_Pro)){
        for(j in 1:6){
                if(C_Count[i,1]==j){
                Dataset_Cal_Pro[i,1]=Ac[j]
                }
        }
}

## Create new tidy dataset
Para_Num=ncol(C_Count)
Mean_Data<-data.frame(nrow=180,ncol=Para_Num)
m=1
for(k in 1:6){
        for(l in 1:30){
                Means_tmp<-subset(Dataset_Cal_Pro,Dataset_Cal_Pro[,2]==l)
                Means<-subset(Means_tmp,Means_tmp[,1]==Ac[k])
                Mean_Data[m,1]<-Ac[k]
                Mean_Data[m,2]<-l
                J=Para_Num-2
                for(j in 1:J){
                        j=j+2
                        Mean_Data[m,j]<-mean(Means[,j])
                }
                m=m+1                 
        } 
}
write.table(Mean_Data,"Project_Tidy_Dataset.txt",row.name=FALSE,col.name=FALSE)
              
 


   
