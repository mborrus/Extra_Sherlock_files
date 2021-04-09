#!/bin/bash
#
#SBATCH --array=1-20%5
#SBATCH --output=./jobfiles/regridder_%j.out
#SBATCH --error=./jobfiles/regridder_%j.err
#SBATCH --job-name=regridder_UT
#SBATCH --mem=8G
#SBATCH --time=00:30:00
#SBATCH --verbose

datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-openmp-extra"
cd $datapath/${SLURM_ARRAY_TASK_ID}
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner
./GridRunner
