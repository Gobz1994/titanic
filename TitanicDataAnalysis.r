library(ggplot2) #vizualization
library(dplyr) #manipulation
library(mice)  #imputation
install.packages('ggthemes')
library('ggthemes')
library(scales)

# combining test and train data

fullDB <- bind_rows(train, test)

#checking structure of data
str(fullDB)

#grab title from passenger names
fullDB$Title <- gsub('(.*, )| (\\..*)', '', fullDB$Name)

#show title counts by Gender
table(fullDB$Sex, fullDB$Title)

# Add a survived variable to the test set to allow combining data sets
test.survived <- data.frame(survived = rep("None",nrow(test)), test[,])

# Combine data sets 
data.combined <- rbind(train, test.survived)

# A bit about R data Types (e.g., Factors)
str(data.combined)

data.combined$Survived <- as.factor(data.combined$Survived)
data.combined$pclass <- as.factor(data.combined$pclass)