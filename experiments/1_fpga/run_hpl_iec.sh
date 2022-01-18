#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_max 
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -w fpga-0004
#SBATCH -t 2:00:00 
#SBATCH -o hpl_N1_m48-%j.txt
#SBATCH -e hpl_N1_m48-%j.txt
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max devel/CMake/3.15.3-GCCcore-8.3.0

export OMP_NUM_THREADS=1

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_IEC.aocx --platform 1 -n 10 -m 48