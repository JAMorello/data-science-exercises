# Data science exercises

![Banner](data/banner003.jpg)

Table of Contents
=================

  * [Projects](#projects)
    * [Dog Breed Detector](#dog-breed-detector) :exclamation: Lastest project!
    * [Bulldozer Price Prediction](#bulldozer-price-prediction)
    * [Heart Disease Prediction](#heart-disease-prediction)
    * [Titanic](#titanic)
  * [Resources I am going through](#resources-i-am-going-through)
    * [Courses](#courses)
    * [Videos](#videos)
    * [Books](#books)


## Projects

### [Dog Breed Detector](https://github.com/JAMorello/data-science-exercises/blob/master/Deep%20Learning/dog-breed-identification/dog_breed_detection.ipynb)

  **[Unstructured data]** **[Multiple Categories Problem]** **[Last update: 24/06/20]**
  
  In this project I'll use deep neural networks to create a classifier capable of identifying the breed of a dog given a photo of a dog. I use data from the [Kaggle dog breed identification competition](https://www.kaggle.com/c/dog-breed-identification/overview), in which the submissions are evaluated on _Multi Class Log Loss_ between the predicted probability and the observed target. The model used, [mobilenet_v2_130_224](https://tfhub.dev/google/imagenet/mobilenet_v2_130_224/classification/4) reached a _Log Loss_ of ≈0.97 when submitting the test dataset predictions to _Late Submission_. I went through:
  
    - Preprocessing Images (turning them into Tensors)
    - Creating data batches
    - Creating, training, and evaluating a model
    - Making predictions on test dataset and custom images
  
_Note: There is still work to do in this project_
  
### [Bulldozer Price Prediction](https://github.com/JAMorello/data-science-exercises/blob/master/Machine%20Learning/bulldozer-price-prediction-project/bulldozer-price-prediction-project.ipynb)

  **[Structured data]** **[Regression Problem]** **[Last update: 19/06/20]**
  
  Using data from an old [Kaggle competition](https://www.kaggle.com/c/bluebook-for-bulldozers/data), I try to predict the future sale price of a bulldozer, given its characteristics and previous examples of how much similar bulldozers have been sold for. The evaluation metric used was the RMSLE (root mean squared log error) between the actual and predicted auction prices. I went through:
  
    - Preprocessing of data / Feature Engineering
    - Building a Random Forest Regressor model
    - Hyerparameter tuning with RandomizedSearchCV
    - Feature Importance, followed by exploratory data analysis
    
_Note: went through some problems with the RMSLE formula_


### [Heart Disease Prediction](https://github.com/JAMorello/data-science-exercises/blob/master/Machine%20Learning/heart_disease_project/heart_disease_ml.ipynb)

  **[Structured data]** **[Classification Problem]** **[Last update: 16/06/20]**

  Using data from UCI Machine Learning Repository, we try to we predict wheter or not a patient could have heart disease given his/her clinical parameters. The model, a Random Forest Classifier, reached an accuracy, precision, recall, and F1 score of ≈80%. I went through:
  
    - Exploratory data analysis (EDA)
    - Model training (Logistic Regression, KNeighborsClassifier, RandomForestClassifier)
    - Model evaluation (ROC curve and AUC score, Confusion matrix, Classification report)
    - Model comparison
    - Model fine-tuning (with RandomizedSearchCV and GridSearchCV)
    - Cross-validation
    - Feature importance


### [Titanic](https://github.com/JAMorello/data-science-exercises/blob/master/Machine%20Learning/Titanic/Titanic%2C%20ML%20from%20disaster.ipynb)

  **[Structured data]** **[Classification Problem]** **[Last update: 10/05/20]**
  
  This is a competition in Kaggle, the first challenge for newcommers to dive into ML competitions and familiarize 
  themselves with how the platform works. The competition is simple: use machine learning to create a model that predicts 
  which passengers survived the Titanic shipwreck. Link to the competition overview: [here](https://www.kaggle.com/c/titanic).
  Here I use Pandas, Seaborn, y scikit-learn. This project consisted of:
  
    - visual analysis of data
    - feature engineering
    - initializing and training of various prediction models (highest prob.: 0.830527, Support Vector Machine)
    - hyperparameter tuning using grid search (highest prob: 0.833895, Random Forest Classifier)
    - outputing and submiting predictions to Kaggle platform (score: 0.78947)

## Resources I am going through
Legend: :ballot_box_with_check: Currently doing :white_check_mark: Finished

### Courses

* :white_check_mark: [Complete Python Developer in 2020: Zero to Mastery](https://www.udemy.com/course/complete-python-developer-zero-to-mastery/)
* :white_check_mark: [Complete Machine Learning and Data Science: Zero to Mastery](https://www.udemy.com/course/complete-machine-learning-and-data-science-zero-to-mastery/)
* [Statistics 110: Probability](https://www.edx.org/course/introduction-to-probability)
* [Fundamentals of Statistics](https://www.edx.org/course/fundamentals-of-statistics)

### Videos

* :ballot_box_with_check: [Crash Course Statistics](https://www.youtube.com/watch?v=zouPoc49xbk&list=PL8dPuuaLjXtNM_Y-bUAhblSAdWRnmBUcr)
* [MIT RES.6-012 Introduction to Probability, Spring 201](https://www.youtube.com/watch?v=1uW3qMFA9Ho&list=PLUl4u3cNGP60hI9ATjSFgLZpbNJ7myAg6)

### Books

* :ballot_box_with_check: McKinney, W. (2017). _Python for Data Analysis_
* Myatt, G. J. & Johnson, W. P. (2014). _Making sense of data I, A practical Guide to Exploratory Data Analysis and Data Mining_
* Myatt, G. J. & Johnson, W. P. (2009). _Making sense of data II, A practical guide to data visualization, advanced data mining methods, and applications_
* Müller, A. C. & Guido S. (2016). _Introduction to Machine Learning with Python_
* Géron, A. (2019). _Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow_

