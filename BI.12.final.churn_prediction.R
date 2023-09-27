library(rpart)
library(ggplot2)
library(lattice)
library(rpart.plot)
library(caret)
#install.packages("pROC")
library(pROC)

setwd("C:/Users/sxs220348/Desktop/BA R/PROJECT")
Churn <- read.csv("BI.12.proposal.churn_prediction_dataset.csv")

#Missing values
summary_nas <- data.frame(miss.val = sapply(Churn, function(x) sum(is.na(x))))
summary_nas
#There are 11 missing values in "TotalChange" column.


# Removing NA values
Churn_1 <- na.omit(Churn)

# removing first column
Churn_data <- Churn_1[,-c(1)]

count_gender<- table(Churn_data$Churn,Churn_data$gender); count_gender
barplot(count_gender,
        main="Churn vs Gender",
        xlab="Gender",
        ylab="Churn",
        col=c("Green", "red"),
        cex=1.2,cex.axis=1.2,cex.lab=1.2,
        legend=TRUE, beside=T, las=2)

count_payment_method <- table(Churn_data$Churn,Churn_data$PaymentMethod); count_payment_method
par(mar=c(13,5,3,1))
barplot(count_payment_method,
        main="Churn vs Payment_method",
        xlab="Payment_method",
        ylab="Churn",
        col=c("Green", "red"),
        cex=1.2,cex.axis=1.2,cex.lab=1.2,
        legend=TRUE,beside=T, las=2)

count_contract <- table(Churn_data$Churn,Churn_data$Contract); count_contract
par(mar=c(9,5,3,1))
barplot(count_contract,
        main="Churn vs Contract",
        xlab="Contract",
        ylab="Churn",
        col=c("Green", "red"),
        cex=1.2,cex.axis=1.2,cex.lab=1.2,
        legend=TRUE,beside=T, las=2)


count_phone_service <- table(Churn_data$Churn,Churn_data$PhoneService); count_phone_service
par(mar=c(5,5,3,1))
barplot(count_phone_service,
        main="Churn vs Phone_service",
        xlab="Phone_service",
        ylab="Churn",
        col=c("Green", "red"),
        cex=1.2,cex.axis=1.2,cex.lab=1.2,
        legend=TRUE,beside=T, las=2)

count_internet_service <- table(Churn_data$Churn,Churn_data$InternetService); count_internet_service
par(mar=c(7,5,3,1))
barplot(count_internet_service,
        main="Churn vs Internet_service",
        xlab="Internet_service",
        ylab="Churn",
        col=c("Green", "red"),
        cex=1.2,cex.axis=1.2,cex.lab=1.2,
        legend=TRUE ,beside=T, las=2)


# Decision Tree

# partition of data set
# 70% data contained in training
set.seed(1)
train_index <- sample(c(1:dim(Churn_data)[1]), dim(Churn_data)[1]*0.7)
training <- Churn_data[train_index, ]
# 30% data contained in validation
validation <- Churn_data[-train_index, ]

# Decision tree of Training
decision_tree_train <- rpart(training$Churn~., data=training, method = "class")
prp(decision_tree_train, type = 1, extra = 1, varlen = 10)
# Confusion Matrix of Training
Pred_train <- predict(decision_tree_train, training, type = "class")
confusionMatrix(Pred_train, as.factor(training$Churn))

# Max Decision tree of Training
Max_tree_train <- rpart(training$Churn~., data = training, method = "class",
                   control = rpart.control(minsplit = 1, cp = 0))
#prp(Max_tree_train,type = 1, extra = 1)
# Max Confusion Matrix of Training
Pred_max_train <- predict(Max_tree_train, training, type = "class")
confusionMatrix(Pred_max_train, as.factor(training$Churn))

# Cust Decision tree of Training
Cust_tree_train <- rpart(training$Churn~., data = training, method = "class",
                        maxdepth = 3)
prp(Cust_tree_train,type = 1, extra = 1)
# Max Confusion Matrix of Training
Cust_train <- predict(Cust_tree_train, training, type = "class")
confusionMatrix(Cust_train, as.factor(training$Churn))

# Cust Decision tree of Training for 2 branches
Cust_tree_train_2 <- rpart(training$Churn~., data = training, method = "class",
                         maxdepth = 2)
prp(Cust_tree_train_2,type = 1, extra = 1)
# Max Confusion Matrix of Training
Cust_train_2 <- predict(Cust_tree_train_2, training, type = "class")
confusionMatrix(Cust_train_2, as.factor(training$Churn))

# Prediction using validation for decision_tree_train
Pred_valid_def <- predict(decision_tree_train, validation, type = "class")
confusionMatrix(Pred_valid_def, as.factor(validation$Churn))

# Prediction using validation for Cust_tree_train
Pred_valid_Cust <- predict(Cust_tree_train, validation, type = "class")
confusionMatrix(Pred_valid_Cust, as.factor(validation$Churn))

# Prediction using validation for Max_tree_train
Pred_valid_Max <- predict(Max_tree_train, validation, type = "class")
confusionMatrix(Pred_valid_Max, as.factor(validation$Churn))

# Logit Model
# Logit for training
Churn_L <- Churn_data
Churn_L$Churn[Churn_L$Churn == "Yes"] <- 1
Churn_L$Churn[Churn_L$Churn == "No"] <- 0
Churn_L$Churn <- as.numeric(Churn_L$Churn)

# 70% data contained in training
set.seed(1)
train_ind_L <- sample(c(1:dim(Churn_L)[1]), dim(Churn_L)[1]*0.7)
training_L <- Churn_L[train_ind_L, ]
validation_L <- Churn_L[-train_ind_L, ]
# Logit model for training
logit_reg_train <- glm(Churn~., data = training_L, family = "binomial")
options(scipen=999)
summary(logit_reg_train)
# Logit predictions for training
logit.reg.pred.train <- predict(logit_reg_train, training_L, type = "response")
confusionMatrix(as.factor(ifelse(logit.reg.pred.train > 0.5, 1, 0)),
                as.factor(training_L$Churn))
# ROC Curves for training data
R_L_train <- roc(training_L$Churn, logit.reg.pred.train, auc = T)
plot.roc(R_L_train)
auc(R_L_train)

# Logit predictions for validation
logit.reg.pred.valid <- predict(logit_reg_train, validation_L, type = "response")
confusionMatrix(as.factor(ifelse(logit.reg.pred.valid > 0.5, 1, 0)),
                as.factor(validation_L$Churn))
# ROC Curves for validation data
R_L_Valid <- roc(validation_L$Churn, logit.reg.pred.valid, auc = T)
plot.roc(R_L_Valid)
auc(R_L_Valid)

# Roc for custom decision tree training
Cust_train_Roc <- predict(Cust_tree_train, training, type = "prob")
R_Cust_Train <- roc(training$Churn, Cust_train_Roc[,1])
plot.roc(R_Cust_Train)
auc(R_Cust_Train)

# Roc for custom decision tree validation
Cust_valid_Roc <- predict(Cust_tree_train, validation, type = "prob")
R_Cust_valid <- roc(validation$Churn, Cust_valid_Roc[,1])
plot.roc(R_Cust_valid)
auc(R_Cust_valid)