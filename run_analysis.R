## COURSE PROJECT
## GETTING AND CLEANING DATA

## This application is designed to load data from UCI Machine Learning Repository to create a clean and tidy 
## data set.

##Set local workspace (i.e. location of input datasets)
setwd("/Users/i63157appa/Documents/Coursera/GettingCleaningData/Project")

##Generate vector of fixed width fields for import of data files.
  width <- NULL
  for (i in 1:561){
    width <- c(width, 16)
  }

##Remove fields list
RemoveList <- c(7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,47,48,
                49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,87,88,89,90,91,92,93,94,95,
                96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,127,128,129,130,131,132,133,
                134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,167,168,169,170,
                171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,203,
                204,205,206,207,208,209,210,211,212,213,216,217,218,219,220,221,222,223,224,225,226,229,230,231,232,233,234,235,236,237,238,
                239,242,243,244,245,246,247,248,249,250,251,252,255,256,257,258,259,260,261,262,263,264,265,272,273,274,275,276,277,278,279,
                280,281,282,283,284,285,286,287,288,289,290,291,292,293,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,
                314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344, 
                351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,376,377,378,379,380,381,382,383,384,
                385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,
                416,417,418,419,420,421,422,423,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,455,
                456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,
                487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,505,506,507,508,509,510,511,512,514,515,518,519,520,521,522,
                523,524,525,527,528,531,532,533,534,535,536,537,538,540,541,544,545,546,547,548,549,550,551,553,554)


##Load in X_Test set using the Fixed Width read option.
  ##x_test<-read.fwf("X_test.txt", width = width, header=FALSE, n=1000)
  x_test<-read.fwf("X_test.txt", width = width, header=FALSE)

##Use RemoveList to drop unneeded fields in x_test
for(i in RemoveList){
  x_test[paste("V",i,sep="")]<-NULL
}

##Load in Y_Test and subject_test sets using the csv read option.
  ##y_test <- read.csv("Y_test.txt", header=FALSE, nrows=1000)
  ##subject_test <- read.csv("subject_test.txt", header=FALSE, nrows=1000)
  y_test <- read.csv("Y_test.txt", header=FALSE)
  subject_test <- read.csv("subject_test.txt", header=FALSE)

## Combine Test Datasets using cbind
  x_test <- cbind(subject_test,y_test,x_test)

##Load in X_Training set using the Fixed Width read option.
  ##x_train<-read.fwf("X_train.txt", width = width, header=FALSE, n=1000)
  x_train<-read.fwf("X_train.txt", width = width, header=FALSE)

##Use RemoveList to drop unneeded fields in x_train
for(i in RemoveList){
  x_train[paste("V",i,sep="")]<-NULL
}

##Load in Y_train and subject_train sets using the csv read option.
  ##y_train <- read.csv("Y_train.txt", header=FALSE, nrows=1000)
  ##subject_train <- read.csv("subject_train.txt", header=FALSE, nrows=1000)
  y_train <- read.csv("Y_train.txt", header=FALSE)
  subject_train <- read.csv("subject_train.txt", header=FALSE)

## Combine Test Datasets using cbind
  x_train <- cbind(subject_train,y_train,x_train)

##Combine Test and Train Datasets using rbind
  x_combine <- rbind(x_test, x_train)

##Remove unneeded datasets
  x_test <- NULL
  x_train <- NULL
  y_test <- NULL
  y_train <- NULL
  subject_test <- NULL
  subject_train <- NULL

