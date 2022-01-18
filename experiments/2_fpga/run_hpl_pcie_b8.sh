#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -t 2:00:00 
#SBATCH -o hpl_strong_pcie_b8_N2_m96-%j.txt
#SBATCH -e hpl_strong_pcie_b8_N2_m96-%j.txt
#SBATCH -J HPL

export OMP_NUM_THREADS=20

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/hpl_torus_PCIE_b8.aocx --platform 1 --device 0 -n 10 -m 96 -b 8 -r 2