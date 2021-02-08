library(WDI)
library(tidyverse)

WDIsearch("inflation")

data_interest <- wdi.dl('FR.INR.RINR', country = "all", start = 1960, end = 2020)
data_inflation <- wdi.dl("FP.CPI.TOTL.ZG", country = "all", start = 1960, end = 2020)

tutorial_merge <- merge(data_interest$data, data_inflation$data, by = c('iso2c', 'year', 'country'))
colnames(tutorial_merge) <- c("iso", 'year', 'country', 'interest', 'inflation')

interest_inflation <- ggplot(data = tutorial_merge, aes(x = interest, y = inflation, text= country, frame = year)) +
  labs(x = "Interest", y ='Inflation') + 
  geom_point()
interest_inflation <- ggplotly(interest_inflation)

#include the country name in the hover-information
interest_inflation$text <- tutorial_merge$country

interest_inflation


interest_inflation <- ggplot(data = tutorial_merge, aes(x = interest, y = inflation, text= country, frame = year)) +
  labs(x = "Interest", y ='Inflation') + 
  geom_point()
interest_inflation <- ggplotly(interest_inflation)

#include the country name in the hover-information
interest_inflation$text <- tutorial_merge$country

interest_inflation

summary(lm(inflation ~ interest, data = tutorial_merge))

WDIsearch('inflation')
