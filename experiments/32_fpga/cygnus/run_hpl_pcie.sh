#!/bin/bash
#
# Schedule with qsub 
#
#PBS -q fpga
#PBS -N HPL_SP_PCIE_EXE
#PBS -A CCUSC
#PBS -B NGRP=8node_16FPGA_1,8node_16FPGA_2,8node_16FPGA_3,8node_16FPGA_4
#PBS -M marius.meyer@uni-paderborn.de
#PBS -m e
#PBS -o hpl_pcie_N32.log
#PBS -j o
#PBS -b 32
#PBS -T openmpi 
#PBS -v NQSV_MPI_VER=gdr/4.0.3/gcc8.3.1-cuda11.2.1 

module load intelFPGA_pro/19.4
module load mkl/20.0.4
module load openmpi/$NQSV_MPI_VER 

cd $PBS_O_WORKDIR

export OMP_NUM_THREADS=1

mpirun ${NQSII_MPIOPTS} -np 64 -npernode 2 -bind-to socket ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-pcie/Linpack_intel -f ../../../synthesis_artifacts/LINPACK_SP/520n-h-19.4.0-19.4.0-pcie/hpl_torus_PCIE.aocx -n 2 -m 48