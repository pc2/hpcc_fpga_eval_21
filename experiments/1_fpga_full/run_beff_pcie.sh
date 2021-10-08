#!/bin/bash
#
#SBATCH -p fpga
#SBATCH -w fpga-0002
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -J beff
#SBATCH --constraint=20.4.0_max
#SBATCH -t 2:00:00
#SBATCH -o beff_pcie_N1-%j.txt
#SBATCH -e beff_pcie_N1-%j.txt
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


srun ../../synthesis_artifacts/b_eff/520n-21.2.0-20.4.0-iec/Network_intel -f ../../synthesis_artifacts/b_eff/520n-21.2.0-20.4.0-iec/communication_bw520n_IEC.aocx --comm-type PCIE -r 2


