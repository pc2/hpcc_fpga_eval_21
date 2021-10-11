
# Allow reordeing of math operations to increase parallelism
config_compile -unsafe_math_optimizations

# Maximize memory ports
config_interface -m_axi_auto_max_ports=1
