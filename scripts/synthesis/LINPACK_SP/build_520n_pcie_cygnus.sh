#!/bin/bash
#
# Synthesize the LINPACK SP kernel for the Nallatech 520N board.
# This is an example script, how the synthesis can be started on Noctua using a HPCC FPGA configuration file.
# Submit this script to sbatch in this folder!
#
# Schedule with qsub 
#
#PBS -q fsyn-b
#PBS -N HPL_SP_PCIE
#PBS -A CCUSC
#PBS -M marius.meyer@uni-paderborn.de
#PBS -m e
#PBS -o synth_pcie.log
#PBS -j o

INTEL_SDK=19.4

HPCC_FPGA_VERSION=v0.5.1

module load intelFPGA_pro/${INTEL_SDK}
module load mkl/20.0.4
module load openmpi/gdr/4.0.3/gcc8.3.1-cuda11.2.1 

SCRIPT_PATH=${PBS_O_WORKDIR}

if [ "$SCRIPT_PATH" == "" ]; then
    SCRIPT_PATH=$PWD
fi

TMP_DIR=${SCRIPT_PATH}/tmp
TMP_PROJECT_DIR=${TMP_DIR}/HPCC_FPGA
SYNTH_DIR=${TMP_DIR}/build

# Project already created and configured because no access on compute nodes!
mkdir -p ${TMP_DIR}

if [ ! -d ${TMP_PROJECT_DIR} ]; then
    git clone --branch ${HPCC_FPGA_VERSION} https://github.com/pc2/HPCC_FPGA.git ${TMP_PROJECT_DIR}
    
    # Apply patches
    cd ${TMP_PROJECT_DIR};
    # Apply channel reordering patch
    if ! git apply ${SCRIPT_PATH}/../../../patches/cygnus_hpl_channel_ordering.patch; then
        echo "ERROR: Apply channel reordering patch failed!"
    fi
    # Apply configuration improvement patch
    if ! git apply ${SCRIPT_PATH}/../../../patches/hpl_gemm_scaling_separate_read_pipelines_intel.patch; then
        echo "ERROR: Apply separate read pipelines patch failed!"
    fi
fi
BENCHMARK_DIR=${TMP_PROJECT_DIR}/LINPACK

CONFIG_NAMES=("Nallatech_520N_PCIE_B9_SB2_SBMM3_R5_s1" "Nallatech_520N_PCIE_B9_SB2_SBMM3_R5_s2")

for r in "${CONFIG_NAMES[@]}"; do
    SYNTH_NAME=${INTEL_SDK}-${r}
    BUILD_DIR=${SYNTH_DIR}/${SYNTH_NAME}

    mkdir -p ${BUILD_DIR}
    cd ${BUILD_DIR}

    if [ "${PBS_O_WORKDIR}" == "" ]; then
        # only configure since it is executed on the frontend
        cmake ${BENCHMARK_DIR} -DCMAKE_BUILD_TYPE=Release -DHPCC_FPGA_CONFIG=${SCRIPT_PATH}/cygnus/${r}.cmake
    else
        # start synthesis because this is executed on a compute node
        make hpl_torus_PCIE_intel Linpack_intel&
    fi

done

wait
