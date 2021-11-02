#!/bin/bash
#
# Synthesize the LINPACK SP kernel for the U280 board.
# This is an example script, how the synthesis can be started on Noctua using a HPCC FPGA configuration file.
# Submit this script to sbatch in this folder!
#

HPCC_FPGA_VERSION=v0.5.1

BENCHMARK_NAME=LINPACK
BM_MAKE_TARGETS=(hpl_torus_PCIE_xilinx Linpack_xilinx)

CONFIG_NAMES=($(ls u280/*.cmake))

SCRIPT_PATH=${PWD}


STORE_DIR_ROOT=/mnt/scratch/meyermar/synth/linpack_sp
# build in memory
TMP_DIR=/dev/shm/meyermar_synth/linpack_sp
TMP_PROJECT_DIR=${TMP_DIR}/HPCC_FPGA
SYNTH_DIR=${TMP_DIR}/build

mkdir -p ${TMP_DIR}

if [ ! -d ${TMP_PROJECT_DIR} ]; then
    git clone --branch ${HPCC_FPGA_VERSION} https://github.com/pc2/HPCC_FPGA.git ${TMP_PROJECT_DIR}
    
    # Apply patches
    cd ${TMP_PROJECT_DIR};
    # Apply configuration improvement patch
    if ! git apply ${SCRIPT_PATH}/../../../patches/hpl_gemm_scaling_use_combined_read_pipeline_intel.patch; then
        echo "ERROR: Apply separate read pipelines patch failed!"
        
    fi

    # Apply patch to use correct kernel names for Xilinx 
    if ! git apply ${SCRIPT_PATH}/../../../patches/hpl_gemm_fix_kernel_names_xilinx.patch; then
        echo "ERROR: Xilinx patch failed!"
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

