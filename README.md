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

**Conclusion and Recommendations:** 

Accuracy is almost the same for both training and validation data set, hence both models seem good for predicting the churn. In terms of AUC, logistic model (84.52%) has larger AUC value compared to decision tree (79.36), hence logistic model is recommended for predicting the churn.

Churn rate is maximum for electronic payment method, and minimum for automatic payment method, so it is recommended to offer discounts for those customers who use electronic method to shift their payment method to automatic. 

Churn rate is maximum for customers who have month to month contract and minimum for one- and two-year contract and since there is a large proportion of customers with month-to-month contract so company need to prepare strategies such as lucrative offers or loyalty programs or bare minimum prices during the initial time frame to shift these customers from month contract to one- and two-year contract, so that there will be a reduction in churn and also increase in revenue in future. 

Churn rate offered by internet service provided by “Fiber Optic” is very high compared to other services, which might be due to low quality of services offered by Fiber Optic, so it is recommended to improve the quality of the services offered by the Fiber Optic.
