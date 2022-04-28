library("data.table")
library("readr")
library("dplyr")
library("ggplot2")
h2022 <- read_csv("2022_best1.csv", col_names = FALSE)
head(h2022)
unique(h2022$X4)
unique(h2022$X5)
unique(h2022$X2)
tail(names(sort(table(h2022$X2))), 5)
h2022$X2 = tolower(h2022$X2)

h2022_1 = h2022[!grepl("covid", h2022$X2),]
#h2022_2 = h2022_1[-grepl("corona", h2022_1$X2),]
top_word <- tail(sort(table(h2022_1$X2)), 20)
top_word = as.data.frame(top_word)
top_word$Var1 = as.character(top_word$Var1)
new_row <- c("#covid", 8037690)
top_word1 <- rbind(top_word, new_row)
top_word1$Freq = as.numeric(top_word1$Freq)
ggplot(top_word1) + geom_bar(aes(x = Freq, y = reorder(Var1, Freq)), stat = "identity") + xlab("Frequency") + ylab("Hashtag")
ggsave("hashtag.png")
ggplot(top_word) + geom_bar(aes(x = Freq, y = reorder(Var1, Freq)), stat = "identity") + xlab("Frequency") + ylab("Hashtag")
ggsave("hashtag_without.png")


# top_word2020 <- read_csv("TopHas.csv")
# top_word2020_top20 = top_word2020 %>% head(20)
# top_word2020_without = top_word2020[!grepl("covid", top_word2020$V4),]
# top_word2020_without = top_word2020_without[!grepl("corona", top_word2020_without$V4),]
# top_word2020_without_top20 = top_word2020_without %>% head(10)
# ggplot(top_word2020_top20) + geom_bar(aes(x = total, y = V4), stat = "identity") + xlab("Frequency") + ylab("Hashtag")
# ggplot(top_word2020_without_top20) + geom_bar(aes(x = total, y = reorder(V4, total)), stat = "identity") + xlab("Frequency") + ylab("Hashtag")
# 
# count = 0
# for (i in c(1,nrow(top_word2020))){
#   if (grepl("covid", top_word2020[i,]$V4) == TRUE) {
#     count = count + top_word2020[i,]$total
#   }
# }
# 
# for (i in c(1,nrow(top_word2020))){
#   if (grepl("corona", top_word2020[i,]$V4)) {
#     print("1")
#   }
# }
