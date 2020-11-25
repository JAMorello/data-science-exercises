library(readr)
library(caret)
library(randomForest)

# Read the train and test data sets

cols <- cols(
  Survived = col_factor(),
  Pclass = col_factor(),
  Title = col_factor(),
  Sex = col_factor(),
  Age = col_integer(),
  Fare = col_double(),
  Cabin = col_factor(),
  Embarked = col_factor()
)

train <- read_csv("./data/final_train.csv", col_types=cols)
test <- read_csv("./data/final_test.csv", col_types=cols)

# Model building

set.seed(1993)
controlRF <- trainControl(method="cv", number=5, verboseIter=FALSE)
rf_model <- train(Survived ~ ., data=train, method="rf", trControl=controlRF)
rf_model$finalModel

# Save Model

saveRDS(rf_model, "./data/rf_model")

# Predictions with test

rf_prediction <- predict(rf_model, newdata=test)

# Submission to Kaggle

submission <- read_csv("./data/gender_submission.csv")
submission$Survived <- rf_prediction

write_csv(submission, "./data/submission.csv")


