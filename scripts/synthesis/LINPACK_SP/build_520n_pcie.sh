#!/bin/bash
#
# Synthesize the LINPACK SP kernel for the Nallatech 520N board.
# This is an example script, how the synthesis can be started on Noctua using a HPCC FPGA configuration file.
# Submit this script to sbatch in this folder!
#
#SBATCH -p fpgasyn
#SBATCH -J LINPACK_SP

INTEL_SDK=21.2.0
INTEL_BSP=20.4.0

HPCC_FPGA_VERSION=v0.5.1

module load intelFPGA_pro/${INTEL_SDK}
module load nalla_pcie/${INTEL_BSP}
module load intel
module load devel/CMake/3.15.3-GCCcore-8.3.0

SCRIPT_PATH=${SLURM_SUBMIT_DIR}

TMP_DIR=${SCRIPT_PATH}/tmp
TMP_PROJECT_DIR=${TMP_DIR}/HPCC_FPGA
SYNTH_DIR=${TMP_DIR}/build

mkdir -p ${TMP_DIR}

git clone --branch ${HPCC_FPGA_VERSION} git@github.com:pc2/HPCC_FPGA.git ${TMP_PROJECT_DIR}

BENCHMARK_DIR=${TMP_PROJECT_DIR}/LINPACK

CONFIG_NAMES=("Nallatech_520N_PCIE_B9_SB3_R5_s10" "Nallatech_520N_PCIE_B9_SB3_R5_s1")

for r in "${CONFIG_NAMES[@]}"; do
    SYNTH_NAME=${INTEL_SDK}-${INTEL_BSP}-${r}
    BUILD_DIR=${SYNTH_DIR}/${SYNTH_NAME}

    mkdir -p ${BUILD_DIR}
    cd ${BUILD_DIR}

    cmake ${BENCHMARK_DIR} -DCMAKE_BUILD_TYPE=Release -DHPCC_FPGA_CONFIG=${SCRIPT_PATH}/${r}.cmake

    make hpl_torus_PCIE_intel Linpack_intel

done
