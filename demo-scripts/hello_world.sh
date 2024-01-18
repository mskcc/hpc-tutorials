#!/bin/bash
# The name of the queue you wan't to submit the job to
#BSUB -q cpuqueue
# The name of the job
#BSUB -J helloworld_job
# The number of processors you want
#BSUB -n 1
# Sets memory requirements for the job
#BSUB -R rusage[mem=1]
# How long the job will take (you job will be killed if it runs over the time limit)
#BSUB -W 2:00
# Output and error log files (optional but recommended)
#BSUB -o /home/cheongj1/test_lilac/R-out.%J
#BSUB -e /home/cheongj1/test_lilac/R-err.%J
# Extra stuff like a GPU
###BSUB -gpu "num=1:mode=shared:j_exclusive=yes"

# Unload all loaded modules
module purge

# now the command we want to run
echo "Hi $(whoami) I am a job running on $(hostname)"
