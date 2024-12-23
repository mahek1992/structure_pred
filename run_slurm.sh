#!/usr/bin/env bash
 
#SBATCH --job-name="p2p_gpu" 
#SBATCH --partition=high  
#SBATCH --gres=gpu:1 
#SBATCH --mem-per-gpu=20G 
#SBATCH --cpus-per-gpu=8 
#SBATCH --time=1-00:00:00 
#SBATCH --output=slurm_test_gpu_%A_%a_%j.log
 
echo dt1=$(date '+%Y/%m/%d %H:%M:%S') 
echo -e "---- $dt1 ---- " | tee -a times.log
 
eval "$(conda shell.bash hook)" 
conda activate py39
 
python p2p.py
 
echo; dt1=$(date '+%Y/%m/%d %H:%M:%S')
echo -e "---- $dt1 ---- " | tee -a times.log
