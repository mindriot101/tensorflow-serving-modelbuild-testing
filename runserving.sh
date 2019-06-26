#!/bin/bash

set -e

CONTAINER_NAME=serving
IMAGE_NAME=tensorflow/serving:1.13.0-gpu
CONFIG_FILE=$(pwd)/ModelConfig.pbtext

docker rm -f ${CONTAINER_NAME} 2>/dev/null || true

docker run --rm --runtime nvidia \
    -it -p 8500:8500 -p 8501:8501 \
    --mount type=bind,source=$(pwd)/models/vgg16,target=/models/vgg16 \
    --mount type=bind,source=$(pwd)/models/resnet50,target=/models/resnet50 \
    --mount type=bind,source=${CONFIG_FILE},target=/models/model.config \
    ${IMAGE_NAME} \
    --model_config_file=/models/model.config