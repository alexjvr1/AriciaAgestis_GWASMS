#!/bin/bash
#PBS -N Aag_index
#PBS -l nodes=1:ppn=1
#PBS -l mem=16gb
#PBS -l walltime=10:00:00
#PBS -j oe
#PBS -t 1-34
#PBS -o /newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/mapping.WGS/index.20210427.log

# Run in local directory
cd $PBS_O_WORKDIR

# Load all necessary modules
module load apps/samtools-1.9

NAME=$(sed "${PBS_ARRAYID}q;d" BAMLIST)


#Index bam files

samtools index ${NAME}
