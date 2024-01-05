#!/bin/bash
#SBATCH -c 8                               # Request eight core
#SBATCH -t 0-24:00                         # Runtime in D-HH:MM format
#SBATCH -p priority                        # Partition to run in
#SBATCH --mem-per-cpu=16G                 # Memory per core
#SBATCH -o hostname_%j.out                 # File to which STDOUT will be written, including job ID (%j)
#SBATCH -e hostname_%j.err                 # File to which STDERR will be written, including job ID (%j)
                                           # You can change the filenames given with -o and -e to any filenames you'd like
#SBATCH --mail-user=yhsgw.ra@gmail.com
#SBATCH --mail-type=ALL

# load module
module load gcc/6.2.0 star/2.7.3a
module load samtools/1.10

# directory
dir="/n/scratch3/users/s/sk608/FASTQ_trimmed"
outdir="/n/scratch3/users/s/sk608/MappingResults/20210519"
indexdir="/home/sk608/mm10_index"

mkdir /n/scratch3/users/s/sk608/MappingResults
mkdir $outdir

# go to FASTQ_trimmed directory
cd $dir

# declare an array variable
declare -a R=(*.fq.gz)
declare -a Output=($(echo "${R[@]}" | sed "s/_R1_001_trimmed.fq.gz//g"))

len=${#R[@]}

# execute STAR and samtools (mapping and indexing)
for ((i=0; i<$len; i++)); do
mkdir $outdir/"${Output[$i]}"
STAR --runThreadN 8 --genomeDir $indexdir --readFilesIn "${R[$i]}" --readFilesCommand gunzip -c --outFileNamePrefix "$outdir"/"${Output[$i]}"/"${Output[$i]}" --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --quantMode TranscriptomeSAM GeneCounts
cd  $outdir/"${Output[$i]}"
bam=$(echo "${Output[$i]}Aligned.sortedByCoord.out.bam")
samtools index $bam
cd $dir
done
