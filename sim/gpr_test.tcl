proc setup {} {
	restart -force -nowave
	
	add wave *
	
	force -deposit clock 1 0, 0 {5ns} -repeat 10000
	property wave -radix hex *
}

proc test_read_from_data_bus {} {
	setup
	
	force -freeze data_bus 16#FF
	force -freeze read_from_data_bus 1
	force -freeze register_to_read_from_data_bus 10#31
	
	run 10000
	
	wave zoom full
}