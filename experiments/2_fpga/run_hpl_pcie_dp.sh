#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 2
#SBATCH -n 4 
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0002,fpga-0003
#SBATCH -o hpl_pcie_dp_N2_m96-%j.txt
#SBATCH -e hpl_pcie_dp_N2_m96-%j.txt
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/LINPACK_DP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_DP/520n-21.2.0-20.4.0-pcie/hpl_torus_intel.aocx -n 10 -m 96