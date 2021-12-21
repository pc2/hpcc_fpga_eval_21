#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# The used FPGA is specified in the whitelist (-w) above.
# Results are stored in separate files for each benchmark
#
export OMP_NUM_THREADS=16

mpirun -n 4 -H alveo3b,alveo3c,alveo4b,alveo4c ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/Linpack_xilinx -f ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/hpl_torus_PCIE.xclbin -r 2 -m 96 -n 5 --device 0 | tee hpl_N2.out
