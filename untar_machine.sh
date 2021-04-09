#!/bin/bash
#
#SBATCH --array=1-5
#SBATCH --output=./jobfiles/array_%A-%a.out
#SBATCH --job-name=unzipper_test
#SBATCH --time=00:30:00
#SBATCH -p serc
#SBATCH --verbose

echo starting work on ${SLURM_ARRAY_TASK_ID}
datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-4xCO2"
cd $datapath/${SLURM_ARRAY_TASK_ID}
tar -xvf 19790101.nc.tar
echo finished unzipping ${SLURM_ARRAY_TASK_ID}
