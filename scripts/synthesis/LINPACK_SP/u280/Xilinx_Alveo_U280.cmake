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

set(XILINX_LINK_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.link.xilinx.hpl_torus.ddr.generator.ini CACHE FILEPATH "" FORCE)
set(XILINX_COMPILE_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl CACHE FILEPATH "" FORCE)

set(XILINX_COMPILE_FLAGS "-j 40 --hls.pre_tcl ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl --kernel_frequency 150" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-march=native" CACHE STRING "CXX compile flags used to optimize code to architecture" FORCE)

set(DEFAULT_MATRIX_SIZE 1024 CACHE STRING "Default matrix size" FORCE)
set(LOCAL_MEM_BLOCK_LOG 8 CACHE STRING "Used to define the width and height of the block stored in local memory" FORCE)
set(REGISTER_BLOCK_LOG 3 CACHE STRING "Size of the block that will be manipulated in registers" FORCE)
set(NUM_REPLICATIONS 2 CACHE STRING "Number of times the matrix multiplication kernel will be replicated" FORCE)

set(USE_DEPRECATED_HPP_HEADER Yes CACHE BOOL "Use cl.hpp instead of cl2.hpp" FORCE)




