#!/bin/bash
#
#
##
#
# Execute the benchmarks synthesized with the HPC BSP on 1 FPGA.
# Results are stored in separate files for each benchmark
#

# mpirun -n 1 ../../../synthesis_artifacts/FFT/u280-2020.2-xdma-201920-3/FFT_xilinx -f ../../../synthesis_artifacts/FFT/u280-2020.2-xdma-201920-3/fft1d_float_8.xclbin -b 4096 --device 0 \
# | tee fft_N1.out

gdb --args ../../../synthesis_artifacts/FFT/u280-2020.2-xdma-201920-3/FFT_xilinx_debug -f ../../../synthesis_artifacts/FFT/u280-2020.2-xdma-201920-3/fft1d_float_8.xclbin -b 100 --device 0
