#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 13
#SBATCH -n 25
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0001,fpga-0002,fpga-0004,fpga-0005,fpga-0006,fpga-0007,fpga-0008,fpga-0003,fpga-0010,fpga-0011,fpga-0012,fpga-0013,fpga-0014
#SBATCH -o ptrans_pcie_strong_N13_m68-%j.txt
#SBATCH -e ptrans_pcie_strong_N13_m68-%j.txt
#SBATCH -J PTRANS-pcie

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/Transpose_intel \
    -f ../../synthesis_artifacts/PTRANS/520n-21.2.0-20.4.0-pcie/transpose_PQ_PCIE.aocx \
    -n 10 -m 64 -b 512 -r 4
