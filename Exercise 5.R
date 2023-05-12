library(readr)
urlfile = "https://raw.githubusercontent.com/CWWhitney/Decision_Analysis_Course/main/data/stakeholder.csv"
stakeholder_data <- read.csv(url(urlfile))
print(stakeholder_data)

write.csv(stakeholder_data, "C:/Users/oyiey/OneDrive/Dokumente/UniBonn SS2023/DecisionAnalysis/stakeholserdata.csv")
read.csv("C:/Users/oyiey/OneDrive/Dokumente/UniBonn SS2023/DecisionAnalysis/stakeholserdata.csv")

library(ggplot2)
install.packages("ggrepel")
install.packages("ggthemes")
library(ggthemes)
library(ggrepel)

ggplot(data = stakeholder_data, 
       aes(x = Experience,
           y = Availability,
           label = stakeholders,
           color = Expertise)) +    #why if you run the code with character name, the plots are different.
  geom_point(aes(shape=Gender)) +
  xlab("Relevant Experience") +
  
  #label names of stakeholders and expand space to show full names
scale_x_continuous(labels = paste(seq(0, 5, by = 1)), 
                     breaks = seq(0, 5, by = 1), 
                     limits = c(0, 5),
                     expand = c(0, 1)) +
scale_y_continuous(labels = paste(seq(0, 5, by = 1)), 
                     breaks = seq(0, 5, by = 1), 
                     limits = c(0, 5),
                     expand = c(0, 1)) +
theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
theme(legend.position = "none") +
  
  # Create line to categorize stakeholders
  geom_hline(yintercept=2.5, color="white", size=2) +
  geom_vline(xintercept=2.5, color="white", size=2)+ 
  
  # Show all names of overlapped values
  geom_text_repel(box.padding = 0.3, max.overlaps = Inf, size = 3) +
  annotate("text", label = "Potential core experts",
           x = 4.5, y = 3.2, size = 5, color = "grey48") +
  annotate("text", label = "Resource persons",
           x = 4.5, y = 0.25, size = 5, color = "grey48") 
#the codes are yet to work out

