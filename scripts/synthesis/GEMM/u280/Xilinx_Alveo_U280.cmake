# This file contains the default configuration for the Nallatech 520N board
# for the use with single precision floating point values.
# To use this configuration file, call cmake with the parameter
#
#     cmake [...] -DHPCC_FPGA_CONFIG="path to this file"
#


set(USE_MPI Yes CACHE BOOL "" FORCE)
set(USE_SVM No CACHE BOOL "" FORCE)
set(USE_HBM No CACHE BOOL "" FORCE)
set(FPGA_BOARD_NAME "xilinx_u280_xdma_201920_3" CACHE STRING "" FORCE)

set(XILINX_LINK_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.link.xilinx.gemm_base.ddr.generator.ini CACHE FILEPATH "" FORCE)
set(XILINX_COMPILE_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl CACHE FILEPATH "" FORCE)

set(XILINX_COMPILE_FLAGS "-j 40 --hls.pre_tcl ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl --kernel_frequency 200" CACHE STRING "" FORCE)

set(DEFAULT_MATRIX_SIZE 8 CACHE STRING "Default size of the used matrices" FORCE)
set(BLOCK_SIZE 256 CACHE STRING "Block size used in the FPGA kernel" FORCE)
set(GEMM_BLOCK 8 CACHE STRING "Block size used in the FPGA kernel for the cannon algorithm" FORCE)
set(DATA_TYPE float CACHE STRING "Data type used for kernel and host code" FORCE)
set(GLOBAL_MEM_UNROLL 8 CACHE STRING "Unrolling factor used to stream data" FORCE)
set(NUM_REPLICATIONS 3 CACHE STRING "Number of times the kernels will be replicated" FORCE)



