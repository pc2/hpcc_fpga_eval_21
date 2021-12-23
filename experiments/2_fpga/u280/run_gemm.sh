#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#
export OMP_NUM_THREADS=16

mpirun -n 4 -H alveo3b,alveo4b,alveo3c,alveo4c ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/GEMM_xilinx -f ../../../synthesis_artifacts/GEMM/u280-2020.2-xdma-201920-3/gemm_base.xclbin -m 90 --device 0 | tee gemm_N2.out
