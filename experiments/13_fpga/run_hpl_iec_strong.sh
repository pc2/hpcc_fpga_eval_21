#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_max 
#SBATCH -N 13
#SBATCH -n 25 
#SBATCH -t 2:00:00 
#SBATCH -o hpl_strong_N13_m48-%j.txt
#SBATCH -e hpl_strong_N13_m48-%j.txt
#SBATCH --fpgalink="torus5"
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max devel/CMake/3.15.3-GCCcore-8.3.0

sleep 60

srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_IEC.aocx --platform 1 -n 2 -m 10