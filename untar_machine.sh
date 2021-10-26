#!/bin/bash
#
#SBATCH --array=1-4
#SBATCH --output=./jobfiles/array_%A-%a.out
#SBATCH --job-name=unzipper_test
#SBATCH --time=00:30:00
#SBATCH -p serc
#SBATCH --verbose

ending=('' '1' '2' '3')
index=${ending[${SLURM_ARRAY_TASK_ID}-1]}

datapath="/scratch/users/mborrus/Globus_data/"

cd $datapath/2x12m0d_432x2a${index}/history
tar -xvf 19800101.nc.tar

cd $datapath/2x6m0d_432x2a${index}/history
tar -xvf 19790701.nc.tar

cd $datapath/2x9m0d_432x2a${index}/history
tar -xvf 19791001.nc.tar
