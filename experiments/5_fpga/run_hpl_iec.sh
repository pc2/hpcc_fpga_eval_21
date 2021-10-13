#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_max 
#SBATCH -N 5
#SBATCH -n 9 
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0002,fpga-0003,fpga-0004,fpga-0005,fpga-0006
#SBATCH -o hpl_N5_m48-%j.txt
#SBATCH -e hpl_N5_m48-%j.txt
#SBATCH --fpgalink="torus3"
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_intel.aocx -n 10 -m 48