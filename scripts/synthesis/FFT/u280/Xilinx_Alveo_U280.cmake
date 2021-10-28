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

set(XILINX_LINK_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.link.xilinx.fft1d_float_8.ddr.ini CACHE FILEPATH "" FORCE)
set(XILINX_COMPILE_SETTINGS_FILE ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl CACHE FILEPATH "" FORCE)
set(XILINX_COMPILE_FLAGS "-j 40 --hls.pre_tcl ${CMAKE_CURRENT_LIST_DIR}/settings.compile.xilinx.u280.tcl" CACHE STRING "" FORCE)


set(LOG_FFT_SIZE 9 CACHE STRING "Log2 of the used FFT size" FORCE)
set(NUM_REPLICATIONS 1 CACHE STRING "Number of kernel replications" FORCE)


