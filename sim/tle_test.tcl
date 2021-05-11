proc setup {} {
	restart -force -nowave
	
	add wave *
	
	force -deposit in_clock 1 0, 0 {5ns} -repeat 10000
	property wave -radix hex *
}

proc ldi_test {} {
	setup
	add wave sim:/MajorProject/gprf/*
	add wave sim:/MajorProject/rom/*
	force -freeze reset 1
	run 10000
	force -freeze reset 0
	run 10000
	
	run 100000
	
	wave zoom full
}