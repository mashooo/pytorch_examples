#!/bin/bash

#SBATCH --job-name=multinode-example
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --gpus-per-task=1
#SBATCH --exclusive
#SBATCH --chdir=/home/nml-user/data/pytorch_examples/distributed/ddp-tutorial-series

srun -l --ntasks-per-node=1 slurm/torchrun.sh
