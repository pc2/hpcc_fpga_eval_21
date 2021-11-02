#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

# mpirun -n 1 ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/GEMM_xilinx_noblas -f ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/gemm_base.xclbin -m 90 --device 0 \
# | tee gemm_N1.out
mpirun -n 1 ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/GEMM_xilinx_noblas -f ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/gemm_base.xclbin -m 12 --device 0
