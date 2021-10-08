#!/bin/bash
#
#SBATCH -p fpga
#SBATCH -w fpga-0001,fpga-0002,fpga-0004,fpga-0005,fpga-0006,fpga-0007,fpga-0008,fpga-0009
#SBATCH -J FFT
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 8
#SBATCH -n 16
#SBATCH -t 2:00:00
#SBATCH -o fft_N8-%j.out
#SBATCH -e fft_N8-%j.out
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 4 FPGAs.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#

# Preparations
module load intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc intel devel/CMake/3.15.3-GCCcore-8.3.0 


srun ../../synthesis_artifacts/FFT/520n-21.2.0-20.4.0/FFT_intel -f ../../synthesis_artifacts/FFT/520n-21.2.0-20.4.0/fft1d_float_8.aocx -r 2 -b 4096



