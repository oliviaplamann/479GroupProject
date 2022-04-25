#!/bin/bash
n=$SLURM_ARRAY_TASK_ID

for m in $(seq 1 12)
	do
	if [[ ($m -lt 10) ]]
	then 

		for i in $(seq 1 31)
		do 
		if [[ ($i -lt 10) ]]
		then
			if [[ ($n -lt 10) ]]
			then
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_0${m}/2020_0${m}_0${i}_0${n}_Summary_Sentiment.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_0${m}/2020_0${m}_0${i}_${n}_Summary_Sentiment.csv
			fi
		else
			if [[ ($n -lt 10) ]]
			then 
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_0${m}/2020_0${m}_${i}_0${n}_Summary_Sentiment.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_0${m}/2020_0${m}_${i}_${n}_Summary_Sentiment.csv
			fi
		fi
		done
	else
		for i in $(seq 1 31)
                do 
                if [[ ($i -lt 10) ]]
                then
                        if [[ ($n -lt 10) ]]
                        then
                        wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_${m}/2020_${m}_0${i}_0${n}_Summary_Sentiment.csv
                        else
                        wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_${m}/2020_${m}_0${i}_${n}_Summary_Sentiment.csv
                        fi
                else
			if [[ ($n -lt 10) ]]
			then
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_${m}/2020_${m}_${i}_0${n}_Summary_Sentiment.csv
        		else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_2020/master/Summary_Sentiment/2020_${m}/2020_${m}_${i}_${n}_Summary_Sentiment.csv
	                fi
		fi
		done
	fi
done
