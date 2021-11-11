#!/bin/bash

for i in {1..30}; do
    blocks=$i
    mpirun -n 1 ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/Linpack_xilinx -f ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/hpl_torus_PCIE.xclbin -n 1 -m ${blocks} -r 2 -b 8 --device 0 | tee m${blocks}_pcie.txt
done

for i in {1..7}; do
    blocks=$((30+$i*5))
    mpirun -n 1 ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/Linpack_xilinx -f ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/hpl_torus_PCIE.xclbin -n 1 -m ${blocks} -r 2 -b 8 --device 0 | tee m${blocks}_pcie.txt
done
