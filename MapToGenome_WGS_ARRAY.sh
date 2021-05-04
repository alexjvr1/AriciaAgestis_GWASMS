#!/bin/bash
#PBS -N BWA_BAR_1_2013  ##job name
#PBS -l nodes=1:ppn=1  #nr of nodes and processors per node
#PBS -l mem=16gb #RAM
#PBS -l walltime=20:00:00 ##wall time.  
#PBS -j oe  #concatenates error and output files (with prefix job1)
#PBS -t 1-4

#run job in working directory
cd $PBS_O_WORKDIR 
pwd

#Load modules
module load apps/bwa-0.7.15
module load apps/samtools-1.8

#Define variables

RefSeq=ilAriAges1.1.primary.fa

NAME1=$(sed "${PBS_ARRAYID}q;d" R1.names)
NAME2=$(sed "${PBS_ARRAYID}q;d" R2.names)

echo "mapping started" >> map.log
echo "---------------" >> map.log

##Check if Ref Genome is indexed by bwa
if [[ ! RefGenome/$RefSeq.fai ]]
then 
	echo $RefSeq" not indexed. Indexing now"
	bwa index RefGenome/$RefSeq
else
	echo $RefSeq" indexed"
fi


##Map with BWA MEM and output sorted bam file

sample_name=`echo ${NAME1} | awk -F "_1169" '{print $1}'`
echo "[mapping running for] $sample_name"
printf "\n"
echo "time bwa mem ~/1a_Aricia_agestis_GWASdata/RefGenome/$RefSeq ${NAME1} ${NAME2} | samtools sort -o mapped/${NAME1}.bam" >> map.log
time bwa mem ~/1a_Aricia_agestis_GWASdata/RefGenome/$RefSeq ${NAME1} ${NAME2} | samtools sort -o mapped/${NAME1}.bam
