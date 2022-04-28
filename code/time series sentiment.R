library(ggplot2)
library(tidyverse)
library(tsibble)
library(tsibbledata)
library(lubridate)
library(feasts)
theme_set(theme_minimal())

sdaa = read_csv('sentiment_day.csv') %>%
  unite("Date", Year:Day, sep = "-") 

sdaa$JoiningDate <- as.Date(sdaa$Date)
  
l = sdaa%>%
  group_by(Date)%>%
  summarise(Total = sum(Count))

sdAA = sdaa %>% 
  left_join(l, by = "Date") %>%
  mutate(ratio = Count/Total)

sdA_t = as_tsibble(sdAA, key = Sentiment, index = JoiningDate)

z = ggplot(sdA_t) +
  geom_line(aes(JoiningDate, ratio, col = Sentiment))

library(patchwork)
gh = list()

gh[["1"]] = sdA_t %>%
  ggplot()+
  geom_line(aes(JoiningDate, Count, col = Sentiment)) +
  scale_color_manual(values = c("red", "dodgerblue2","springgreen3")) +
  labs(title = "Number of Tweets per day",x = "Date", y = "Number of Tweets") +
  scale_x_date(date_labels = "%b %y") +
  scale_y_continuous(labels = scales::comma)
  theme(legend.position = "bottom")

gh[["2"]] = sdA_t %>%
  ggplot()+
  geom_line(aes(JoiningDate, ratio, col = Sentiment)) +
  scale_color_manual(values = c("red", "dodgerblue2","springgreen3")) +
  theme(legend.position = "none") +
  labs(title = "Ratio of number of tweets per day", 
       x = "Date", 
       y = "Ratio of Total Tweets") +
  scale_x_date(date_labels = "%b %y") +
  scale_y_continuous(labels = scales::comma)

tot = gh[["1"]] / gh[["2"]]

al = list()
al[["r"]] = sdA_t %>%
  filter(Sentiment == 'negative') %>%
  fill_gaps()%>%
  gg_season(period = "year", y = ratio) +
  theme(legend.position = "none") +
  labs(title = "Ratio of number of tweets per day for negative sentiment tweets", 
       x = "Date", 
       y = "Ratio of Total Tweets")+
  scale_y_continuous(labels = scales::comma)

al[["c"]]=sdA_t %>%
  filter(Sentiment == 'negative') %>%
  fill_gaps()%>%
  gg_season(period = "year", y = Count) +
  theme(legend.position = "bottom")+ 
  labs(title = "Number of Tweets per day for negative sentiment tweets",
       x = "Date", 
       y = "Number of Tweets") +
  scale_y_continuous(labels = scales::comma)


al[['rc']]=sdA_t %>%
  filter(Sentiment == 'positive') %>%
  fill_gaps()%>%
  gg_season(period = "year", y = ratio) +
  theme(legend.position = "none") +
  labs(title = "Ratio of number of tweets per day for positive sentiment tweets", 
       x = "Date", 
       y = "Ratio of Total Tweets") +
  scale_y_continuous(labels = scales::comma)

al[["pc"]]=sdA_t %>%
  filter(Sentiment == 'positive') %>%
  fill_gaps()%>%
  gg_season(period = "year", y = Count) +
  theme(legend.position = "bottom") +
  labs(title = "Number of Tweets per day for positive sentiment tweets",
       x = "Date", 
       y = "Number of Tweets") +
  scale_y_continuous(labels = scales::comma)

p = (al[["c"]] )/ (al[["r"]]) 

c = (al[['pc']] / al[['rc']])

jpeg("total.jpg",  width = 1200, height = 1200, units = "px", res = 300)
tot
dev.off()

jpeg("negativesent.jpg",  width = 2000, height = 1200, units = "px", res = 300)
p
dev.off()

jpeg("positivesent.jpg", width = 2000, height = 1200, units = "px", res = 300)
c
dev.off()
