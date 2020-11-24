library(tibble)
library(readr)
library(dplyr)
library(tidyr)
library(stringr)

#####################################################################
# This project uses the test.csv and train.csv data set from the 
# Titanic challenge of Kaggle
#
# Below are the features provided in the data set.
#
# Passenger Id: ID given to each traveler on the Titanic
# Survived: if the person survived or not to the catastrophe
# Pclass: Passenger class. 1 = First Class, 2 = Second Class, 3 = Third Class
# Name: The Name of the passenger
# Sex
# Age
# SibSp: number of siblings and spouses traveling with the passenger
# Parch: number of parents and children traveling with the passenger
# Ticket: The ticket number
# Fare: Ticket fare/price
# Cabin:  Cabin number
# Embarked: Possible ports from which the people embark to the Titanic
#####################################################################

# Load the csv file to a tibble data frame 

cols <- cols(
  PassengerId = col_integer(),
  Survived = col_factor(),
  Pclass = col_factor(),
  Name = col_character(),
  Sex = col_factor(),
  Age = col_integer(),
  SibSp = col_integer(),
  Parch = col_integer(),
  Ticket = col_character(),
  Fare = col_double(),
  Cabin = col_character(),
  Embarked = col_character()
)

train <- read_csv("./data/train.csv", col_types=cols)

# Rename values in "Embarked" column

train <- mutate(train, Embarked=replace(Embarked, Embarked=="S", "Southampton"))
train <- mutate(train, Embarked=replace(Embarked, Embarked=="C", "Cherbourg"))
train <- mutate(train, Embarked=replace(Embarked, Embarked=="Q", "Queenstown"))

# There are two missing values in 'Embarked' column.
# We're going to put there the most common value

train <- mutate(train, Embarked=replace_na(train$Embarked, "Southampton"))

# And then make the 'Embarked' column a factor data type

levels <- sort(unique(train$Embarked))
train$Embarked <- parse_factor(train$Embarked, levels=levels)

# Add new column with the "Title" of each person in the data 
# (extracted from their "Name" variable)

titles <- str_extract(train$Name, pattern="([A-Za-z]+)\\.")
train <- train %>% add_column("Title"=titles, .before="Name") # Needs 'tibble' package loade for some reason

train <- mutate(train, Title=replace(Title, str_detect(Title, "Major|Col|Capt"), "Officer"))
train <- mutate(train, Title=replace(Title, str_detect(Title, "Lady|Sir|Countess|Jonkheer"), "Royalty"))
train <- mutate(train, Title=replace(Title, str_detect(Title, "Mlle|Ms|Miss|Dona"), "Miss"))
train <- mutate(train, Title=replace(Title, Title=="Mme.", "Mrs."))
train <- mutate(train, Title=replace(Title, Title=="Don.", "Mr."))
train <- mutate(train, Title=replace(Title, Title=="Rev.", "Reverend"))
train <- mutate(train, Title=replace(Title, Title=="Dr.", "Doctor"))
train <- mutate(train, Title=replace(Title, Title=="Master.", "Master"))

# And then make the 'Embarked' column as a factor data type

levels <- c("Royalty", "Reverend", "Doctor", "Officer",
            "Miss", "Mrs.", "Master", "Mr.")
train$Title <- parse_factor(train$Title, levels=levels)

# In the "Cabin" column, the first letter of the value indicates the deck where 
# the passenger's cabin is located.
# We're going to mutate the column as to it has only the deck letter

train <- mutate(train, Cabin = str_extract(train$Cabin, pattern="([A-Za-z])"))
train <- mutate(train, Cabin=replace_na(train$Cabin, "Unknown"))

# And then make the 'Cabin' column a factor data type

levels <- sort(unique(train$Cabin))
train$Cabin <- parse_factor(train$Cabin, levels=levels)

# If there are missing values in the Age column, We'll create a list
# that contains random numbers, which are computed based 
# on the mean and standard deviation of Age

mean <- mean(train$Age, na.rm=TRUE)
sd <- sd(train$Age, na.rm=TRUE)
na <- sum(is.na(train$Age))

rand_age = round(runif(na, mean-sd, mean+sd))
train[is.na(train$Age), "Age"] <- rand_age

# If there are missing values in the Fare column, we'll do something similar

mean <- mean(train$Fare, na.rm=TRUE)
sd <- sd(train$Fare, na.rm=TRUE)
na <- sum(is.na(train$Fare))

rand_fare = round(runif(na, mean-sd, mean+sd))
train[is.na(train$Fare), "Fare"] <- rand_fare

# There are a couple of columns/variables that aren't of our interest
# We're going to drop them

train <- select(train, -c("PassengerId", "Name", "SibSp", "Parch", "Ticket"))

# The last thing to do is to save the data frame in a csv file to use it on a
# machine learning model

write_csv(train, "./data/final_train.csv")