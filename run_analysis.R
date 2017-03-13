setwd("C://Users/etsaf/OneDrive/zzzCoursera/courseraWorkingDirectories/gettingCleaningDataFinalProject")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
#Creating training dataframe
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE)
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE)
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE)
total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE)
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE)
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header=FALSE)
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE)
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE)
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
train <- data.frame(subject_train, y_train, 
                    body_acc_x_train, body_acc_y_train, body_acc_z_train,
                    total_acc_x_train, total_acc_y_train, total_acc_z_train,
                    body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
                    X_train)
#Creating test dataframe
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE)
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header=FALSE)
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header=FALSE)
total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE)
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header=FALSE)
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header=FALSE)
body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE)
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header=FALSE)
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header=FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
test <- data.frame(subject_test, y_test, 
                    body_acc_x_test, body_acc_y_test, body_acc_z_test,
                    total_acc_x_test, total_acc_y_test, total_acc_z_test,
                    body_gyro_x_test, body_gyro_y_test, body_gyro_z_test,
                    X_test)
#Using rbind() to join the training and test datasets
data <- rbind(train, test)
#Naming our variables
names(data)[1] <- "subject_id"
names(data)[2] <- "activity"
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
featuresChar <- as.character(features[, 2])
names(data)[1155:1715] <- featuresChar
#Making descriptive labels for activities variable
data$activity <- factor(data$activity,
                    levels = c(1,2,3, 4, 5, 6),
                    labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                               "SITTING", "STANDING", "LAYING")
                    )
#Creating a character vector containing variable names for Total Acceleration
#Note: this assignment asks us to eliminate these variables. There is no harm
#in creating them here, though, in case they're needed in a different assignment.
tot_acc <- character(length = 384)
integers <- c(1:128, 1:128, 1:128)
tot_acc[1:128] <- "tot_acc_x"
for(i in 1:128){tot_acc[i] <- paste(tot_acc[i], integers[i], sep = ".")}
tot_acc[129:256] <- "tot_acc_y"
for(i in 129:256){tot_acc[i] <- paste(tot_acc[i], integers[i], sep = ".")}
tot_acc[257:384] <- "tot_acc_z"
for(i in 257:384){tot_acc[i] <- paste(tot_acc[i], integers[i], sep = ".")}
#Creating a character vector containing variable names for Body Acceleration
body_acc <- character(length = 384)
integers <- c(1:128, 1:128, 1:128)
body_acc[1:128] <- "body_acc_x"
for(i in 1:128){body_acc[i] <- paste(body_acc[i], integers[i], sep = ".")}
body_acc[129:256] <- "body_acc_y"
for(i in 129:256){body_acc[i] <- paste(body_acc[i], integers[i], sep = ".")}
body_acc[257:384] <- "body_acc_z"
for(i in 257:384){body_acc[i] <- paste(body_acc[i], integers[i], sep = ".")}
#Creating a character vector containing variable names for Angular Velocity (Gyroscope)
gyro <- character(length = 384)
integers <- c(1:128, 1:128, 1:128)
gyro[1:128] <- "gyro_x"
for(i in 1:128){gyro[i] <- paste(gyro[i], integers[i], sep = ".")}
gyro[129:256] <- "gyro_y"
for(i in 129:256){gyro[i] <- paste(gyro[i], integers[i], sep = ".")}
gyro[257:384] <- "gyro_z"
for(i in 257:384){gyro[i] <- paste(gyro[i], integers[i], sep = ".")}
#Assigning the tot_acc, body_acc and gyro vectors as variables names
names(data)[3:386] <- tot_acc
names(data)[387:770] <- body_acc
names(data)[771:1154] <- gyro
#Identifying the variable names containing the words "mean" or "std" using grep()
i <- grep("mean", names(data))
j <- grep("std", names(data))
#Extracting only the variables containing the words "mean" or "std", and of course
#we also need to keep the subject_id and activity variables as well
data <- data[, c(1, 2, i, j)]

