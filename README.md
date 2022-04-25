# STAT 479 Group Project

## Group Members: Supraja Battula (battula3@wisc.edu), Grace Campbell (gacampbell@wisc.edu), Justin Yang (jxyang@wisc.edu), Huailin Tang (htang73@wisc.edu), Olivia Plamann (oplamann@wisc.edu)

## Introduction:
### TO DO - add introduction from first/final drafts
Social media platforms like Twitter have been an outlet for many individuals to express their thoughts and beliefs, especially during times of increased isolation like the COVID-19 pandemic.  We thought it would be interesting to consider if the sentiments and hashtags of Tweets changed over different time periods during the pandemic, for example from year-to-year or at the beginning of the pandemic and more current times.  We plan to consider this question by parallelizing our computations using the High Performance Computing Cluster (HPC) using shell scripting and R code. 

The sentiment variable was generated using an algorithm that predicts the most probable sentiment for each Tweet (positive, neutral, and negative).  The predictions come from a Logit function producing the columns Logits_Negative (Non-normalized prediction for a negative sentiment), Logits_Positive (Non-normalized prediction for a positive sentiment), and Logits_Neutral (Non-normalized prediction for neutral sentiment).  The sentiment and logit variables were generated using a BB_twtr Twitter Sentiment Algorithm Classifer produced by the Computer Science department at Cornell University.  The algorithm experiements with Deep Learning Models along with mordern training strategies using Convolutional Neural Networks and Long Short Term Memory Networks.  The model competed in a sentiment analysis compeition (SemEval-2017 Twitter Analysis Competition) and received first place.

A paper published on this algorithm can be found here for more information: https://arxiv.org/pdf/1704.06125.pdf.

## Data:
Here is a link to our data: https://github.com/lopezbec/COVID19_Tweets_Dataset

You can clone this github repo by running "git clone https://github.com/oliviaplamann/479project.git"

## Code:
This folder contains all of our code.

## Graphcial Summaries and Results:
### TO DO - folder that contains our graphs and results from t-tests
