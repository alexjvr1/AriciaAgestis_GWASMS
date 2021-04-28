# Match outliers to Pop Gen MS outliers

We want to find out if the loci we identified as important in MS1 are the same ones that have been identified in the GWAS, and vice versa. 

A large proportion of the loci identified as outliers in MS1 could not be mapped to the draft genome, so they were not reported in the main MS.
But we can still determine if these match the large outliers found in the GWAS. 


## MSc: Kristian Tombs (April 2021)


Kristian ran GWAS for three different datasets: Old sites only, New sites only, and WHOLE dataset. 

He used only Binary phenotypes, ignoring all phenotypes ranging from 0.3-0.7. 

This model seemed to run better than the continious model from his initial tests. 

### Binary Test model : GWAS loci

Match the loci identified by GWAS back to the de novo loci from MS1

Loci identified by WHOLE and NEW
```
5:15949799 (NEW)
5:15949872 (WHOLE)
7:18293176
13:16000481
```

We have to find the RG name for some reads that mapped to this position on the Ref Genome. Then we can check on the de novo assembly reads to see where those loci mapped and cross reference. 

Find the RG name for these loci in the WGS bam files for two individuals: 
```
module load apps/samtools-1.9

for i in $(ls *bam); do samtools view $i | grep "SUPER_5  15949799"; done
```

### MS1 outliers

Match the MS1 outliers back to the GWAS outliers


```


```

