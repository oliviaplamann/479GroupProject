#!/bin/bash
mkdir -p slurm_out_hashtag_2020

jobId1=$(sbatch --array=0-23 \
       --output="slurm_out_hashtag_2020/slurm-%A_%a.out" \
       --error="slurm_out_hashtag_2020/slurm-%A_%a.err" \
       ./read_hashtag_2020.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')
