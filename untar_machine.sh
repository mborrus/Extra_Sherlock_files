#!/bin/bash
#
#SBATCH --array=1-5
#SBATCH --output=./jobfiles/unzip_%j.out
#SBATCH --error=./jobfiles/unzip_%j.err
#SBATCH --job-name=unzipper_test
#SBATCH --time=00:30:00
#SBATCH --verbose

echo starting work on ${SLURM_ARRAY_TASK_ID}
datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-4xCO2"
cd $datapath/${SLURM_ARRAY_TASK_ID}
tar -xvf 19790101.nc.tar
echo finished unzipping ${SLURM_ARRAY_TASK_ID}
