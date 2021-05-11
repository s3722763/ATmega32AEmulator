module MajorProject(
	input in_clock,
	input reset,
	output led0,
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,
	output led6,
	output led7
);
	wire[7:0] data_bus;
	wire clock;
	assign clock = in_clock & !reset;
	
	// ROM - For program code
	wire[7:0] rom_data_lsb;
	wire[7:0] rom_data_msb;
	wire[15:0] rom_data;
   reg[13:0] rom_address;
	ROM rom(.clock(clock), .address_a(rom_address), .address_b(rom_address + 1), .q_a(rom_data_lsb), .q_b(rom_data_msb));
	assign rom_data = {rom_data_msb, rom_data_lsb};
	
	reg[15:0] instruction_register;
	reg[15:0] instruction_decoder_input;
	wire[4:0] gpr_to_write_to;
	wire[4:0] gpr_to_read_from;
	wire enable_gpr_write, enable_gpr_read;
	
	InstructionDecoder id(
		.instruction(instruction_decoder_input), 
		.data_bus(data_bus),
		.gpr_register_to_write_to_out(gpr_to_write_to),
		.gpr_register_to_read_from_out(gpr_to_read_from),
		.enable_write_from_gpr_to_data_bus_out(enable_gpr_write),
		.enable_read_from_data_bus_to_gpr_out(enable_gpr_read)
	);
	
	GeneralPurposeRegisterFile gprf(
		.clock(clock),
		.data_bus(data_bus),
		.register_to_write_to_data_bus(gpr_to_read_from),
		.register_to_read_from_data_bus(gpr_to_write_to),
		.read_from_data_bus(enable_gpr_read),
		.write_to_data_bus(enable_gpr_write)
	);
	
	RAM ram(.clock(clock));
	
	always @(posedge(clock), posedge(reset))
	begin
		if (reset == 1'b1)
		begin
			rom_address <= 14'b0;
			instruction_decoder_input <= 16'b0;
		end
		else
		begin
			rom_address <= rom_address + 14'd2;
			instruction_decoder_input <= instruction_register;
		end
	end
	
	always @(rom_data)
	begin
		instruction_register <= rom_data;
	end
	
endmodule
