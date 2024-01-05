#!/bin/bash
#SBATCH -c 8                               # Request eight core
#SBATCH -t 0-02:00                         # Runtime in D-HH:MM format
#SBATCH -p priority                        # Partition to run in
#SBATCH --mem-per-cpu=16G                 # Memory per core
#SBATCH -o hostname_%j.out                 # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e hostname_%j.err                 # File to which STDERR will be written, including job ID (%j)
                                           # You can change the filenames given with -o and -e to any filenames you'd like
#SBATCH --mail-user=yhsgw.ra@gmail.com
#SBATCH --mail-type=ALL

# load module
module load gcc/6.2.0 subread/2.0.0

# directory and file
bamdir="/n/scratch3/users/s/sk608/MappingResults/20210519_merge"
outdir="/n/scratch3/users/s/sk608/Counts/20210519"
gtf="/home/sk608/mm10_references/gencode.vM25.annotation.gtf"

mkdir /n/scratch3/users/s/sk608/Counts
mkdir $outdir

# go to the directory where your merged BAM files locate
cd $bamdir
declare -a Input=(*.bam)

# featureCounts
input=$(echo "${Input[@]}")
featureCounts -T 4 -s 2 -a $gtf -o $outdir/result.txt $input # T is the number of threads, -s 2 specifies strand-specific read counting (reversely stranded reads)
