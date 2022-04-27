#!/bin/bash

n=$SLURM_ARRAY_TASK_ID

if [[ ($n -lt 10) ]]
then
awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_0${n}*.csv > 2020_0${n}.csv

else
awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive, Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2020_${n}*.csv > 2020_${n}.csv

fi