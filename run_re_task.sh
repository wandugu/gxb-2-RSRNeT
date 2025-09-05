#!/usr/bin/env bash

DATASET_NAME="MRE"
BERT_NAME="models/bert-base-uncased"

CUDA_VISIBLE_DEVICES=0 python -u run.py \
        --dataset_name=${DATASET_NAME} \
        --bert_name=${BERT_NAME} \
        --num_epochs=15 \
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
        --save_path='ckpt/re/'