#!/bin/bash
FASTQ=$1
REFERENCE=$2
OUTDIR=$3

if [ ! -d "$OUTDIR" ]
then
	mkdir $OUTDIR
fi

while ISF= read -r sequence
do
	gunzip -c $FASTQ | grep $sequence | wc -l >> $OUTDIR/match_count.txt
done < "$REFERENCE"
