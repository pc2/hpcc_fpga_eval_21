#!/bin/bash
#
# Synthesize the FFT kernel for the U280 board.
# This is an example script, how the synthesis can be started on Noctua using a HPCC FPGA configuration file.
# Submit this script to sbatch in this folder!
#

HPCC_FPGA_VERSION=v0.5.1

BENCHMARK_NAME=FFT
BM_MAKE_TARGETS=(fft1d_float_8_xilinx FFT_xilinx)

CONFIG_NAMES=($(ls u280/*.cmake))

SCRIPT_PATH=${PWD}

STORE_DIR_ROOT=/mnt/scratch/meyermar/synth/fft
# build in memory
TMP_DIR=/dev/shm/meyermar_synth/fft
TMP_PROJECT_DIR=${TMP_DIR}/HPCC_FPGA
SYNTH_DIR=${TMP_DIR}/build

mkdir -p ${TMP_DIR}

git clone --branch ${HPCC_FPGA_VERSION} git@github.com:pc2/HPCC_FPGA.git ${TMP_PROJECT_DIR}
cd ${TMP_PROJECT_DIR}; git apply ../../../../../patches/fft_inlines_and_enable_bursts_xilinx.patch

BENCHMARK_DIR=${TMP_PROJECT_DIR}/${BENCHMARK_NAME}

for r in "${CONFIG_NAMES[@]}"; do
    SYNTH_NAME=${r}
    BUILD_DIR=${SYNTH_DIR}/${SYNTH_NAME}
    STORE_DIR=${STORE_DIR_ROOT}/${SYNTH_NAME}

    mkdir -p ${BUILD_DIR}
    mkdir -p ${STORE_DIR_ROOT}
    cd ${BUILD_DIR}

    cmake ${BENCHMARK_DIR} -DCMAKE_BUILD_TYPE=Release -DHPCC_FPGA_CONFIG=${SCRIPT_PATH}/${r} | tee ${STORE_DIR}_configure.log

    make "${BM_MAKE_TARGETS[@]}" | tee ${STORE_DIR}_build.log

    # Save synthesis in scratch
    cp -r ${BUILD_DIR}/bin ${STORE_DIR}

done

