#!/usr/bin/env bash

CAFFE=caffe
DATASET=market
NET=ResNet_50
SNAPSHOTS_DIR=output/${DATASET}_train

LOG="experiments/logs/${DATASET}_re-id_${NET}.txt.`date +'%Y-%m-%d_%H-%M-%S'`"

cd $(dirname ${BASH_SOURCE[0]})/../../

mkdir -p ${SNAPSHOTS_DIR}

GLOG_logtostderr=1 ${CAFFE}/build/tools/caffe train \
  -solver models/${DATASET}/${NET}/${NET}_solver.prototxt \
  -weights data/imagenet_models//${NET}.caffemodel  2>&1 | tee ${LOG}
