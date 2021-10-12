#!/bin/bash
#SBATCH -p fpga
#SBATCH -w fpga-0001,fpga-0002
#SBATCH -N 2
#SBATCH -n 4
#SBATCH --constraint=emul


module load intel
export OMP_NUM_THREADS=20
export OMP_PROC_BIND=master
export OMP_PLACES=sockets

./runme_intel64_static
