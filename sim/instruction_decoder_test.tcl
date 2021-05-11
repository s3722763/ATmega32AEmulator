proc setup {} {
	restart -force -nowave
	
	add wave *
	property wave -radix hex *
}

proc test_ldi_decode {} {
	setup
	
	force -freeze instruction 16#EFFF
	run 10
	
	wave zoom full
}