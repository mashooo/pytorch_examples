#!/bin/bash

#SBATCH --job-name=multinode-example
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --gpus-per-task=1
#SBATCH --cpus-per-task=4

nodes=( $( scontrol show hostnames $SLURM_JOB_NODELIST ) )
nodes_array=($nodes)
head_node=${nodes_array[0]}
head_node_ips=$(srun --nodes=1 --ntasks=1 -w "$head_node" hostname --all-ip-addresses)
head_node_ips_array=($head_node_ips)
head_node_ip=${head_node_ips_array[0]}

source /opt/anaconda3/etc/profile.d/conda.sh
conda activate qlin

echo Node IP: $head_node_ip
export LOGLEVEL=INFO

srun torchrun \
--nnodes 2 \
--nproc_per_node 1 \
--master_addr=$head_node_ip --master_port=7657 \
/shared/examples/multinode_torchrun.py 50 10
