# NBAF WGS data

we've sequenced 34 A.agestis individuals, chosen for their extreme genotypes, at high coverage using an NBAF grant to myself and Jon in 2019. 

Some of these have been sequenced by ddRAD as well. In brackets below are the samples sequenced with ddRAD and WGS. 

Add 12 new WGS samples to 2013 dataset (+ resequenced 9 ddRAD samples)

Add 11 new WGS samples to 2014 dataset (+ resequenced 3 ddRAD samples)


## Map to Sanger genome

The samples have been sequenced to really high coverage, so there are 4 fastq.gz files per individual. 

I'm mapping each of these separately and then joining the sorted bam files together. 

1. Mapping script [here](https://github.com/alexjvr1/AriciaAgestis_GWASMS/blob/main/MapToGenome_WGS_ARRAY.sh)

```
#On BlueCrystal aj18951
#For each sample e.g. 

/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/transfer.genomics.ed.ac.uk/11696_Bridle_Jon/raw_data/20191025/BAR_1_2013

```

2. Bam files need to be sorted before I can merge them. Used [this script](https://github.com/alexjvr1/AriciaAgestis_GWASMS/blob/main/WGS.Bam.sort.sh). 

3. Concatenate the bam files using this [script](https://github.com/alexjvr1/AriciaAgestis_GWASMS/blob/main/WGS.Bam.merge.sh) 

4. Concatenated bam files were transferred to a mapped folder: 
```
/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/mapped.WGS
```

5. Index the sorted and merged bam files before we can do variant calling. Used [this script](https://github.com/alexjvr1/AriciaAgestis_GWASMS/blob/main/Index.ARRAY.sh).

6. Create variant calling script using [this script](https://github.com/alexjvr1/AriciaAgestis_GWASMS/blob/main/03a_variant_calling_bluecp3.WGS.sh):

```
./03a_variant_calling_bluecp3.WGS.sh
```
And call variants. 







