#!/bin/sh

## JOB Name
#BSUB -J DNA_Compliment

## Memory RAM
#BSUB -n 2
#BSUB -R rusage[mem=2]

## Wall Time
#BSUB -W 2:00

## Error and output log files
#BSUB -o "DNA_Compliment_%J.out"
#BSUB -e "DNA_Compliment_%J.err"

#BSUB -B cheongj1@mskcc.org
#BSUB -N cheongj1@mskcc.org

module load python/3.7.1
python DNACompliment.py
