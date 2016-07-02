# load data
original <- read.csv("C:/Users/EGGS/Desktop/titanic_original.csv")

# load libraries
library(dplyr)
library(tidyr)

# view data set
View(original)

# replace values in port of embarkation
titanic_clean <- original %>% 
  mutate(embarked = ifelse(embarked == "", "S", as.character(embarked))) %>%

# calculate the mean age and replace values
  replace_na(original, replace = list(age = 0)) %>%
  mutate(age = ifelse(age == 0, mean(age), age)) %>%

# replace missing boat values
  mutate(boat = ifelse(boat == "", NA, as.character(boat))) %>%

# create and replace cabin column
  mutate(has_cabin_number = ifelse(cabin == "", 0, 1))

# write file
write.csv(titanic_clean, file = "titanic_clean.csv")