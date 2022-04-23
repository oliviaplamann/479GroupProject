#!/bin/bash
n=$SLURM_ARRAY_TASK_ID


for y in $(seq 0 1)
do
	for m in $(seq 1 3)
	do
	if [[ ($m -lt 10) ]]
	then 

		for i in $(seq 1 31)
		do 
		if [[ ($i -lt 10) ]]
		then
			if [[ ($n -lt 10) ]]
			then
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Hashtag/202${y}_0${m}/202${y}_0${m}_0${i}_0${n}_Summary_Hashtag.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Hashtag/202${y}_0${m}/202${y}_0${m}_0${i}_${n}_Summary_Hashtag.csv$
			fi
		else
			if [[ ($n -lt 10) ]]
			then 
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_0${m}/202${y}_0${m}_${i}_0${n}_Summary_Sentiment.csv
			else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_0${m}/202${y}_0${m}_${i}_${n}_Summary_Sentiment.csv
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
                        wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_${m}/202${y}_${m}_0${i}_0${n}_Summary_Sentiment.csv
                        else
                        wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_${m}/202${y}_${m}_0${i}_${n}_Summary_Sentiment.csv
                        fi
                else
			if [[ ($n -lt 10) ]]
			then
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_${m}/2020${y}_${m}_0${n}_${i}_Summary_Sentiment.csv
        		else
			wget https://raw.githubusercontent.com/lopezbec/COVID19_Tweets_Dataset_202${y}/master/Summary_Sentiment/202${y}_${m}/202${y}_${m}_${i}_${n}_Summary_Sentiment.csv
	                fi
		fi
		done
	fi
	done
done

