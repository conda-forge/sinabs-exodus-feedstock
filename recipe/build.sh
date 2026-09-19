#!/bin/bash

set -ex

export TORCH_CUDA_ARCH_LIST="${CF_TORCH_CUDA_ARCH_LIST}"

${PYTHON} -m pip install . -vv
