#! /bin/env python
#
# Change the torus width in line 12, save the file and execute it.
# It will output a run script for the chosen configuration to stdout.
#
#

from jinja2 import Environment, FileSystemLoader
env = Environment(loader=FileSystemLoader("."))
template = env.get_template("run_ptrans_template.jinja")

# Change torus width here
torus_width=4

# This will be computed based on torus whidth specified in torus_width
width=torus_width
n = torus_width ** 2
N=(n+1)//2
fpgas=["fpga-%04d" % i for i in range(N)]

# print execution script created from template for given torus width
print(template.render(n=n, width=width ,N=N,fpgas=fpgas))