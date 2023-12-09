#!/bin/bash

#SBATCH --job-name=multinode-example
#SBATCH --exclusive --nodes=2 --ntasks-per-node=1 --gpus=2
#SBATCH --chdir=/home/nml-user/data/pytorch_examples/distributed/ddp-tutorial-series

nodes=( $( scontrol show hostnames $SLURM_JOB_NODELIST ) )
nodes_array=($nodes)
head_node=${nodes_array[0]}
head_node_ips=$(srun --nodes=1 --ntasks=1 -w "$head_node" hostname --all-ip-addresses)
head_node_ips_array=($head_node_ips)
head_node_ip=${head_node_ips_array[0]}

srun -l --ntasks-per-node=1 slurm/torchrun.sh $head_node_ip
