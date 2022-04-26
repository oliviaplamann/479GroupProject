#!/bin/bash

awk ' { x=1 ; if ( x == NR ) { print "Date, Tweet_ID, Sentiment_Label, Logits_Neutral, Logits_Positive,Logits_Negative" } else { gsub("_Summary_Sentiment.csv","",FILENAME); print FILENAME","$0 } } ' 2021_*.csv > 2021_Sentiments.csv
