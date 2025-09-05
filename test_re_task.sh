#!/usr/bin/env bash

DATASET_NAME="MRE"
BERT_NAME="models/roberta-base"
RESNET_NAME="models/resnet50/resnet50-11ad3fa6.pth"
LOAD_PATH="ckpt/re/best_model.pth"
SEED=1234

CUDA_VISIBLE_DEVICES=0 python -u run.py \
        --dataset_name=${DATASET_NAME} \
        --bert_name=${BERT_NAME} \
        --seed=${SEED} \
        --only_test \
        --max_seq=80 \
        --use_prompt \
        --prompt_len=4 \
        --sample_ratio=1.0 \
        --load_path=${LOAD_PATH} \
        --resnet_path=${RESNET_NAME}
