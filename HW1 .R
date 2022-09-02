# title: "Assignment 1"
# author: "Marco Hinojosa"
# date: '2022-08-24'

#Setup----
library(ISLR2)
library(dplyr)
library(gtsummary)

#Data ----
data("Auto")


#Problem 9 a-b----

# a) Which of the predictors are quantitative, and which are qualitative?
#   qualitative: name, origin
#   quantitative: mpg, cylinders, displacement, horsepower, weight, acceleration, year
#
# b) What is the range of each quantitative predictor? You can answer
#   this using the range() function.
head(Auto)
r_min <- Auto


r_min <- Auto %>%
  summarise(across(mpg:year, min))
r_max <- Auto %>%
  summarise(across(mpg:year, max))
Auto_ranges <- bind_rows(r_min, r_max) %>%
  mutate(range = c("minimum", "maximum"))
print(Auto_ranges)

#Problem 9 c----

# c) What is the mean and standard deviation of each quantitative predictor?

q9a <- Auto %>%
  dplyr::select(mpg:year) %>%
  tbl_summary(type=list(cylinders~"continuous"),
              statistic = list(all_continuous() ~ "{mean},{sd}"))
print(q9a)

Auto %>%
  dplyr::select(mpg:year) %>%
  tbl_summary(type=list(cylinders~"continuous"),
              statistic = list(all_continuous() ~ "{mean},{sd}"))

#Problem 9 d----

# d) Now remove the 10th through 85th observations. What is the
#   range, mean, and standard deviation of each predictor in the
#   subset of the data that remains?


#Problem 9 e----

# (e) Using the full data set, investigate the predictors graphically,
#   using scatterplots or other tools of your choice. Create some plots
#   highlighting the relationships among the predictors. Comment
#   on your findings.

#Problem 9 f----

# (f) Suppose that we wish to predict gas mileage (mpg) on the basis
#   of the other variables. Do your plots suggest that any of the
#   other variables might be useful in predicting mpg? Justify your
#   answer.


