### In Progress ##

#import relevant libraries
library(WDI)
library(tidyverse)

#use this to search an indicator
WDIsearch("inflation")

#download the data from the world development indicator database
data_interest <- wdi.dl('FR.INR.RINR', country = "all", start = 1960, end = 2020)
data_inflation <- wdi.dl("FP.CPI.TOTL.ZG", country = "all", start = 1960, end = 2020)

#merge the datasets
tutorial_merge <- merge(data_interest$data, data_inflation$data, by = c('iso2c', 'year', 'country'))
colnames(tutorial_merge) <- c("iso", 'year', 'country', 'interest', 'inflation')

#plot an animated graph 
interest_inflation <- ggplot(data = tutorial_merge, aes(x = interest, y = inflation, text= country, frame = year)) +
  labs(x = "Interest", y ='Inflation') + 
  geom_point()
interest_inflation <- ggplotly(interest_inflation)

#include the country name in the hover-information
interest_inflation$text <- tutorial_merge$country

interest_inflation

## Run a regression
summary(lm(inflation ~ interest, data = tutorial_merge))
