---
title: "CodeBook.md"
author: "Joe Fuqua"
date: "Tuesday, June 16, 2015"
output: html_document
---

# Script Logic Description

the script run_analysis.R performs the following activities:

1. load and merge training and test data by: Subject, Activity, Measurement(s)
2. select only means and standard deviations
3. add descriptive variable and activity labels
4. create a tidy dataset with average measurements by Subject and Activity
5. write the tidy dataset to a file ("tidy_data.txt")

# Assumption

The UCI HAR Dataset directory is in the working directory

# Variables and Transformations

datadir:  directory name for the directory containing the data

meas_train: data table containing measurements from training data
activ_train: data table containing activity identifiers from training data
subject_train: data table containing subject identifiers from training data

meas_test: data table containing measurements from test data
activ_test: data table containing activity identifiers from test data
subject_test: data table containing subject identifiers from test data

meas_data: merged training and test measurement data
activ_data: merged training and test activity data
subject_data: merged training and test subject data

merged_data: merged subject, activity, and measurement data

features: feature (measurement) lables from "features.txt""
activities: activity lables from "activity_labels.txt""
columns: descriptive column names for merged_data

data_subset:  a subset of merged_data containing just means and std. devs.

tidy_data: average measurements of data_subset, by Subject and Activity

