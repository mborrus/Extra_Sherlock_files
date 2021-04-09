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

rm -rf FREgrid/
echo "starting script"
cd /oak/stanford/schools/ees/aditis2/Globus_data/gfdl.intel18-prod-openmp-extra/2
git clone https://github.com/mborrus/FREgrid.git
echo "cloned 2"
mv -v ./FREgrid/* .
rm -rf FREgrid/
echo "moved files, running grid runner"
chmod 755 GridRunner
./GridRunner
echo "grid runner finished"

echo "starting script 2"
cd /oak/stanford/schools/ees/aditis2/Globus_data/gfdl.intel18-prod-openmp-extra/4
git clone https://github.com/mborrus/FREgrid.git
echo "cloned 4"
mv -v ./FREgrid/* .
rm -rf FREgrid/
echo "moved files, running grid runner"
chmod 755 GridRunner
./GridRunner
echo "grid runner 2 finished"
