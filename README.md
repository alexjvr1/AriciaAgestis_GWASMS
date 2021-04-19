# AriciaAgestis_GWASMS
GWAS using ddRAD and WGS in combination with female preference data

## Aims




## 1.RawDatatoVariants.md

1.1 Call variants for ddRAD samples after mapping to the new Sanger genome. 

1.2 Call variants for NBAF whole genome sequenced samples after mapping to the new Sanger genome

For the WGS NBAF data each sample was sequenced across four lanes, so we have 4 fastq.gz files for each individual for each direction (fwd and rev). 
I'm concatenating these together just using cat before mapping to the new genome: 

```
cat *L01_1.fastq.gz > BAR_1_2013.WGS_1.fastq.gz

#Check this has worked: 
du -chs *L01_1*gz
924M	190905_E00306_0448_AH2LF3CCX2_5_11696BJ0065L01_1.fastq.gz
840M	190905_E00306_0448_AH2LF3CCX2_6_11696BJ0065L01_1.fastq.gz
755M	190905_E00306_0448_AH2LF3CCX2_7_11696BJ0065L01_1.fastq.gz
485M	191010_E00306_0453_AH37FMCCX2_1_11696BJ0065L01_1.fastq.gz
3.0G	total

du -chs *WGS*gz 
3.0G	BAR_1_2013.WGS_1.fastq.gz
3.3G	BAR_1_2013.WGS_2.fastq.gz
```





## 2.SNPFiltering.md

Filter SNPs from the ddRAD samples


## 3.PhenotypeData.md



## 4.GWASwithGEMMA.md