##New Descriptive Field Names
  NewFieldNames <- c("subject","activity","tBodyAcc_meanX","tBodyAcc_meanY","tBodyAcc_meanZ","tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z","tGravityAcc_mean_X","tGravityAcc_mean_Y",
                     "tGravityAcc_mean_Z","tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z","tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z",
                     "tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z","tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z","tBodyGyro_std_X",
                     "tBodyGyro_std_Y","tBodyGyro_std_Z","tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z","tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y",
                     "tBodyGyroJerk_std_Z","tBodyAccMag_mean","tBodyAccMag_std","tGravityAccMag_mean","tGravityAccMag_std","tBodyAccJerkMag_mean","tBodyAccJerkMag_std",
                     "tBodyGyroMag_mean","tBodyGyroMag_std","tBodyGyroJerkMag_mean","tBodyGyroJerkMag_std","fBodyAcc_mean_X","fBodyAcc_mean_Y","fBodyAcc_mean_Z",
                     "fBodyAcc_std_X","fBodyAcc_std_Y","fBodyAcc_std_Z","fBodyAcc_meanFreq_X","fBodyAcc_meanFreq_Y","fBodyAcc_meanFreq_Z","fBodyAccJerk_mean_X",
                     "fBodyAccJerk_mean_Y","fBodyAccJerk_mean_Z","fBodyAccJerk_std_X","fBodyAccJerk_std_Y","fBodyAccJerk_std_Z","fBodyAccJerk_meanFreq_X",
                     "fBodyAccJerk_meanFreq_Y","fBodyAccJerk_meanFreq_Z","fBodyGyro_mean_X","fBodyGyro_mean_Y","fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y",
                     "fBodyGyro_std_Z","fBodyGyro_meanFreq_X","fBodyGyro_meanFreq_Y","fBodyGyro_meanFreq_Z","fBodyAccMag_mean","fBodyAccMag_std","fBodyAccMag_meanFreq",
                     "fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std","fBodyBodyAccJerkMag_meanFreq","fBodyBodyGyroMag_mean","fBodyBodyGyroMag_std",
                     "fBodyBodyGyroMag_meanFreq","fBodyBodyGyroJerkMag_mean","fBodyBodyGyroJerkMag_std","fBodyBodyGyroJerkMag_meanFreq","angle_tBodyAccMean_gravity",
                     "angle_tBodyAccJerkMean_gravityMean","angle_tBodyGyroMean_gravityMean","angle_tBodyGyroJerkMean_gravityMean","angle_X_gravityMean",
                     "angle_Y_gravityMean","angle_Z_gravityMean")

##Replace names in new dataset
  for(fld in 1:88){
    names(x_combine)[fld] <- NewFieldNames[fld]  
  }

