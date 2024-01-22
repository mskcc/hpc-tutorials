#!/bin/bash
#BSUB -J alphafold-multimer-run
#BSUB -q gpuqueue
#BSUB -n 10
#BSUB -R span[ptile=10]
#BSUB -R rusage[mem=30]
#BSUB -gpu "num=4:mode=shared:j_exclusive=yes"
#BSUB -W 10:00
#BSUB -o lsf-multimer-errors.%J
#BSUB -eo lsf-multimer-output.%J
#BSUB -L /bin/bash

# Unload all loaded modules and reset everything to original state
module purge

# Load alphafold module
module load alphafold/2.3.1/af_2.3.1
module load cuda/11.7

export OPENMM_CPU_THREADS=8
export NVIDIA_VISIBLE_DEVICES=all
export TF_FORCE_UNIFIED_MEMORY=1
export TF_FORCE_GPU_ALLOW_GROWTH=true
export XLA_PYTHON_CLIENT_MEM_FRACTION=8.0
export XLA_PYTHON_CLIENT_ALLOCATOR=platform
export XLA_PYTHON_CLIENT_PREALLOCATE=false
export XLA_FLAGS=--xla_gpu_force_compilation_parallelism=1

# Run alphafold
runaf-2.3.1 \
-d /lila/data/shared_resources/alphafold-db \
-o test-alphafold-multimer \
-f test_multimer.fasta \
-t 2023-11-01 \
-a 0,1,2,3 \
-m multimer \
-c full_dbs \
>test-af-multimer-$LSB_JOBID.out \
2>test-af-multimer-$LSB_JOBID.err
