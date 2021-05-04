#!/bin/bash
#PBS -N Aag_mpileup
#PBS -l nodes=1:ppn=1
#PBS -l mem=16gb
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -t 1-34
#PBS -o /newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/03_variants.WGS/var_calling.20210428.smsjob.log

# Run in local directory

cd $PBS_O_WORKDIR

# Load all necessary modules
module load apps/samtools-1.9
module load apps/bcftools-1.8
module load languages/perl-5.14.2
module load languages/java-jdk-1.8.0-66

CALLER="/newhome/aj18951/bristol-velocity/AJvR_VelocityPipeline/tools/call_SNVs_bluecrystal.pl"

BAMDIR="/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/mapped.WGS"
REFERENCE="/newhome/aj18951/1a_Aricia_agestis_GWASdata/RefGenome/ilAriAges1.1.primary.fa"
OUTDIR="/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/03_variants.WGS"
REGIONS=($(cat /newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/03_variants.WGS/regions))

INDEX=$PBS_ARRAYID

REG=${REGIONS[$INDEX]}

JOBID="job"$(printf %04d $INDEX)
OUTDIR="$OUTDIR/$JOBID"
IDLOG="/newhome/aj18951/1a_Aricia_agestis_WGS_RawData_Oct2019/03_variants.WGS/$JOBID.var_calling.log"

hostname > $IDLOG
uname -a >> $IDLOG
date >> $IDLOG
echo "---------------------------------------------------" >> $IDLOG
echo >> $IDLOG
echo "Calling variants for region/s: $REG..." >> $IDLOG
echo >> $IDLOG
echo "CMD: " >> $IDLOG
echo "    $CALLER \\" >> $IDLOG
echo "    -b $BAMDIR \\" >> $IDLOG
echo "    -r $REFERENCE \\" >> $IDLOG
echo "    -o $OUTDIR \\" >> $IDLOG
echo "    -regs $REG \\" >> $IDLOG
echo "    -n 1 \\" >> $IDLOG
echo "    -c c \\" >> $IDLOG
echo "    -v 1 \\" >> $IDLOG
echo "    -d 0 \\" >> $IDLOG
echo "    -q 20 \\" >> $IDLOG
echo "    -p 0.05 \\" >> $IDLOG
echo "    -quiet \\" >> $IDLOG
echo "    -clean" >> $IDLOG
echo  >> $IDLOG
echo "---------------------------------------------------" >> $IDLOG
echo >> $IDLOG

$CALLER \
-b $BAMDIR \
-r $REFERENCE \
-o $OUTDIR \
-regs $REG \
-n 1 \
-c c \
-v 1 \
-d 0 \
-q 20 \
-p 0.05 \
-f gc,gp \
-quiet \
-clean \
>> $IDLOG 2>&1


# Move and rename output
if [[ -e $OUTDIR/variants.raw.bcf ]];
then
	mv $OUTDIR/variants.raw.bcf $OUTDIR/../$JOBID.variants.raw.bcf
	mv $OUTDIR/variants.raw.bcf.csi $OUTDIR/../$JOBID.variants.raw.bcf.csi
else
	if  [[ -e $OUTDIR/sites.raw.bcf ]];
	then
		mv $OUTDIR/sites.raw.bcf $OUTDIR/../$JOBID.sites.raw.bcf
		mv $OUTDIR/sites.raw.bcf.csi $OUTDIR/../$JOBID.sites.raw.bcf.csi
	else
		echo "No variants called for this job" >> $IDLOG
	fi
fi

REPORT=$(ls $OUTDIR/*report.txt)
OUTREPORT=$(basename $REPORT | perl -pe '$_='$JOBID'.".$_";')
mv $REPORT $OUTDIR/../$OUTREPORT

# Clean
rm -r $OUTDIR

echo >> $IDLOG
echo "---------------------------------------------------" >> $IDLOG
echo >> $IDLOG
date >> $IDLOG
echo >> $IDLOG