##WORK FOR EXTRACTING OUT AVERAGES

  library(reshape2) ##Load in a reqired library

  ##id and var fields
  id <- c("subject","activity")
  varfields <- c("tBodyAcc_meanX","tBodyAcc_meanY","tBodyAcc_meanZ","tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z","tGravityAcc_mean_X","tGravityAcc_mean_Y",
                 "tGravityAcc_mean_Z","tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z","tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z",
                 "tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z","tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z","tBodyGyro_std_X",
                 "tBodyGyro_std_Y","tBodyGyro_std_Z","tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z","tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y",
                 "tBodyGyroJerk_std_Z","tBodyAccMag_mean","tBodyAccMag_std","tGravityAccMag_mean","tGravityAccMag_std","tBodyAccJerkMag_mean","tBodyAccJerkMag_std",
                 "tBodyGyroMag_mean","tBodyGyroMag_std","tBodyGyroJerkMag_mean","tBodyGyroJerkMag_std","fBodyAcc_mean_X","fBodyAcc_mean_Y","fBodyAcc_mean_Z",
                 "fBodyAcc_std_X","fBodyAcc_std_Y","fBodyAcc_std_Z","fBodyAcc_meanFreq_X","fBodyAcc_meanFreq_Y","fBodyAcc_meanFreq_Z","fBodyAccJerk_mean_X",
                 "fBodyAccJerk_mean_Y","fBodyAccJerk_mean_Z","fBodyAccJerk_std_X","fBodyAccJerk_std_Y","fBodyAccJerk_std_Z","fBodyAccJerk_meanFreq_X",
                 "fBodyAccJerk_meanFreq_Y","fBodyAccJerk_meanFreq_Z","fBodyGyro_mean_X","fBodyGyro_mean_Y","fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y",
                 "fBodyGyro_std_Z","fBodyGyro_meanFreq_X","fBodyGyro_meanFreq_Y","fBodyGyro_meanFreq_Z","fBodyAccMag_mean","fBodyAccMag_std","fBodyAccMag_meanFreq",
                 "fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std","fBodyBodyAccJerkMag_meanFreq","fBodyBodyGyroMag_mean","fBodyBodyGyroMag_std",
                 "fBodyBodyGyroMag_meanFreq","fBodyBodyGyroJerkMag_mean","fBodyBodyGyroJerkMag_std","fBodyBodyGyroJerkMag_meanFreq","angle_tBodyAccMean_gravity",
                 "angle_tBodyAccJerkMean_gravityMean","angle_tBodyGyroMean_gravityMean","angle_tBodyGyroJerkMean_gravityMean","angle_X_gravityMean",
                 "angle_Y_gravityMean","angle_Z_gravityMean")

  ##Use melt function to create tidy narrow list using the id and varfields vectors
    x_combine_melt<-melt(x_combine,id=id,measure.vars=varfields)

  ##Drop x_combine - not required any longer
    x_combine <- NULL

  ##Add a field and fill with a concat of subject and activity
    x_combine_melt$subject_activity <- paste(x_combine_melt$subject,x_combine_melt$activity,sep="-")

  ##Generate a average(mean) of each variable by subject and activity
    x_combine_dcast <- dcast(x_combine_melt, subject_activity ~ variable, mean)

  ##Drop x_combine_melt - not required any longer
    x_combine_melt <- NULL

  ##Rename fields a final time
    FinalFieldNames <- c("subject_activity","average_of_tBodyAcc_meanX","average_of_tBodyAcc_meanY","average_of_tBodyAcc_meanZ","average_of_tBodyAcc_std_X",
                             "average_of_tBodyAcc_std_Y","average_of_tBodyAcc_std_Z",  "tGravityAcc_mean_X","average_of_tGravityAcc_mean_Y","average_of_tGravityAcc_mean_Z",
                             "average_of_tGravityAcc_std_X","average_of_tGravityAcc_std_Y","average_of_tGravityAcc_std_Z","average_of_tBodyAccJerk_mean_X",
                             "average_of_tBodyAccJerk_mean_Y","average_of_tBodyAccJerk_mean_Z","average_of_tBodyAccJerk_std_X","average_of_tBodyAccJerk_std_Y",
                             "average_of_tBodyAccJerk_std_Z","average_of_tBodyGyro_mean_X","average_of_tBodyGyro_mean_Y","average_of_tBodyGyro_mean_Z","average_of_tBodyGyro_std_X",
                             "average_of_tBodyGyro_std_Y","average_of_tBodyGyro_std_Z","average_of_tBodyGyroJerk_mean_X","average_of_tBodyGyroJerk_mean_Y",
                             "average_of_tBodyGyroJerk_mean_Z","average_of_tBodyGyroJerk_std_X","average_of_tBodyGyroJerk_std_Y","average_of_tBodyGyroJerk_std_Z",
                             "average_of_tBodyAccMag_mean","average_of_tBodyAccMag_std","average_of_tGravityAccMag_mean","average_of_tGravityAccMag_std","average_of_tBodyAccJerkMag_mean",
                             "average_of_tBodyAccJerkMag_std","average_of_tBodyGyroMag_mean", "average_of_tBodyGyroMag_std","average_of_tBodyGyroJerkMag_mean",
                             "average_of_tBodyGyroJerkMag_std","average_of_fBodyAcc_mean_X","average_of_fBodyAcc_mean_Y","average_of_fBodyAcc_mean_Z","average_of_fBodyAcc_std_X",
                             "average_of_fBodyAcc_std_Y","average_of_fBodyAcc_std_Z","average_of_fBodyAcc_meanFreq_X","average_of_fBodyAcc_meanFreq_Y","average_of_fBodyAcc_meanFreq_Z",
                             "average_of_fBodyAccJerk_mean_X","average_of_fBodyAccJerk_mean_Y","average_of_fBodyAccJerk_mean_Z","average_of_fBodyAccJerk_std_X",
                             "average_of_fBodyAccJerk_std_Y","average_of_fBodyAccJerk_std_Z","average_of_fBodyAccJerk_meanFreq_X","average_of_fBodyAccJerk_meanFreq_Y",
                             "average_of_fBodyAccJerk_meanFreq_Z","average_of_fBodyGyro_mean_X","average_of_fBodyGyro_mean_Y","average_of_fBodyGyro_mean_Z","average_of_fBodyGyro_std_X",
                             "average_of_fBodyGyro_std_Y","average_of_fBodyGyro_std_Z","average_of_fBodyGyro_meanFreq_X","average_of_fBodyGyro_meanFreq_Y","average_of_fBodyGyro_meanFreq_Z",
                             "average_of_fBodyAccMag_mean","average_of_fBodyAccMag_std","average_of_fBodyAccMag_meanFreq","average_of_fBodyBodyAccJerkMag_mean",
                             "average_of_fBodyBodyAccJerkMag_std","average_of_fBodyBodyAccJerkMag_meanFreq","average_of_fBodyBodyGyroMag_mean","average_of_fBodyBodyGyroMag_std",
                             "average_of_fBodyBodyGyroMag_meanFreq","average_of_fBodyBodyGyroJerkMag_mean","average_of_fBodyBodyGyroJerkMag_std","average_of_fBodyBodyGyroJerkMag_meanFreq",
                             "average_of_angle_tBodyAccMean_gravity","average_of_angle_tBodyAccJerkMean_gravityMean","average_of_angle_tBodyGyroMean_gravityMean",
                             "average_of_angle_tBodyGyroJerkMean_gravityMean","average_of_angle_X_gravityMean","average_of_angle_Y_gravityMean","average_of_angle_Z_gravityMean")

  ##Replace names in new dcast dataset
    for(fld in 1:87){
      names(x_combine_dcast)[fld] <- FinalFieldNames[fld]  
    }
  ##write out final set using write.table
    write.table(x_combine_dcast,file="SubjectActivityAverages.txt",row.names=FALSE)


  
