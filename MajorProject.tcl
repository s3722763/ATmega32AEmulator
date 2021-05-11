# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: MajorProject.tcl
# Generated on: Tue May 11 16:34:30 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "MajorProject"]} {
		puts "Project MajorProject is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists MajorProject]} {
		project_open -revision MajorProject MajorProject
	} else {
		project_new -revision MajorProject MajorProject
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "13:08:20  APRIL 28, 2021"
	set_global_assignment -name LAST_QUARTUS_VERSION "18.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name VERILOG_FILE MajorProject.v
	set_global_assignment -name VERILOG_FILE RAM.v
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP "-40"
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSEBA6U23I7DK
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION ON
	set_global_assignment -name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION ON
	set_global_assignment -name VERILOG_FILE GeneralPurposeRegisterFile.v
	set_global_assignment -name VERILOG_FILE InstructionDecoder.v
	set_global_assignment -name QIP_FILE ROM.qip
	set_location_assignment PIN_W15 -to led0
	set_location_assignment PIN_AA24 -to led1
	set_location_assignment PIN_V16 -to led2
	set_location_assignment PIN_V15 -to led3
	set_location_assignment PIN_AF26 -to led4
	set_location_assignment PIN_AE26 -to led5
	set_location_assignment PIN_Y16 -to led6
	set_location_assignment PIN_AA23 -to led7
	set_location_assignment PIN_W20 -to in_clock
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led6
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
