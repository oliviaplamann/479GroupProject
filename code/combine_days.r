# command line arguments
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 3){
  year = args[1]
  month = args[2]
  day = args[3]
} else {
  cat('usage: Rscript .R <year> <month> <day>\n', file=stderr())
  stop()
}


if(month < 10){
  if(day < 10){
  df <- read.csv(paste(paste(year, paste("0", month, sep=""), paste("0", day, sep=""), sep="_"), ".csv", sep="")) }
  else{
    read.csv(paste(paste(year, paste("0", month, sep=""), day, sep="_"), ".csv", sep="")) }
} else {
  if(day < 10){
    df <- read.csv(paste(paste(year, month, paste("0", day, sep=""), sep="_"), ".csv", sep="")) }
  else{
    read.csv(paste(paste(year, month, day, sep="_"), ".csv", sep="")) }
}


# VECTORS FOR CSV FILE
year_vec <- vector("numeric", 3) + year
month_vec <- vector("numeric", 3) + month
day_vec <- vector("numeric", 3) + day
sent_vec <- c("negative", "neutral", "positive")

#install.packages("stringr")
library(stringr)

neutral_count <- sum(str_count(df$Sentiment_Label, "neutral"))
negative_count <- sum(str_count(df$Sentiment_Label, "negative"))
positive_count <- sum(str_count(df$Sentiment_Label, "positive"))

counts_vec <- c(sum(df$Sentiment_Label == "negative"),sum(df$Sentiment_Label == "neutral"), sum(df$Sentiment_Label == "positive"))


df_updated = data.frame(Year = year_vec, Month = month_vec, Day = day_vec, Sentiment = sent_vec, Count = counts_vec)
write.csv(df_updated, paste("sentiment_summary", year, paste(paste(month, day, sep="_"), ".csv", sep=""), sep="_"), row.names=FALSE)
