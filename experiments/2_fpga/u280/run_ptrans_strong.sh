#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

mpirun -n 4 -H alveo3b,alveo3c,alveo4b,alveo4c ../../../synthesis_artifacts/PTRANS/u280-2020.2-xdma-201920-3/Transpose_xilinx -f ../../../synthesis_artifacts/PTRANS/u280-2020.2-xdma-201920-3/transpose_PQ_PCIE.xclbin -n 10 -m 120 --device 0 | tee ptrans_strong_N2.out
