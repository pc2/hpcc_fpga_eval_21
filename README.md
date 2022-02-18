# Experiment Description

The whole experiment was executed on the Noctua cluster of the Paderborn Center for Parallel Computing (https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua/).
Up to 13 of the FPGA nodes were used to execute the experiments.
In addition, all benchmarks were executed on the Xilinx FPGA Evaluation System at ETH Zurich (https://xilinx.github.io/xacc/ethz.html).
Up to 4 Xilinx Alveo U280 are used in the experiment, which corresponds to the total number of available U280 boards on this system at the time of writing.

## Synthesis and Compilation

For the main evaluation, we built all distributed benchmarks using the [release version](https://github.com/pc2/HPCC_FPGA/releases/tag/v0.5.1) of the benchmark suite.

The exact toolchain versions, compiler versions, and hardware specifications on both systems is given in the paper.
For Noctua, Intel SDK 21.2.0 and BSP 20.4.0 are used with GCC 8.3.0 and Intel MPI 2019 Update 6 Build 20191024.
For the Xilinx system, Vitis 2020.2, shell xilinx_u280_xdma_201920_3, and XRT 2.9 are used with GCC 7.5.0 and OpenMPI 2.1.1.

The configuration using CMake is done with help of predefined configuration files that can be found in the folder `scripts/synthesis`.
Bash scripts that where used to synthesize the kernels for the different devices are profided in the same folder. The scripts and configurations are ordered by benchmark.
The scripts will also apply additional patches to the benchmark source code, where required.
The patches can be found in the folder `patches`.
Most of the patches are also integrated in v0.5.2 of HPCC FPGA. This version can also be used instead to redo the experiments.

Synthesis results are given for every benchmark in the folder `synthesis_artifacts`.
It contains reports, host binaries, and bitstreams for every benchmark on both systems.
Note, that the host binaries are compiled natively for the target systems!
To prevent time consuming re-synthesis, the bitstreams provided here can be used to redo the experiments.

## Execution of the experiments

In the folder `experiments`, batch scripts are given for the execution of every benchmark.
They provide information about the number of used FPGAs, the network topology and the input parameters of the benchmark.
Moreover, the raw outputs for every experiment are given in the same folder.
They contain the timings, the derived performance metrics and the results of the validation.
Moreover they contain information about the used network topology.
## Creating Plots from the data

The folder `scripts/plots` contains Jupyter notebooks with the code required to create the plots used in the paper from the raw output data in the `experiments` folder.
We used a Python 3.7 kernel. All installed packages are given in the `requirements.txt` file.

## Additional Experiments

We also executed HPL 2.2 provided and licenced by Intel on our system. We added the used HPL.dat and batch scripts as well as outputs in the folder `experiments/cpu_hpl`.


