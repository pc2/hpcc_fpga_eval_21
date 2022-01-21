#!/bin/bash

# Use RA bitstream as dummy since it is actually not nused for the measurements
mpirun -n 2 -H alveo4b,alveo4c ../../../synthesis_artifacts/b_eff/u280-2020.2-xdma-201920-3/Network_xilinx -f ../../../synthesis_artifacts/RandomAccess/u280-2020.2-xdma-201920-3/random_access_kernels_single.xclbin --comm-type PCIE -r 2 --device 0 | tee beff_pcie_N1.out


