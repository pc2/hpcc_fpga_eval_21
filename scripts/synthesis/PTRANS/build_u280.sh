#!/bin/bash
#
# Synthesize the PTRANS kernel for the U280 board.
# This is an example script, how the synthesis can be started on Noctua using a HPCC FPGA configuration file.
# Submit this script to sbatch in this folder!
#

HPCC_FPGA_VERSION=v0.5.1

BENCHMARK_NAME=PTRANS
BM_MAKE_TARGETS=(transpose_PQ_PCIE_xilinx Transpose_xilinx)

CONFIG_NAMES=($(ls u280/*.cmake))

SCRIPT_PATH=${PWD}

STORE_DIR_ROOT=/mnt/scratch/meyermar/synth/ptrans
# build in memory
TMP_DIR=/dev/shm/meyermar_synth/ptrans
TMP_PROJECT_DIR=${TMP_DIR}/HPCC_FPGA
SYNTH_DIR=${TMP_DIR}/build

mkdir -p ${TMP_DIR}

if [ ! -d ${TMP_PROJECT_DIR} ]; then
    git clone --branch ${HPCC_FPGA_VERSION} https://github.com/pc2/HPCC_FPGA.git ${TMP_PROJECT_DIR}

    # Apply patches
    cd ${TMP_PROJECT_DIR};
    # Apply configuration improvement patch
    if ! git apply ${SCRIPT_PATH}/../../../patches/ptrans_simplify_memory_layout_xilinx.patch; then
        echo "ERROR: Apply patch failed!"
    fi

    if ! git apply ${SCRIPT_PATH}/../../../patches/ptrans_use_migrate_mem_object.patch; then
        echo "ERROR: Apply patch failed!"
    fi
fi

BENCHMARK_DIR=${TMP_PROJECT_DIR}/${BENCHMARK_NAME}

for r in "${CONFIG_NAMES[@]}"; do
    SYNTH_NAME=${r}
    BUILD_DIR=${SYNTH_DIR}/${SYNTH_NAME}
    STORE_DIR=${STORE_DIR_ROOT}/${SYNTH_NAME}

    mkdir -p ${BUILD_DIR}
    mkdir -p $(dirname ${STORE_DIR})
    cd ${BUILD_DIR}

    cmake ${BENCHMARK_DIR} -DCMAKE_BUILD_TYPE=Release -DHPCC_FPGA_CONFIG=${SCRIPT_PATH}/${r} | tee ${STORE_DIR}_configure.log

    make "${BM_MAKE_TARGETS[@]}" | tee ${STORE_DIR}_build.log

    # Save synthesis in scratch
    cp -r ${BUILD_DIR}/bin ${STORE_DIR}

done

