title: "Assignment 1"
author: "Marco Hinojosa"
date: '2022-08-24'

#Setup----
library(ISLR2)
library(dplyr)
library(gtsummary)

#Data ----
data("Auto")


#Problem 9 a-b----

# a) Which of the predictors are quantitative, and which are qualitative?
#   qualitative: name
#   quantitative: mpg, cylinders, displacement, horsepower, weight, acceleration, year, and origin
#
# b) What is the range of each quantitative predictor? You can answer
#   this using the range() function.

r_min <- Auto %>%
  select(!c(name, origin)) %>%
  summarise_each(min)
r_max <- Auto %>%
  select(!c(name, origin)) %>%
  summarise_each(max)
Auto_ranges <- bind_rows(r_min, r_max)
View(Auto_ranges)

#Problem 9 c----

# c) What is the mean and standard deviation of each quantitative predictor?

q9a <- Auto %>%
  select(mpg:year) %>%
  tbl_summary(type=list(cylinders~"continuous"), statistic = list(all_continuous() ~ "{mean},{sd}"))
print(q9a)

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


