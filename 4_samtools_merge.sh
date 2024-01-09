#!/bin/bash
#SBATCH -c 8                               # Request eight core
#SBATCH -t 0-12:00                         # Runtime in D-HH:MM format
#SBATCH -p priority                        # Partition to run in
#SBATCH --mem-per-cpu=16G                  # Memory per core
#SBATCH -o hostname_%j.out                 # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e hostname_%j.err                 # File to which STDERR will be written, including job ID (%j)
                                           # You can change the filenames given with -o and -e to any filenames you'd like
#SBATCH --mail-user=xxx@bwh.harvard.edu
#SBATCH --mail-type=ALL

# load module
module load gcc/6.2.0 samtools/1.10

# directory
dir="/n/scratch/users/s/<your ID>/MappingResults"
outdir="/n/scratch/users/s/<your ID>/MappingResults_merge"

mkdir $outdir

# change directory
cd $dir

# merge bam files
declare -a fname=(*)
IFS=" " read -r -a samples <<< "$(echo "${fname[@]//_*/}" | tr ' ' '\n' | sort -u | tr '\n' ' ')"

for name in ${samples[@]}
do
declare -a folder=($name*)
declare -a input=(${folder[@]/%/Aligned.sortedByCoord.out.bam})
output=$(echo ${folder[0]} | sed "s/_.*/.bam/g")
samtools merge "$outdir"/"$output" "$dir"/"${folder[0]}"/"${input[0]}" "$dir"/"${folder[1]}"/"${input[1]}" "$dir"/"${folder[2]}"/"${input[2]}" "$dir"/"${folder[3]}"/"${input[3]}"
samtools index "$outdir"/"$output"
done
