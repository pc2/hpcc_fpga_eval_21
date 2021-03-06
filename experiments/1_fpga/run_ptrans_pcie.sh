#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0009
#SBATCH -o ptrans_pcie_N1_m68-%j.txt
#SBATCH -e ptrans_pcie_N1_m68-%j.txt
#SBATCH -J PTRANS

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/Transpose_intel \
    -f ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/transpose_PQ_PCIE.aocx \
    -n 10 -m 64 -b 512 -r 4 --device 0
