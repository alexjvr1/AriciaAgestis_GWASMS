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

To check the bam file I'm using Picard tools on the UoB server. See Picard Tools [here](http://broadinstitute.github.io/picard/command-line-overview.html#ValidateSamFile)
```
/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/mapped.WGS

module load apps/picard-2.20.0

java -jar /cm/shared/apps/Picard-2.20.0/picard.jar

java -jar /cm/shared/apps/Picard-2.20.0/picard.jar ValidateSamFile \
      I=input.bam \
      MODE=SUMMARY
      
##FINDS missing READ Group information in the Bam files
## HISTOGRAM	java.lang.String
Error Type	Count
ERROR:MISSING_READ_GROUP	1
WARNING:RECORD_MISSING_READ_GROUP	76318571
```

If this is a problem downstream we can add RG infmation using Picard tools's [AddOrReplaceReadGroups tool](https://gatk.broadinstitute.org/hc/en-us/articles/360035532352-Errors-about-read-group-RG-information)



