rm(list=ls())

data <- read.csv("sentiment_month.csv", header=TRUE)
data <- data[(data$Sentiment=="negative"),]
data$Month <- 1:27

restrictions <-c("no","no","yes","yes","yes","yes","yes","yes", "yes", "yes", "yes", "yes", "yes", "yes", "yes", "yes", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no", "no")
cases <- c(37606, 70123, 1102813, 2433616, 3247922, 4434465, 7683391, 8389882, 9001544, 13695235, 17472702, 19477232, 18880025, 10591128, 11848967, 22998788, 17959203, 11497682, 16958274, 19869452, 14975203, 13406344, 15661976, 25599438, 90196819, 58117809, 51391978)
data$Cases <- cases
data$Restrctions <- restrictions

lm_reg <- lm(data$Count ~ data$Cases)
summary(lm_reg)

log_reg <- glm(data$Count ~ data$Restrctions)
summary(log_reg)

write.csv(data, "sentimentData.csv", row.names = FALSE) 

