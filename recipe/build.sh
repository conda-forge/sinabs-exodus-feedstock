#!/bin/bash

set -ex

if [[ -z "${CUDA_HOME+x}" ]]; then
  # `$CUDA_HOME` was set for CUDA 11.x and earlier.
  # Must be using CUDA 12.0+. So set to `$BUILD_PREFIX`.
  # This is needed to find `nvcc` and `cudart`.
  export CUDA_HOME="${BUILD_PREFIX}"
fi

if [[ ${cuda_compiler_version} == 12.0 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0;6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0+PTX"
elif [[ ${cuda_compiler_version} == 12.6 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0;6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0+PTX"
elif [[ ${cuda_compiler_version} == 12.9 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0;6.0;7.0;7.5;8.0;8.6;9.0;10.0;12.0+PTX"
elif [[ ${cuda_compiler_version} == 13.0 ]]; then
    export TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6;9.0;10.0;11.0;12.0+PTX"
else
    echo "unsupported cuda version. edit build.sh"
    exit 1
fi

${PYTHON} -m pip install . -vv
