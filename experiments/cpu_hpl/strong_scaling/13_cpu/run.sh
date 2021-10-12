#!/bin/bash
#SBATCH -p fpga
#SBATCH -w fpga-0001,fpga-0002,fpga-0003,fpga-0004,fpga-0005,fpga-0006,fpga-0007,fpga-0008,fpga-0009,fpga-0010,fpga-0011,fpga-0012,fpga-0013
#SBATCH -N 13
#SBATCH -n 25
#SBATCH --constraint=emul

module load intel
export OMP_NUM_THREADS=20
export OMP_PROC_BIND=master
export OMP_PLACES=sockets

./runme_intel64_static
