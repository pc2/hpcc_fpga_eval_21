#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

../../../synthesis_artifacts/RandomAccess/u280-2020.2-xdma-201920-3/RandomAccess_xilinx -f ../../../synthesis_artifacts/RandomAccess/u280-2020.2-xdma-201920-3/random_access_kernels_single.xclbin -r 4 -d 30 --device 0 \
| tee ra_N1.out
