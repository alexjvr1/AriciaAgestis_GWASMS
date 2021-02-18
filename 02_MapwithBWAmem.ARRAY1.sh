#!/bin/bash
#PBS -N BWA_part1  ##job name
#PBS -l nodes=1:ppn=1  #nr of nodes and processors per node
#PBS -l mem=16gb #RAM
#PBS -l walltime=10:00:00 ##wall time.  
#PBS -j oe  #concatenates error and output files (with prefix job1)
#PBS -t 1-48

#run job in working directory
cd $PBS_O_WORKDIR 
pwd
#cd ~/1a_Aricia_agestis_GWASdata/ #uncomment when running locally
#pwd

#Load modules
module load apps/bwa-0.7.15
module load apps/samtools-1.8

#Define variables

RefSeq=ilAriAges1.1.primary.fa

NAME1=$(sed "${PBS_ARRAYID}q;d" R1.namesaa)
NAME2=$(sed "${PBS_ARRAYID}q;d" R2.namesaa)

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

sample_name=`echo ${NAME1} | awk -F "_R1" '{print $1}'`
echo "[mapping running for] $sample_name"
printf "\n"
echo "time bwa mem RefGenome/$RefSeq ~/1a_Aricia_agestis_PopGenomics/demultiplexed.ipyrad_lib1.6/${NAME1} ~/1a_Aricia_agestis_PopGenomics/demultiplexed.ipyrad_lib1.6/${NAME2} | samtools sort -o mapped/${NAME1}.bam" >> map.log
time bwa mem RefGenome/$RefSeq ~/1a_Aricia_agestis_PopGenomics/demultiplexed.ipyrad_lib1.6/${NAME1} ~/1a_Aricia_agestis_PopGenomics/demultiplexed.ipyrad_lib1.6/${NAME2} | samtools sort -o mapped/${NAME1}.bam
