#!/bin/bash
mkdir -p slurm_out_day_r

jobId1=$(sbatch --array=1-3 \
       --output="slurm_out_day_r/slurm-%A_%a.out" \
       --error="slurm_out_day_r/slurm-%A_%a.err" \
       ./combine_days_2022.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --dependency=afterok:$jobId1 \
		--array=1-12 \
                --output="slurm_out_day_r/slurm-%A_%a.out" \
       		--error="slurm_out_day_r/slurm-%A_%a.err" \
       		./combine_days_2021.sh)

jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')

jobId3=$(sbatch --dependency=afterok:$jobId2 \
		--array=1-12 \
                --output="slurm_out_day_r/slurm-%A_%a.out" \
       		--error="slurm_out_day_r/slurm-%A_%a.err" \
       		./combined_days_2020.sh)

jobId3=$(echo $jobId3 | sed 's/Submitted batch job //')


jobId4=$(sbatch --dependency=afterok:$jobId3 \
                --output="slurm_out_day_r/slurm-%A_%a.out" \
                --error="slurm_out_day_r/slurm-%A_%a.err" \
                ./post_combine_day_r.sh)

jobId4=$(echo $jobId4 | sed 's/Submitted batch job //')
