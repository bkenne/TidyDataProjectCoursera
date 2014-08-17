### INTRODUCTION
The Human Activity Recognition database used to derive these data for this project were built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.  The goal of this project is to extract, translate, and load these data using an R script -- run_analysis.R.  This new data set specifically targets only the measurements on the mean and standard deviation for each measurement in the original test and train datasets.  The intention of the new data set is to provide the mean for each subject and activity for every targeted variable combination. 

### METHOD
The run_analysis.R script imports the data using two basic approaches.  Recognizing that the input data for x_test and x_train were field formated, the R command read.fwf was applied with a vector that listed the field widths to be deliniated (16 characters in 561 fields).  Four other datasets were loaded using the R command read.csv -- y_test, subject_test, y_train, subject_train.  The script performs multiple transformations by dropping unnessary fields, and appending columns and rows.  The script also drops datasets throughout the process so as to maximize system resources. The final series of transformations are targets at averaging the variables for both the subject and activity.  This processes applied the R package RESHAPE2 and its "melt" and "dcast" commands.  Finally, the script renames the original fields names for variable observations by adding the prefix phrase "average_of_" and then extracting the resulting table to the local drive (and into this repository) -- SubjectActivitiesAverages.txt.

###SOURCE INFORMATION
All derivitives of the data included in this project were derived from the data located at the following URL:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The authors of these data are:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012