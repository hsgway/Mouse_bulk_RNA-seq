#!/bin/bash
#SBATCH -c 8                               # Request eight core
#SBATCH -t 0-04:00                         # Runtime in D-HH:MM format
#SBATCH -p priority                        # Partition to run in
#SBATCH --mem-per-cpu=16G                 # Memory per core
#SBATCH -o /n/scratch3/users/s/sk608/hostname_%j.out                 # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e /n/scratch3/users/s/sk608/hostname_%j.err                 # File to which STDERR will be written, including job ID (%j)
                                           # You can change the filenames given with -o and -e to any filenames you'd like
#SBATCH --mail-user=yhsgw.ra@gmail.com
#SBATCH --mail-type=ALL

# directory
dir="/n/scratch3/users/s/sk608/FASTQ"
outdir="/n/scratch3/users/s/sk608/FASTQ_trimmed"

mkdir $outdir

# load modules
module load conda2/4.2.13

# activate the environment
source activate trimgalore

# change directory
cd $dir

# declare an array variable
declare -a R=(*.fastq.gz)

# length of the array (number of files)
len=${#R[@]}

# execute TrimGalore
for ((i=0; i<$len; i++)); do
trim_galore --cores 4 --gzip -o "$outdir" "${R[$i]}"
done

# deactivate the environment
conda deactivate
