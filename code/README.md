# This folder contains the code used to obtain our data and process it
## Here are directions for how to reproduce our analysis:
### Code to Read in the Data
- Run submit_hashtag.sh:
  - Runs read_hashtag_2022.sh 
    - Reads in hashtag files from 2022
  - Runs read_hashtag_2021.sh
    - Reads in hashtag files from 2021
- Run submit_hashtag_2020.sh
  - Runs read_hashtag_2020.sh
    - Reads in hashtag files from 2020
- Run submit_sentiment.sh
  - Runs read_sentiment_2022.sh
    - Reads in sentiment files from 2022
  - Runs read_sentiment_2021.sh
    - Reads in sentiment files from 2021
- Run submit_sentiment_2020.sh
  - Runs read_sentiment_2020.sh
    - Reads in sentiment files from 2020
### Code to Merge the Hashtag Files
- Run alldate.sh
  - Merge hashtag files and add title column to files
- Run sp.sh
  - Mutate the title column for hashtag files 
### Code to Merge the Sentiment Files for Month
- Run submit_month.sh
   - Runs month_2020.sh
     - Combines the 2020 sentiment files by month and adds title column to file
   - Runs month_2021.sh
     - Combines the 2021 sentiment files by month and adds title column to file
   - Runs month_2022.sh
     - Combines the 2022 sentiment files by month and adds title column to file
- Run submit_combine_months.sh
  - Runs combine_months_2022.sh
    - Runs r script combine_months.r for 2022
  - Runs combine_months_2021.sh
    - Runs r script combine_months.r for 2021
  - Runs combine_months_2020.sh
    - Runs r script combine_months.r for 2020
  - Runs combine_months.r
    - Produces file and counts of sentiment by month to use for analysis for each year
### Code to Merge the Sentiment Files for Day
- Run submit_day.sh
   - Runs day_2020.sh
     - Combines the 2020 sentiment files by day and adds title column to file
   - Runs day_2021.sh
     - Combines the 2021 sentiment files by day and adds title column to file
   - Runs day_2022.sh
     - Combines the 2022 sentiment files by day and adds title column to file
- Run submit_combine_days.sh
  - Runs combine_days_2022.sh
    - Runs r script combine_days.r for 2022
  - Runs combine_days_2021.sh
    - Runs r script combine_days.r for 2021
  - Runs combine_days_2020.sh
    - Runs r script combine_days.r for 2020
  - Runs combine_days.r
    - Produces file and counts of sentiment by day to use for analysis for each year
### Code for Statistical Analysis
- Run stat_analysis.R
  - Creates combined file from combine_months.r with COVID-19 case data
- Run 479_final_visualization.Rmd
  - Produces statistical analysis and summary graphs
- Run hashtag.R
  - Creates graphs for best hashtags for each year
- Run time series sentiment.R
  - Creates sentiment graphs for time series based on day file produced by combine_days.r
- Run timeserieshashtag.R
  - Creates hashtag time series graphs based on hashtag file produced by sp.sh
