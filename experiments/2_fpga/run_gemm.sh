#!/bin/bash
#
#SBATCH -p fpga
#SBATCH -w fpga-0001,fpga-0002
#SBATCH -J GEMM
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 2
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -o gemm_N2-%j.out
#SBATCH -e gemm_N2-%j.out
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 4 FPGAs.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#

# Preparations
module load intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc intel devel/CMake/3.15.3-GCCcore-8.3.0 

# Execute GEMM with 16.640 elements matrix width
# Benchmark is EP, every FPGA will compute on own data
srun ../../synthesis_artifacts/GEMM/520n-21.2.0-20.4.0/GEMM_intel -f ../../synthesis_artifacts/GEMM/520n-21.2.0-20.4.0/gemm_base.aocx -r 5 -b 512 -m 45




