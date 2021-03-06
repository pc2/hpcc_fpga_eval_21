#!/bin/bash
#
#SBATCH -p fpga
#SBATCH -J RA
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 4
#SBATCH -n 8
#SBATCH -t 2:00:00
#SBATCH -o ra_N4-%j.out
#SBATCH -e ra_N4-%j.out
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 4 FPGAs.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#

# Preparations
module load intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc intel devel/CMake/3.15.3-GCCcore-8.3.0 



srun ../../synthesis_artifacts/RandomAccess/520n-21.2.0-20.4.0/RandomAccess_intel -f ../../synthesis_artifacts/RandomAccess/520n-21.2.0-20.4.0/random_access_kernels_single.aocx -r 4 -d 30

