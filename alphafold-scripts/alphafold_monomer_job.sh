#!/bin/bash
#BSUB -J alphafold-monomer-run
#BSUB -q gpuqueue
#BSUB -n 12
#BSUB -R span[ptile=12]
#BSUB -R rusage[mem=8]
#BSUB -gpu "num=1:mode=shared:j_exclusive=yes"
#BSUB -W 1:00
#BSUB -o lsf-monomer-errors.%J
#BSUB -eo lsf-monomer-output.%J
#BSUB -L /bin/bash

# Unload all loaded modules and reset everything to original state
module purge

# Load alphafold module
module load alphafold/2.3.1/af_2.3.1
module load cuda/11.7

# Run alphafold
runaf-2.3.1 \
-d /lila/data/shared_resources/alphafold-db \
-o test-alphafold-monomer \
-f test_monomer.fasta \
-t 2023-11-01 \
-a 0,1,2,3 \
-c full_dbs \
>test-af-monomer-$LSB_JOBID.out \
2>test-af-monomer-$LSB_JOBID.err
