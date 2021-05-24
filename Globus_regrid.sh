#!/bin/bash
#
#SBATCH --array=1-20%2
#SBATCH --error=./jobfiles/regridder_%A-%a.err
#SBATCH --output=./jobfiles/regridder_%A-%a.out
#SBATCH --job-name=regridder_UT
#SBATCH --cpus-per-task=6
#SBATCH --mem=8G
#SBATCH --time=00:50:00
#SBATCH --verbose
#SBATCH -p serc


echo starting work on ${SLURM_ARRAY_TASK_ID}

datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-4xCO2"
cd $datapath/${SLURM_ARRAY_TASK_ID}
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner_sherlock
./GridRunner_sherlock

echo finished regridding ${SLURM_ARRAY_TASK_ID}

mv dailyUTP.nc /scratch/users/mborrus/AM4/Base/${SLURM_ARRAY_TASK_ID}/dailyUTP.nc
echo finished moving 
