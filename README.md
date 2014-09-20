Project_Getdata
===============

course project

The script is named "run_analysis.R".
It works as follows:

1.Merges the training and the test sets to create one data set.
1.1 Read "x_train.txt" into R.
1.2 Read "x_test.txt" into R.
1.3 Merge these two files's data into one datatable named "Dataset".
1.4 Read subsciber train file into R.
1.5 Read subsciber test file into R.
1.6 Merge these two file's data into one subscriber datatable named "Dataset_Sub".
1.7 Read action train file into R.
1.8 Read action test file into R.
1.9 Merge these two file's data into one subscrib datatable named "Dataset_Act".
1.10 Merge the three whole datatable into one completed datatable named "Dataset_Cal" for calculating.

2.Extracts only the measurements on the mean and standard deviation for each measurement.
2.1 Read varibles in featue file into R as a vector data named "Var".
2.2 Extract the measurements on the mean from "Dataset_Cal".
2.3 Extract the measurements on the standard deviation  (std) from "Dataset_Cal".
2.4 Merge the two dataset into one dataset named "Dataset_Cal_Pro"

3.Uses descriptive activity names to name the activities in the data set
3.1 Use a loop with activity id to select descriptive activity name.
3.2 Identify the id and name the activity in the data set.

4.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
4.1 Use a loop with activity id to select activity.
4.2 Use a loop with subscriber id to select subscriber.
4.3 Use a loop to select each mearument in the selected datatabel before.
4.4 Caculate mean of the mearument.
4.5 Write mean to the tidy data set 
4.5 Write the tidy data set to a txt file named "Project_Tidy_Dataset.txt".
