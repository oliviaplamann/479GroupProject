#!/bin/bash
n=$SLURM_ARRAY_TASK_ID
module load R/R-4.0.1

year=2021


for file in $year_0$n_*.csv
do
day=${file:8:2}
Rscript combine_days.r $year $n $day # will write to a csv file
done


for file in $year_$n_*.csv
do
day=${file:8:2}
Rscript combine_days.r $year $n $day # will write to a csv file
done
