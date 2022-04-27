#!/bin/bash
n=$SLURM_ARRAY_TASK_ID
module load R/R-4.0.1

year=2022

Rscript combine_months.r $year $n # will write to a csv file
