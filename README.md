# Telecom_Churn_Prediction
Analyzing the data of telecom subscribers to anticipate the customer who intends to unsubscribe the network provider and provided recommendations to reduce the churn or retain the customer basis the data exploration.

**Introduction:**
Telecon service providers spend huge resources to increase the number of new customers, to maximize the profits and revenue, it was estimated that it costs six times for a company to gain a new customer compared to retaining the existing customer. So, retaining a current customer is more important than gaining a new customer and it can be said that losing a current customer is a loss in revenue to the company. In the current highly competitive market, the annual churn rate is estimated to be 15-25 percent. Since the number of customers for a company is very high in magnitude, evaluating case to case basis and targeting individual customers to retain is practically not feasible. With the help of previous churn data record, a model can be developed to find out which group of people are at very high risk of churn, so that company can target these customers to retain and what are the factors for churn so that company can prepare new marketing strategies and improve its operational performance to reduce the churn rate.

**Dataset Used:** 
Dataset consists of 21 columns and 7043 records, variables included but not limited to gender, other services (such as online security, streaming TV, online backup and others) to which a customer was subscribed to, payment method, tenure. Using the R, the data will be analyzed by observing the relations between various variables, a model will be developed to predict the churn, test the model, factors affecting the churn and recommendations to reduce the churn rate.

**Methodology:**

**Sample:**
We looked through a few data sets relevant to telecom subscriber churn and found one from Kaggle. There are 7,043 records. The dataset contains twenty variables for each customer and one additional column that indicates whether the consumer is churned. 

**Explore:**
We searched the dataset for missing values and discovered eleven missing values in ‘TotalCharges’ column. Since the total number of missing values is very minimum (0.002%), these records are deleted for the purpose of developing the prediction model. 

**Modify:**
We searched the dataset for unnecessary columns. Column 1 corresponding to CustomerID which is an unique identifiers for customers that have no bearing on the forecast, so Column 1, (CustomerID) is deleted. 

**Models:**
Our class of interest is forecasting churn, which is represented by ‘Yes’ for those customers who unsubscribed the services in the churn column else ‘No’. In our dataset, the fraction of ‘Yes’ is roughly 27%. We divided the data in to two subsets at random one is used for training which is 70% of the total data and other for validation as which is 30% of the total data. Test model is developed on a random sample selected. 

Models Consists of:
1.	Decision Tree
2.	Logistic Regression

Analyzed the Confusion Matrix and ROC Curves for the above models.

**Packages Used:**
rpart
ggplot2
lattice
rpart.plot
caret
pROC
