#!/bin/bash

n=$SLURM_ARRAY_TASK_ID

for m in $(seq 1 3)
do
	for i in $(seq 1 31)
	do 
		if [[ ($i -lt 10) ]]
		then
			if [[ ($n -lt 10) ]]
			then
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset/main/Summary_Sentiment/2022_0${m}/2022_0${m}_0${i}_0${n}_Summary_Sentiment.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset/main/Summary_Sentiment/2022_0${m}/2022_0${m}_0${i}_${n}_Summary_Sentiment.csv
			fi
		else
			if [[ ($n -lt 10) ]]
			then 
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset/main/Summary_Sentiment/2022_0${m}/2022_0${m}_${i}_0${n}_Summary_Sentiment.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset/main/Summary_Sentiment/2022_0${m}/2022_0${m}_${i}_${n}_Summary_Sentiment.csv
			fi
		fi
	done
done
