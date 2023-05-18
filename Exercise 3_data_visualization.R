#to the GITHUB
#LECTURE/SEMINAR THREE 3
library(readr)
library(ggplot2)
#Data visualization

participants_dataklass <- read.csv("C:/Users/oyiey/OneDrive/Dokumente/UniBonn SS2023/DecisionAnalysis/participants_data.csv")
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
head(iris_data, n=10)

ggplot(data = iris_data,
       aes(x = sepal_width,
           y = sepal_length,
           color = species,
           size = petal_length))+
  geom_point()

diamdata <- read.csv("C:/Users/oyiey/Downloads/DiamondsPrices.csv")
head(diamdata, n= 10)
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
ggplot(data = diamdata, 
       aes(x = color, 
           y = price/carat, 
           alpha = I(0.1))) + 
  geom_boxplot()+ 
  geom_jitter()


ggplot(data = diamdata, 
       aes(x = color, 
           y = carat)) + 
  geom_boxplot()

#to export a diagram recall the grDevices.Call the png function and assign to diagram to export
library(grDevices)
png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)
ggplot(data = diamdata, 
       aes(x = color, 
           y = carat)) + 
  geom_boxplot()
dev.off()

#more exercises
ggplot(data = iris_data,
       aes(x = sepal_length,
           y = petal_widthh))+
Geom_s

ggplot(data = iris_data,
       aes(x = sepal_length,
           y = petal_width)) + 
  geom_point() + 
  ggtitle("Ratio of sepal_petal")+
  labs(x = "Sepal length", 
       y = "petal length",
       col = "legend title") 
  #xlab("X") + ylab("Y")
ggplot(diamdata, 
       aes(y = depth,
           x = color))+ 
  ggtitle("Bar Chart") +
  xlab("color") + ylab("depth")+
  geom_bar()


#PRACTICAL SKILLS
# Change the density plot so that the x-axis is carat 
# the color is the diamond color
# and the alpha is set to 0.3 using the inhibit function
ggplot(data = diamdata, 
       aes(x = carat, 
           color = color, 
           alpha = I(0.3))) +
  geom_density()

#Box plot
# the boxplot , the x-axis is cut and
#  the y-axis is price divided by carat
ggplot(data = diamonds, 
       aes(x = cut, 
           y = (price/carat))) + 
  geom_boxplot()



