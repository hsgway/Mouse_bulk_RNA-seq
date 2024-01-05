#!/bin/bash
#SBATCH -c 2                               # Request two core
#SBATCH -t 0-02:00                         # Runtime in D-HH:MM format
#SBATCH -p priority                        # Partition to run in
#SBATCH --mem-per-cpu=8G                 # Memory per core, request 8 G
#SBATCH -o hostname_%j.out                 # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e hostname_%j.err                 # File to which STDERR will be written, including job ID (%j)
                                           # You can change the filenames given with -o and -e to any filenames you'd like
#SBATCH --mail-user=xxx@bwh.harvard.edu                 # your email address for receiving notification
#SBATCH --mail-type=ALL

# create trimgalore environment (for the first run only)
module load conda2/4.2.13
conda create -n trimgalore python=3.7.4
source activate trimgalore
conda install cutadapt
conda install -c bioconda trim-galore
conda deactivate
