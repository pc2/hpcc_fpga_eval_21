#!/bin/bash
#SBATCH -p fpga
#SBATCH -w fpga-0001
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --constraint=emul


module load intel
export OMP_NUM_THREADS=20
export OMP_PROC_BIND=master
export OMP_PLACES=sockets

./runme_intel64_static
