#Set Working Directory
setwd("C:/Users/Xiqian/Google Drive/Github/kaggle_001_titanic")

#Load Test Data and Train Data
train_data = read.csv("./Data_Source/train.csv")
test_data = read.csv("./Data_Source/test.csv")


View(train_data)

#Add new Feature of the Data

###Combine sibling/spouce and parent/children into Family Size
train_data$fsize = train_data$SibSp+train_data$Parch+1


###Interactive term Age*Class
train_data$age_class = train_data$Age*train_data$Pclass

##Male = 1, Female = 0
train_data$SexN <- as.numeric(train_data$Sex=='male')



#Check Missing Data
is.na(train_data$Age))



#ML01 - logistic Regression
Tit_LR <- lm(Survived ~ Pclass+SexN+Age+age_class, data=train_data)




#Test Data Prediction
test_data$fsize = test_data$SibSp+test_data$Parch+1
test_data$age_class = test_data$Age*test_data$Pclass
test_data$SexN <- as.numeric(test_data$Sex=='male')
train_data$PSurvived <- Tit_LR$fitted.values