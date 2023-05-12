#DATA WRANGLING I
#OYIEYO SILAS

install.packages("tidyverse")

library(readr)
urlfile = "https://raw.githubusercontent.com/CWWhitney/teaching_R/master/participants_data.csv"
participants_dataklass <- read_csv(url(urlfile))
print(participants_dataklass)

write.csv(participants_dataklass, "C:/Users/oyiey/OneDrive/Dokumente/UniBonn SS2023/DecisionAnalysis/participants_data.csv")

read.csv("C:/Users/oyiey/OneDrive/Dokumente/UniBonn SS2023/DecisionAnalysis/participants_data.csv")
##data check

head(participants_dataklass)
head(participants_dataklass, n = 10)

tail(participants_dataklass, n = 2)

names(participants_dataklass)
str(participants_dataklass)

##dplyr for  intersect, setdiff, setequal, union
library(dplyr)
socioEcon_data <- select(participants_dataklass,
                         batch,
                         age,
                         gender,
                         academic_parents,
                         number_of_siblings,
                         working_hours_per_day)
print(socioEcon_data)    ##can be exported as CSV as well

filter(socioEcon_data, 
       working_hours_per_day >5)

# Changing the filter 
filter(participants_dataklass, 
       working_hours_per_day >5,
       letters_in_first_name >6 &
         continent_of_origin != 'Africa')

# Renaming the variable 
modified_data <- rename(participants_dataklass, 
       commute = km_home_to_zef,
       Email_due_date = days_to_email_response)
print(modified_data)

# Mutating a new column 
mutate(participants_dataklass, 
       Age_mean = age*
         mean(age))

# Mutating new column 
select(participants_dataklass,days_to_email_response )
#after recalling the column
mutate(participants_dataklass, 
       response_speed = 
         ifelse(days_to_email_response > 1, 
                "fast", "Late"))

# Creating a summary 
summarize(participants_dataklass,
          mean(number_of_siblings),
          median(years_of_study),
          max(days_to_email_response))

# Using the magrittr pipe to summarize 
library(magrittr)
participants_dataklass %>% 
  group_by(days_to_email_response) %>% 
  summarize(mean(days_to_email_response), 
            median(letters_in_first_name), 
            max(years_of_study))

# Using the magrittr pipe to mutate
 
participants_dataklass %>% 
  mutate(commute = ifelse(
    km_home_to_zef > 10, 
    "commuter", "local")) %>% 
  group_by(commute) %>% 
  summarize(mean(days_to_email_response), 
            median(letters_in_first_name), 
            max(years_of_study))

# purrr Split the data frame by the recommended column,(batch)

library(purrr)
participants_dataklass 
  split(.$batch) 
  map(~ lm(days_to_email_response ~ 
             working_hours_per_day, 
           data = .)) 
  map(summary) 
  map_dbl("R^2")

#Exercise II
#Subsetting the data
#Diamond data file
select(diamonds,
       carat, price) #only two columns are displayed, carat and price.

#Assign the data to a variable
diamonds_data <- select(diamonds,
                        carat, price) # new name for the subset data is diamonds_data

#filtering where carat is greater than 5
filter(diamonds_data, 
       carat > 5) #only one row has carat greater than 5

#renaming the price as cost
rename(diamonds_data, 
       cost = price) #the column, price changes to cost

#mutating new column
mutate(diamonds_data,
       status = ifelse(cost > mean(cost),
                        "expensive", "cheap"))
# - group_by: split into cheap and expensive
group_by(diamonds_data, status)
# - summarize
summarize(mean(cost), mean(carat))

#pipeline  
pipe_diamonds <- diamonds_data %>%
  select(carat, price) %>%
  filter(carat>0.5) %>%
  rename(cost = price) %>%
  mutate(status = ifelse(cost > mean(cost), "expensive", "cheap")) %>%
  group_by(status) %>%
  summarise(mean(cost), mean(carat)) %>%
  as.data.frame


#LECTURE 3
#Data visualization
ZEF_studentData <- participants_dataklass
print(ZEF_studentData)

#Bar plot
ZEF_studentDataPlot <- table(ZEF_studentData$age)
barplot(ZEF_studentDataPlot, main = "Age of ZEF student", xlab = "age", ylab = "freq")

#ggplot2
library(ggplot2)
ggplot(ZEF_studentData, aes(x = gender, y= number_of_publications)) + geom_point()
ggplot(ZEF_studentData, aes(x = gender, y= number_of_publications,
                            color = years_of_study, size = working_hours_per_day )) + geom_point()
#tell us more about this size and color?????
iris_data <- read.csv("C:/Users/oyiey/Downloads/IRIS.csv")
print(iris_data)

ggplot(data = iris_data,
       aes(x = sepal_width,
           y = sepal_length,
           color = species,
           size = petal_length))+
  geom_point()

diamdata <- read.csv("C:/Users/oyiey/Downloads/DiamondsPrices.csv")
print(diamdata)
#plot
ggplot(data = diamdata,
       aes(x = carat,
       y = price,
       alpha = 0.4))+
  geom_point()
#i-inhibit conversion of objects
ggplot(data = diamdata, 
       aes(x = depth, 
           y = price, 
           alpha = I(0.3), 
           color = I("green"))) + 
  geom_point()

#smooth plot
dsmall <- head(diamdata, 
                n = 20)
ggplot(data = dsmall, 
       aes(x = depth, 
           y = price))+
  geom_point()+
  geom_smooth()

#Geom smooth, method
dsmall1 <- head(diamdata, 
                n = 50)
ggplot(data = dsmall1, 
       aes(x = depth, 
           y = price))+ 
  geom_point()+ 
  geom_smooth(method = 'glm')

#geom_jitter
ggplot(data = diamdata, 
       aes(x = color, 
           y = carat,
           alpha = 0.2))+ 
  geom_boxplot()+ 
  geom_jitter()
#i 
ggplot(data = diamonds, 
       aes(x = color, 
           y = price/carat, 
           alpha = I(0.1))) + 
  geom_boxplot()+ 
  geom_jitter()




