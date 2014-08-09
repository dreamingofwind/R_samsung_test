R_samsung_test

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

This script calculates the mean and standard deviation of X coordinates (spatial data) of 30 volunteers 
as they perform 6 different activities while wearing a Samsung S2 and outputs to output.txt.


The script first imports 3 files for a training set, and 3 files for a test set.
Since we are not concerned with training/test subjects, we merge the corresponding files from each set.

Files:
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The script then combines the subject, the activity with the X values in a dataframe (samsung_data)
To make the output more legible, we replace the activity with labels in the dataframe.

The mean and average of X is then calculated for each subject and each activity. Output is printed to output.txt.


