#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_max 
#SBATCH -N 2
#SBATCH -n 4 
#SBATCH -t 2:00:00 
#SBATCH -w fpga-0002,fpga-0003
#SBATCH -o hpl_N2_m48-%j.txt
#SBATCH -e hpl_N2_m48-%j.txt
#SBATCH --fpgalink="torus2"
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max devel/CMake/3.15.3-GCCcore-8.3.0

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_IEC.aocx -n 10 -m 48