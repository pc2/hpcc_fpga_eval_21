#!/bin/bash
export OMP_NUM_THREADS=15

for i in {1..30}; do
    blocks=$(($i*2))
    mpirun -n 1 ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/Linpack_xilinx -f ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/hpl_torus_PCIE.xclbin -n 5 -m ${blocks} -r 2 -b 8 --device 0 | tee m${blocks}_pcie.txt
    sleep 1
done

for i in {1..2}; do
    blocks=$((60+$i*10))
    mpirun -n 1 ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/Linpack_xilinx -f ../../../synthesis_artifacts/LINPACK_SP/u280-2020.2-xdma-201920-3/hpl_torus_PCIE.xclbin -n 5 -m ${blocks} -r 2 -b 8 --device 0 | tee m${blocks}_pcie.txt
    sleep 1
done
