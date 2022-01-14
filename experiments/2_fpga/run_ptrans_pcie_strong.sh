#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 2
#SBATCH -n 4
#SBATCH -t 2:00:00 
#SBATCH -o ptrans_pcie_strong_N2_m68-%j.txt
#SBATCH -e ptrans_pcie_strong_N2_m68-%j.txt
#SBATCH -J PTRANS-pcie

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/Transpose_intel \
    -f ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/transpose_PQ_PCIE.aocx \
    -n 10 -m 32 -b 512 -r 4
