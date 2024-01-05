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

# load modules
module load gcc/6.2.0 star/2.7.3a

# directory
dir="/home/sk608/mm10_references"
indexdir="/home/sk608/mm10_index"

mkdir $indexdir

# execute STAR index
cd $dir
STAR --runThreadN 8 --runMode genomeGenerate --genomeDir $indexdir --genomeFastaFiles $dir/*.fa --sjdbGTFfile $dir/*.gtf --sjdbOverhang 75
