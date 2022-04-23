#!/bin/bash
mkdir -p slurm_out_sentiment

jobId1=$(sbatch --array=0-23 \
       --output="slurm_out_sentiment/slurm-%A_%a.out" \
       --error="slurm_out_sentiment/slurm-%A_%a.err" \
       ./read_sentiment_2022.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --dependency=afterok:$jobId1 \
		--array=0-23 \
                --output="slurm_out_sentiment/slurm-%A_%a.out" \
       		--error="slurm_out_sentiment/slurm-%A_%a.err" \
       		./read_sentiment_other.sh)

jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')
