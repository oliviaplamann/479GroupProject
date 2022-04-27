#!/bin/bash

n=$SLURM_ARRAY_TASK_ID

for d in $(seq 1 31)
do
   if [[ ($d -lt 10) ]]
   then
	if [[ ($n -lt 10) ]]
	then
	awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_0${n}_0$d*.csv > 2020_0${n}_0$d.csv

	else
	awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_${n}_0$d*.csv > 2020_${n}_0$d.csv
	fi
   else
   	if [[ ($n -lt 10) ]]
	then
	awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_0${n}_$d*.csv > 2020_0${n}_$d.csv

	else
	awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_${n}_$d*.csv > 2020_${n}_$d.csv
	fi
   fi
done 
