proc test_rom_load {} {
	restart -force -nowave
	
	add wave *
	
	force -deposit clock 1 0, 0 {10ns} -repeat 20000
	force -freeze address_a 16#0
	force -freeze address_b 16#0
	
	run 50000
	force -freeze address_a 16#1
	force -freeze address_b 16#1
	run 50000
	
	force -freeze address_a 16#2
	force -freeze address_b 16#2
	run 50000
	
	force -freeze address_a 16#3
	force -freeze address_b 16#3
	run 50000
	
	force -freeze address_a 16#4
	force -freeze address_b 16#4
	run 50000
	
	force -freeze address_a 16#5
	force -freeze address_b 16#5
	run 50000
	
	force -freeze address_a 16#6
	force -freeze address_b 16#6
	run 50000
	
	force -freeze address_a 16#7
	force -freeze address_b 16#7
	run 50000
	
	wave zoom full
}