==================================================================
Human Activity Recognition Using Smartphones Tidy Dataset
==================================================================
Eric Thompson
Created 3/12/2017
Coursera's Getting and Cleaning Data - Final Project
==================================================================

This dataset was created by tidying up the data from UCI Machine Learning's Human Activity Recognition Using Smartphones Data Set.

We created training and test dataframes by taking UCI's original .txt files applying the data.frame() function.

Next we merged the training and test datasets using rbind(), to create a larger, full dataset.

We convert the actvity codes (1:6) into their six descriptive labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING).

Our assignment is to include only mean and standard deviation variables.  So we eliminate any variables that do not contain the words "mean" or "std" in them.  

Finally, we use the aggregate() function to create a second, independent tidy data set containing the average of each variable for each activity and each subject.

For each subject and activity the dataset provides:
======================================
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- The average of any feature vector variables containing the strings "mean" or std"

The dataset includes the following files:
=========================================

- 'README.txt'

- 'run_analysis.R': Script for tidying up the data.

- A code book

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
