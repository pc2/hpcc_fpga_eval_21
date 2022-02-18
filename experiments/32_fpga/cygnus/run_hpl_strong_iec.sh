#!/bin/bash
#
# Schedule with qsub 
#
#PBS -q fpga-grp3-b
#PBS -N HPL_SP_IEC_EXE
#PBS -A CCUSC
#PBS -M marius.meyer@uni-paderborn.de
#PBS -m e
#PBS -o hpl_iec_strong_N32.log
#PBS -j o
#PBS -b 8
#PBS -l elapstim_req=03:00:00
#PBS -T openmpi 
#PBS -v NQSV_MPI_VER=gdr/4.0.3/gcc8.3.1-cuda11.2.1 

module load intelFPGA_pro/19.4
module load mkl/20.0.4
module load openmpi/$NQSV_MPI_VER 

cd $PBS_O_WORKDIR

export OMP_NUM_THREADS=1

mpirun ${NQSII_MPIOPTS} -np 64 -rf rankfile --report-bindings ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-iec/Linpack_intel -f ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-iec/hpl_torus_IEC.aocx -n 10 -m 6