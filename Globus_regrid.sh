#!/bin/bash
#
#SBATCH --error=./jobfiles/regridder_%A-%a.err
#SBATCH --output=./jobfiles/regridder_%A-%a.out
#SBATCH --job-name=regridder_UT
#SBATCH --cpus-per-task=6
#SBATCH --mem=8G
#SBATCH --time=03:00:00
#SBATCH --verbose
#SBATCH -p serc

datapath="/scratch/users/mborrus/gfdl.ncrc4-intel-prod-openmp-3aditi/2x3m0d_432x2a/history/"
cd $datapath
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner_sherlock
fregrid --input_mosaic C96_mosaic.nc --input_file 19790101.atmos_daily.nc --output_file dailyUTPS_1.nc --scalar_field ucomp,temp,precip,sphum --nthreads 6 --nlon 144 --nlat 90 --debug
fregrid --input_mosaic C96_mosaic.nc --input_file 19790401.atmos_daily.nc --output_file dailyUTPS_2.nc --scalar_field ucomp,temp,precip,sphum --nthreads 6 --nlon 144 --nlat 90 --debug
