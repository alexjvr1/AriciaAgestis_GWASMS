#!/bin/bash
#PBS -N merge_BAR_1_2013  ##job name
#PBS -l nodes=1:ppn=1  #nr of nodes and processors per node
#PBS -l mem=16gb #RAM
#PBS -l walltime=20:00:00 ##wall time.  
#PBS -j oe  #concatenates error and output files (with prefix job1)
##PBS -t 1-4

#run job in working directory
cd $PBS_O_WORKDIR 
pwd

#Load modules
module load apps/samtools-1.9.1

NAME=BAR_1_2013

samtools merge $NAME.WGS.bam -b NAMES.sorted  
