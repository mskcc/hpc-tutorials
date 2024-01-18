#!/bin/bash
#BSUB -J RJob-weather
#BSUB -q cpuqueue
#BSUB -n 1   # The number of processors
###BSUB -m "lj-gpu ln-pgu"   # To specify host group for the job to run on
###BSUB -R span[ptile=10]   # Set to distribute the job across multiple host
#BSUB -R rusage[mem=1]   # Sets memory requirements for the job
###BSUB -R "A100" 
###BSUB -gpu "num=1:mode=shared:j_exclusive=yes"
#BSUB -W 2:00
#BSUB -o /home/cheongj1/test_lilac/R-out.%J
#BSUB -e /home/cheongj1/test_lilac/R-err.%J
#BSUB -L /bin/bash

# Unload all loaded modules
module purge

# Load R module and required scripts
module load R
Rscript weather.R
