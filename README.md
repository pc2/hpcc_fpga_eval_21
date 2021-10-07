# Experiment Description

The whole experiment was executed on the Noctua cluster of the Paderborn Center for Parallel Computing (https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua/).
Up to 13 of the FPGA nodes were used to execute the experiments.

## Synthesis and Compilation

For the main evaluation, we built all distributed benchmarks using the [release version](https://github.com/pc2/HPCC_FPGA/releases/tag/v0.5) of the benchmark suite.

We synthesized the benchmarks for the Nallatech 520N board using Intel FPGA SDK in version 21.2.0 and the BSP version 20.4.0 provided by BittWare.
All kernels for the BittWare 520N are synthesized with BSP 20.4.0_hpc, which does not come with support for the external channels.
The benchmarks b_eff, PTRANS and HPL are additonally synthesized with 19.4.0_max with support for external channels.
The host codes are compiled with GCC 8.3.0 and Intel MPI 2019 Update 6 Build 20191024. Configuration and generation of the build scripts is done using CMake 3.15.3.
All bitstreams were synthesized on a two-socket system equipped with Intel Xeon Gold 6148 CPUs and 192 GB of DDR4-2666 main memory.

The configuration using CMake is done with help of predefined configuration files that can be found in the folder `scripts/synthesis`.
Bash scripts are provided that where used to synthesize the kernels for the different devices. The scripts and configurations are ordered by benchmark.T

## Execution of the experiments

The experiments with the BittWare 520N where executed on up to 8 two-socket nodes equipped with Intel Xeon Gold 6148 CPUs and 192 GB of DDR4-2666 main memory.
Each node contains two Nallatech 520N equipped with Intel Stratix 10 GX2800 with access to four banks of 8 GB DDR4 SDRAM.
The FPGAs are connected to the host via x8 PCIe 3.0.
The CPUs use an Intel Omni Path network, whereas the FPGAs can exchange data over the four serial interfaces via a CALIENT S320 Optical Circuit Switch.
The optical switch is configured for the desired network topology over the workload manager SLURM before the execution of the benchmark.

In the folder `experiments`, batch scripts are given for the execution of every benchmark.
They provide information about the number of used FPGAs, the network topology and the input parameters of the benchmark.
Moreover, the raw outputs for every experiment are given in the same folder.
They contain the timings, the derived performance metrics and the results of the validation.
Moreover they contain information about the used network topology.

## Creating Plots from the data

The folder `scripts/plots` contains Jupyter notebooks with the code required to create the plots used in the paper from the raw output data in the `experiments` folder.
We used a Python 3.7 kernel. All installed packages are given in the `requirements.txt` file.

## Additional Experiments

We also executed HPL 2.2 provided and licenced by Intel on our system. We added the used HPL.dat and batch scripts as well as outputs in the folder experiments/cpu_hpl.


