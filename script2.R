library(readxl)
library(sqldf)
library(plyr)
# read and view the data set 
titanic3 <- read_excel("~/Master DS/DS510/Critical Thinking/CT1/titanic3.xlsx")
View(titanic3)

# generate a subset of the data
titanic_sub <- titanic3[,c("survived","sex")]
View(titanic_sub)

# convert male and female values to 0 and 1 
titanic_sub$sex[titanic_sub$sex == "female"] <- 0
titanic_sub$sex[titanic_sub$sex == "male" ] <- 1

# change sex data type from character into numeric
titanic_sub$sex <- as.numeric(titanic_sub$sex)

# summary of the variables 
summary(titanic_sub)

# unique function returns all values in a variable
unique(titanic_sub$survived)
unique(titanic_sub$sex)

# save to excel without index 
write.csv(titanic_sub, file = "cleaned_titanic.csv", row.names = FALSE)

# count values of each column 
count(titanic_sub, vars = "sex")
count(titanic_sub, vars = "survived")

# identify outliers in a variable
boxplot.stats(titanic3$age)$out
