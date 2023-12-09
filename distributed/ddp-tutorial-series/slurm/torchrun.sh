#!/bin/bash

source /opt/anaconda3/etc/profile.d/conda.sh
conda activate qlin

echo Node IP: $1
export LOGLEVEL=INFO

torchrun \
--nnodes=2 \
--nproc_per_node=$SLURM_GPUS_ON_NODE \
--node_rank=$SLURM_NODEID \
--master_addr=$1 --master_port=7657 \
multinode.py 50000 10
