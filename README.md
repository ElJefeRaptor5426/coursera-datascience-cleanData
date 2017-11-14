# coursera-datascience-cleanData

Steps to run:
- Set working dir to this directory
- Source run_analysis.R

The run_analysis.R script will grab the appropriate data from the UCI HAR dataset directory.  It will then combine the test and train dataset into one dataframe, extract the mean and std columns and store them in a dataset variable.  Finally it will average the values for subject and activity into another dataframe, avgSet.
