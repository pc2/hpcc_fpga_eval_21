#!/bin/bash
#SBATCH -p fpga 
#SBATCH --constraint=20.4.0_max 
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -t 2:00:00 
#SBATCH -o hpl-%j.txt
#SBATCH -e hpl-%j.txt
#SBATCH -J HPL

module load intel intelFPGA_pro/21.2.0 bittware_520n/20.4.0_max devel/CMake/3.15.3-GCCcore-8.3.0

for i in {1..30}; do
    blocks=$i
    srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_IEC.aocx -n 5 -m ${blocks} -r 5 -b 9  --platform 1 --device 0 | tee m${blocks}.txt
done

for i in {1..7}; do
    blocks=$((30+$i*5))
    srun ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/Linpack_intel -f ../../synthesis_artifacts/LINPACK_SP/520n-21.2.0-20.4.0-iec/hpl_torus_IEC.aocx -n 5 -m ${blocks} -r 5 -b 9  --platform 1 --device 0 | tee m${blocks}.txt
done
