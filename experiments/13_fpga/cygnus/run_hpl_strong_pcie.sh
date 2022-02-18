#!/bin/bash
#
# Schedule with qsub 
#
#PBS -q fpga
#PBS -N HPL_SP_PCIE_EXE
#PBS -A CCUSC
#PBS -B JSV=01,02,03,04,05,06,07,09,10,11,12,13,14
#PBS -M marius.meyer@uni-paderborn.de
#PBS -m e
#PBS -o hpl_pcie_strong_N13.log
#PBS -j o
#PBS -b 13
#PBS -T openmpi 
#PBS -v NQSV_MPI_VER=gdr/4.0.3/gcc8.3.1-cuda11.2.1 

module load intelFPGA_pro/19.4
module load mkl/20.0.4
module load openmpi/$NQSV_MPI_VER 

cd $PBS_O_WORKDIR

mpirun ${NQSII_MPIOPTS} -np 25 -npernode 2 -bind-to socket ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-pcie/Linpack_intel -f ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-pcie/hpl_torus_PCIE.aocx -n 10 -m 10