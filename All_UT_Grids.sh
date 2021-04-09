#!/bin/bash
#
#SBATCH --array=1-20%5
#SBATCH --error=./jobfiles/regridder_%A-%a.err
#SBATCH --output=./jobfiles/regridder_%A-%a.out
#SBATCH --job-name=regridder_UT
#SBATCH --cpus-per-task=6
#SBATCH --mem=16G
#SBATCH --time=01:00:00
#SBATCH --verbose
#SBATCH -p serc


echo starting work on ${SLURM_ARRAY_TASK_ID}

datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-openmp-extra"
cd $datapath/${SLURM_ARRAY_TASK_ID}
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner
./GridRunner

echo finished regridding ${SLURM_ARRAY_TASK_ID}

mk dir /oak/stanford/schools/ees/aditis2/Globus_data/gfdl.intel18-prod-4xCO2/${SLURM_ARRAY_TASK_ID}
mv dailyUT.nc /oak/stanford/schools/ees/aditis2/Globus_data/gfdl.intel18-prod-4xCO2/${SLURM_ARRAY_TASK_ID}

echo finished moving 
