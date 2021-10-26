#!/bin/bash
#
#SBATCH --array=1-4
#SBATCH --error=./jobfiles/regridder_%A-%a.err
#SBATCH --output=./jobfiles/regridder_%A-%a.out
#SBATCH --job-name=regridder_UT
#SBATCH --cpus-per-task=6
#SBATCH --mem=8G
#SBATCH --time=03:00:00
#SBATCH --verbose
#SBATCH -p serc

ending=('' '1' '2' '3')
index=${ending[${SLURM_ARRAY_TASK_ID}-1]}

datapath="/scratch/users/mborrus/Globus_data/"

cd $datapath/2x12m0d_432x2a${index}/history
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner_sherlock
fregrid --input_mosaic C96_mosaic.nc --input_file 19800101.atmos_daily.nc --output_file dailyUTP.nc --scalar_field ucomp,temp,precip,sphum --nthreads 6 --nlon 144 --nlat 90 --debug
mkdir /scratch/users/mborrus/AM4/TOM/Q1/${SLURM_ARRAY_TASK_ID}
cp dailyUTP.nc /scratch/users/mborrus/AM4/TOM/Q1/${SLURM_ARRAY_TASK_ID}/dailyUTP.nc

cd $datapath/2x6m0d_432x2a${index}/history
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner_sherlock
fregrid --input_mosaic C96_mosaic.nc --input_file 19790701.atmos_daily.nc --output_file dailyUTP.nc --scalar_field ucomp,temp,precip,sphum --nthreads 6 --nlon 144 --nlat 90 --debug
mkdir /scratch/users/mborrus/AM4/TOM/Q3/${SLURM_ARRAY_TASK_ID}
cp dailyUTP.nc /scratch/users/mborrus/AM4/TOM/Q3/${SLURM_ARRAY_TASK_ID}

cd $datapath/2x9m0d_432x2a${index}/history
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner_sherlock
fregrid --input_mosaic C96_mosaic.nc --input_file 19791001.atmos_daily.nc --output_file dailyUTPS.nc --scalar_field ucomp,temp,precip,sphum --nthreads 6 --nlon 144 --nlat 90 --debug
mkdir /scratch/users/mborrus/AM4/TOM/Q4/${SLURM_ARRAY_TASK_ID}
cp dailyUTP.nc /scratch/users/mborrus/AM4/TOM/Q4/${SLURM_ARRAY_TASK_ID}
