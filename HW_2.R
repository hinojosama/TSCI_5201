title: "Assignment 2"
author: "Marco Hinojosa"
date: '2022-09-01'

#Setup----
library(faraway)

#Data ----
data("pima")


# was originally imputed with mean for full range of triceps however as many zero
#values, used in data set as na's, we change it as below to select the complent set
# of non-zero values rather than this:
#pima$triceps[0==pima$triceps] <- mean(pima$triceps,na.rm=TRUE)

pima$triceps[0==pima$triceps] <- mean(pima$triceps[!0==pima$triceps] ,na.rm=TRUE)
pima$diastolic[0==pima$diastolic] <- mean(pima$diastolic,na.rm=TRUE)
pima$bmi[0==pima$bmi] <- mean(pima$bmi,na.rm=TRUE)

#Problem 1----
