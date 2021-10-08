#!/bin/bash
#
#SBATCH -p fpga
#SBATCH -w fpga-0002,fpga-0003,fpga-0004,fpga-0005,fpga-0006
#SBATCH -N 5
#SBATCH -n 10
#SBATCH -J beff
#SBATCH --constraint=20.4.0_max
#SBATCH -t 2:00:00
#SBATCH -o beff_iec_N5-%j.txt
#SBATCH -e beff_iec_N5-%j.txt
#SBATCH --fpgalink="ringO"
#
##
#
# Execute the b_eff benchmark on a single FPGA.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#

# Preparations
module load intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max intel devel/CMake/3.15.3-GCCcore-8.3.0 


srun ../../synthesis_artifacts/b_eff/520n-21.2.0-20.4.0-iec/Network_intel -f ../../synthesis_artifacts/b_eff/520n-21.2.0-20.4.0-iec/communication_bw520n_IEC.aocx -r 2


