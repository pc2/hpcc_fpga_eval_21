#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

# 120 blocks equal (100*256)^2*4 = 3.7 Gb of data per matrix. Two matrices need to be placed on a single bank
# 128 blocks does not fit because 8.6 GB are required on a single bank
mpirun -n 1 ../../../synthesis_artifacts/PTRANS/u280-2020.2-xdma-201920-3/Transpose_xilinx -f ../../../synthesis_artifacts/PTRANS/u280-2020.2-xdma-201920-3/transpose_PQ_PCIE.xclbin -n 10 -m 120 --device 0 | tee ptrans_N1.out
