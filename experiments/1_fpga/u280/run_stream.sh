#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#

../../../synthesis_artifacts/STREAM/u280-2020.2-xdma-201920-3/STREAM_FPGA_xilinx -f ../../../synthesis_artifacts/STREAM/u280-2020.2-xdma-201920-3/stream_kernels_single.xclbin -r 4 -d 30 --device 0 \
| tee stream_N1.out
