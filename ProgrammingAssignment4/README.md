---
title: "README.md"
author: "Joan Figuerola Hurtado"
date: "20 August 2014"
---

# Getting and Cleaning Data: Course Project

## Introdution
This repository contains my work on the "Getting and Cleaning Data" course project. The README intends to describe each of the project files in the repository.

## File: "run_analysis.R"
This is the main script of the project. Before running the script, **you need** to make sure that:

* Your project path points to "/ProgrammingAssignment4"

This script contains all the steps that have been carried out to clean up the data. Firstly, it merges test and train data into one dataframe. Then, it extracts only the measurements on the mean and standard deviation for each measurement. Following that, it adds and cleans column names. Finally it creates an independent tidy data set with the average of each variable for each activity and each subject. 

## File: "CodeBook.md"
The Code book describes the variables, the data, and any transformations that have were carried out to clean up the data.

## Folder: "UCI HAR Dataset"
This folder contains the initial dataset called "UCI HAR Dataset" that was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>