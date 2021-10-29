#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

mpirun -n 2 -H alveo3b,alveo3c ../../../synthesis_artifacts/RandomAccess/u280-2020.2-xdma-201920-3/RandomAccess_xilinx -f ../../../synthesis_artifacts/RandomAccess/u280-2020.2-xdma-201920-3/random_access_kernels_single.xclbin -r 2 -g 3 -d 29 -n 10 --device 0 \
| tee ra_N4.out
