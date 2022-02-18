#!/bin/bash
#
# Schedule with qsub 
#
#PBS -q fpga
#PBS -N HPL_SP_IEC_EXE
#PBS -A CCUSC
#PBS -B JSV=01
#PBS -M marius.meyer@uni-paderborn.de
#PBS -m e
#PBS -o hpl_iec_N1.log
#PBS -j o

module load intelFPGA_pro/19.4
module load mkl/20.0.4
module load openmpi/gdr/4.0.3/gcc8.3.1-cuda11.2.1 

cd $PBS_O_WORKDIR

../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-iec/Linpack_intel -f  ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-iec/hpl_torus_IEC.aocx -n 10 -m 48 --device 0