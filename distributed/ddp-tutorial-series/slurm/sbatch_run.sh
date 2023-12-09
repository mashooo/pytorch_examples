#!/bin/bash

#SBATCH --job-name=multinode-example
#SBATCH --exclusive --nodes=2 --ntasks-per-node=1 --gpus=2
#SBATCH --chdir=/home/nml-user/data/pytorch_examples/distributed/ddp-tutorial-series

srun -l --ntasks-per-node=1 slurm/torchrun.sh
