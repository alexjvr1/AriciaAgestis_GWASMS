# Find outliers

Find outliers associated with the host plant preference using a genome scan. We'll compare this to the GWAS results. 


We're using two different aproaches: 

1. PCAdapt

2. Bayescan


## PCAdapt

Filter the vcf file for PCAdapt. 

1. Remove loci with QUAL < 100 (i.e. Phred confidence in variant site)

2. Minimum mean depth of 10 (i.e. remove loci with lower than mean 6x depth)

3. Max mean depth of mean + 2xSD of meanDP (here 255)

4. remove all multi-allelic SNPs

5. Remove all loci genotyped in <30% of individuals

6. Remove individuals with >60% missingness

7. Filter for <5% MAF when doing outlier detection.



```
/newhome/aj18951/1a_Aricia_agestis_GWASdata/03_variants

module load apps/vcftools-0.1.12b

vcftools --vcf AAgestis_FINAL.onlyChrs.recode.vcf

VCFtools - v0.1.12b
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf AAgestis_FINAL.onlyChrs.recode.vcf

After filtering, kept 276 out of 276 Individuals
After filtering, kept 135136 out of a possible 135136 Sites
Run Time = 3.00 seconds

```
