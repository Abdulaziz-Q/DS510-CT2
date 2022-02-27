library(readxl)
library(sqldf)

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

# check data consistency
str(titanic_sub)
View(titanic_sub)
sapply(titanic_sub, class)

# the insight for question one
sqldf("select avg(survived) from titanic_sub")

# the insight for question two
# first code to show insight the number of females 
sqldf("select count(sex) from titanic_sub where sex = 0")
# second code to show insight the number of males 
sqldf("select count(sex) from titanic_sub where sex = 1")

# the insight for question three
# the number of survived female
sqldf("select count(survived) from titanic_sub where sex = 0 and survived = 1")
# the number of survived male 
sqldf("select count(survived) from titanic_sub where sex = 1 and survived = 1")


