#!/usr/bin/env bash

DATASET_NAME="MRE"
BERT_NAME="models/roberta-uncased"
RESNET_NAME="models/resnet50/resnet50-11ad3fa6.pth"

CUDA_VISIBLE_DEVICES=0 python -u run.py \
        --dataset_name=${DATASET_NAME} \
        --bert_name=${BERT_NAME} \
        --num_epochs=3 \
        --batch_size=16 \
        --lr=3e-5 \
        --warmup_ratio=0.06 \
        --eval_begin_epoch=1 \
        --seed=49 \
        --do_train \
        --max_seq=80 \
        --use_prompt \
        --prompt_len=4 \
        --sample_ratio=1.0 \
        --save_path='ckpt/re/' \
        --resnet_path=${RESNET_NAME}