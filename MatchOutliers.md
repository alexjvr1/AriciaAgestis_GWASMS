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

The easiest way to do this is to extract the outlier regions from a set of bam files, and map to the de novo reference. 

Similarly, extract the outliers from the PopGen paper and map to the Sanger reference genome. 

Extract outlier regions from the bam files mapped to the Sanger reference genome: 
```
/newhome/aj18951/1a_Aricia_agestis_GWASdata/mapped_ddRAD

##SUPER_5 15949872 & 15949799 are outliers
##Extract 1000bp around this region

for i in $(ls *bam); do samtools view $i "SUPER_5:15949300-15950300" >> $i.subset.sam

#compress back to bam


#convert bam to fastq



#map using bwa mem as before




```



### MS1 outliers

Match the MS1 outliers back to the GWAS outliers

Outliers identified [here](https://github.com/alexjvr1/AriciaAgestis_PopGenMS/blob/master/6b_OutlierLoci_TranslateToScaffolds.md) 



```
###Host Plant (7 loci)

#Locus1: LG 01
2072  m_scaff_962_19860 

#Locus2: LG NA
10676 contig_11951_10614  

#Locus3: LG NA **Also found in  Col Hist +++Final Loci in Host Plant Jackknife test
11041 * +++   contig_5345_510
11042 +++     contig_5345_511
11050 * +++   contig_5345_587


#Locus4: LG NA
12108  contig_17378_3882

#Locus5: LG NA
16942 contig_5407_5785

#Locus6: LG NA
17001 contig_19343_4711

#Locus7: LG NA **Also found in  Col Hist
21375 *  contig_3838_3376
21377    contig_3838_3378
21378 *  contig_3838_3382
21379    contig_3838_3408

###ColHist (9 loci)

#Locus8: LG NA
10847    contig_4712_1181

#Locus3: LG NA  **Also found in  HostPlant (Not in ColHist Jackknife test)
11041 *   contig_5345_510
11050 *   contig_5345_587

#Locus9: LG NA
12957     contig_16912_5538

#Locus10: LG NA
13829     contig_3360_2654
13830     contig_3360_2666

#Locus11: LG NA
17567     contig_59667_912

#Locus7: LG NA **Also found in  HostPlant
21375 *   contig_3838_3376
21378 *   contig_3838_3382

#Locus12: LG NA
27882     contig_18281_3083

#Locus13: LG NA
28329     contig_1883_23537

#Locus14: LG NA
28726     contig_19564_5748
28728     contig_19564_5815

```

