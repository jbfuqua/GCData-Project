# GCData-Project
Get/Clean Data Course Project


# Purpose

This repo contains an R script that processes biometric data from a wearable computing device, merging test and training data,
then selecting only mean() and stdev() values for each measurement.  The final task is to create and write a tidy dataset that 
summarizes each measurement from the merged set by Subject and Activity.

# Data Files

Source data - UCI Human Activity Recognition Database

project URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
data URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Script

The script, run_analysis.R, assumes the source data directory is in the working directory (unzipped).

The output is a file titled 'tidy_data.txt'

# Other Information

In the 'UCI HAR Dataset' directory:

README.txt: Describes the contents of the directory and subdirectories

features_info.txt: describes the variable data

activity_labels.txt: provides descriptive labels for the activities measured
