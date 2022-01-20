#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_hpc
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -t 2:00:00 
#SBATCH -o hpl-pcie-b8-%j.txt
#SBATCH -e hpl-pcie-b8-%j.txt
#SBATCH -J HPL_PCIE

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_hpc devel/CMake/3.15.3-GCCcore-8.3.0

export OMP_NUM_THREADS=1

for i in {1..30}; do
    blocks=$(($i*2))
    srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/hpl_torus_PCIE_b8.aocx -n 5 -m ${blocks} -r 5 -b 8 -r 2  --platform 1 --device 0 | tee m${blocks}_pcie_b8.txt
done

for i in {1..2}; do
    blocks=$((60+$i*10))
    srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-pcie/hpl_torus_PCIE_b8.aocx -n 5 -m ${blocks} -r 5 -b 8 -r 2  --platform 1 --device 0 | tee m${blocks}_pcie_b8.txt
done
