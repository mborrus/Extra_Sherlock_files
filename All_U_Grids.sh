#!/bin/bash
#
#SBATCH --output=regridder_%j.out
#SBATCH --error=regridder_%j.err
#SBATCH --job-name=regridder
#SBATCH --mem=64G
#SBATCH --cpus-per-task=6
#SBATCH --time=600
#SBATCH --verbose
#SBATCH --mail-type=ALL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mborrus@stanford.edu     # Where to send mail

for foldernum in {1..20}
do
datapath="/scratch/users/mborrus/Globus_data/gfdl.intel18-prod-openmp-extra"
cd $datapath/$foldernum
git clone https://github.com/mborrus/FREgrid.git
mv -v ./FREgrid/* .
rm -rf FREgrid/
chmod 755 GridRunner
./GridRunner
done
