#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 13
#SBATCH -n 25 
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0001,fpga-0002,fpga-0003,fpga-0004,fpga-0005,fpga-0006,fpga-0007,fpga-0008,fpga-0011,fpga-0012,fpga-0013,fpga-0014,fpga-0015
#SBATCH -o hpl_pcie_N13_m48-%j.txt
#SBATCH -e hpl_pcie_N13_m48-%j.txt
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/hpl_torus_intel.aocx -n 10 -m 48