# command line arguments
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  year = args[1]
  month = args[2]
} else {
  cat('usage: Rscript .R <year> <month>\n', file=stderr())
  stop()
}


if(month < 10){
  df <- read.csv(paste(paste(year, paste("0", month, sep=""), sep="_"), ".csv", sep=""))
} else {
   df <- read.csv(paste(paste(year, month, sep="_"), ".csv", sep="")) 
}

# VECTORS FOR CSV FILE
year_vec <- vector("numeric", 3) + year
month_vec <- vector("numeric", 3) + month
sent_vec <- c("negative", "neutral", "positive")



neutral_count <- sum(str_count(df$Sentiment_Label, "neutral"))
negative_count <- sum(str_count(df$Sentiment_Label, "negative"))
positive_count <- sum(str_count(df$Sentiment_Label, "positive"))

counts_vec <- c(sum(df$Sentiment_Label == "negative"), sum(df$Sentiment_Label == "neutral"), sum(df$Sentiment_Label == "positive"))

df_updated = data.frame(Year = year_vec, Month = month_vec, Sentiment = sent_vec, Count = counts_vec)
write.csv(df_updated, paste("sentiment_summary", year, month, sep="_"), row.names=FALSE)
