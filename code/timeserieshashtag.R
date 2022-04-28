library(ggplot2)
library(tidyverse)
library(tsibble)
library(tsibbledata)
library(lubridate)
library(scales)

ts = read_csv("https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset/main/Summary_Hashtag/TopHas_day.csv") %>% 
  unite("Date", V1:V3, sep = "-")

ts$JoiningDate = as.Date(ts$Date)

ts_tib = as_tsibble(ts, key = V4, index = JoiningDate)

cc = ts_tib %>%
  filter(V4 %in% c("#coronavirus","#corona", "#covid","#covid19")) %>%
  ggplot() +
  geom_line(aes(JoiningDate, total, col = V4)) +
  scale_x_date(date_labels = "%b %y") +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Number of tweets using the hashtag over time",
       x = "Date", 
       y = "Number of Tweets",
       color = "Hashtag")

jpeg("hashtagtime.jpg", width = 2400, height = 2400, units = "px", res = 300)
cc
dev.off()
  