#!/usr/bin/env bash

CONFIG=$1
PRETRAIN=$2

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch --nproc_per_node=8 --master_port=66667 \
    $(dirname "$0")/train.py $CONFIG --cfg-options model.pretrained=$PRETRAIN \
    --work-dir ./det-output --launcher pytorch ${@:3}
