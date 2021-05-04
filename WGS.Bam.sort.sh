#!/bin/bash
#PBS -N sort_BAR_1_2013  ##job name
#PBS -l nodes=1:ppn=1  #nr of nodes and processors per node
#PBS -l mem=16gb #RAM
#PBS -l walltime=20:00:00 ##wall time.  
#PBS -j oe  #concatenates error and output files (with prefix job1)
#PBS -t 1-4

#run job in working directory
cd $PBS_O_WORKDIR 
pwd

#Load modules
module load apps/samtools-1.9.1

NAME1=$(sed "${PBS_ARRAYID}q;d" R1.names)

samtools sort mapped/${NAME1}.bam -O bam -o mapped/${NAME1}.sorted.bam
