############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project insertion_sort
set_top insertion_sort
add_files insertion_sort.c
add_files insertion_sort.c
add_files -tb insertion_sort_tb.c
add_files -tb insertion_sort_tb.c
open_solution "solution1"
set_part {xc7a100tcsg324-1} -tool vivado
create_clock -period 10 -name default
#source "./insertion_sort/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
