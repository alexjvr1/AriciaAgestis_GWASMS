# NBAF WGS data

we've sequenced 34 A.agestis individuals, chosen for their extreme genotypes, at high coverage using an NBAF grant to myself and Jon in 2019. 

Some of these have been sequenced by ddRAD as well. In brackets below are the samples sequenced with ddRAD and WGS. 

Add 12 new WGS samples to 2013 dataset (+ resequenced 9 ddRAD samples)

Add 11 new WGS samples to 2014 dataset (+ resequenced 3 ddRAD samples)


## Map to Sanger genome

The samples have been sequenced to really high coverage, so there are 4 fastq.gz files per individual. 

I'm mapping each of these separately and then joining the sorted bam files together. 

```
Where? and code
```

Sorted bam files need to be indexed for bcftools/samtools mpileup. But I'm getting an error: 

```

```

To check the bam file I'm using Picard tools on the UoB server. 
```
module load apps/picard-2.20.0

java -jar /cm/shared/apps/Picard-2.20.0/picard.jar
```
