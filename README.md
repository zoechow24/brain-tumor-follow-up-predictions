# An Ensemble Model: Follow-up Prediction for Brain Tumor Patients
**Course:** _DA5030 - Introduction to Machine Learning & Data Mining_

## Overview
This project builds an ensemble model combining random forests, logistic regression, and kNN to predict whether brain tumor patients require follow-up treatment, based on tumor characteristics and clinical information. 

## Data
The [Brain Tumor Dataset](https://www.kaggle.com/datasets/miadul/brain-tumor-dataset) from Kaggle was used for this project. However, to make the dataset a bit more complicated, I randomly removed 8% of the data from the `Tumor_Size`, `Symptom_3`, and `Survival_Rate` columns. I saved the modified dataset to a dropbox which could be accessed with its [URL](https://www.dropbox.com/scl/fi/572e36q3iqjjctw1bizt7/brain_tumor_dataset_with_missing.csv?rlkey=qmijtmzuoremdr8p0x4a4chhw&st=2urw3h8v&dl=1).
The modified dataset and the R file to randomly remove data from the original dataset was also uploaded to this repository in the `data` directory:
* `RemoveData_BrainTumor.R`
* `brain_tumor_dataset_with_missing.csv`

## Deliverables
* `Brain_Tumor_FU_Pred.Rmd` - R Notebook
* [`Brain_Tumor_FU_Pred.html`](https://zoechow24.github.io/brain-tumor-follow-up-predictions/Brain_Tumor_FU_Pred.html) - knitted HTML report


## Tools & Skills
### Languages & Environment: 
* R
* RStudio

### Dependencies:
This project uses the following packages:
* psych
* dplyr
* ggplot2
* kableExtra
* knitr
* randomForest
* caret
* pROC
* class
* FNN
* nnet

### Techniques:
* Data wrangling and cleaning
* Splitting Data
* Training, Evaluating, and Tuning models for:
  * Random Forests
  * Logistic Regression
  * k-Nearest Neighbors (kNN)
  * Neural Networks
* Building Ensemble Models

## Methodology
1. Load Data
2. Exploratory Data Analysis (EDA)
3. Data Preprocessing
   * Handle Missing Data
   * Encode Categorical Features
   * Correlation Assessment
   * Model-Specific Preprocessing
4. Data Splitting
5. Model Development
   * Random Forest
   * Homogeneous Logistic Regression Ensemble
   * Homogeneous kNN Ensemble
   * Homogeneous Neural Network Ensemble
   * Heterogeneous Ensemble
6. Final Evaluation
   
## Results
Overall, there was little correlation between the features and `follow-up-required`, which made the model challenging to train. Because this is a medical prediction task, the priority was to maximize **sensitivity (true positive rate)** — ensuring patients who need follow-up are correctly identified — while still maintaining a reasonable true negative rate.  

The true positive rates were:  
* Random Forest — 0.62  
* Logistic Regression — 0.82  
* kNN — 0.57  
* Ensemble — 0.73  

Among the models, **logistic regression achieved the highest sensitivity**, but the **ensemble model provided a stronger balance** across metrics. While prioritizing sensitivity reduces overall accuracy, it minimizes the risk of missing patients who require treatment — a critical consideration in medical decision-making.  

The full analysis and report can be found in the [knitted report](https://zoechow24.github.io/brain-tumor-follow-up-predictions/Brain_Tumor_FU_Pred.html).

