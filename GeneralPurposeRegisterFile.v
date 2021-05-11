module GeneralPurposeRegisterFile(
	input clock,
	// Data input and output
	inout[7:0] data_bus,
	input[7:0] direct_addressing_input,
	output[7:0] alu_input_1,
	output[7:0] alu_input_2,
	output[15:0] indirect_addressing_output,
	// Control lines
	input read_from_data_bus,
	input write_to_data_bus,
	input[4:0] register_to_read_from_data_bus,
	input[4:0] register_to_write_to_data_bus
);
	reg[7:0] gpr0;
	reg[7:0] gpr1;
	reg[7:0] gpr2;
	reg[7:0] gpr3;
	reg[7:0] gpr4;
	reg[7:0] gpr5;
	reg[7:0] gpr6;
	reg[7:0] gpr7;
	reg[7:0] gpr8;
	reg[7:0] gpr9;
	reg[7:0] gpr10;
	reg[7:0] gpr11;
	reg[7:0] gpr12;
	reg[7:0] gpr13;
	reg[7:0] gpr14;
	reg[7:0] gpr15;
	reg[7:0] gpr16;
	reg[7:0] gpr17;
	reg[7:0] gpr18;
	reg[7:0] gpr19;
	reg[7:0] gpr20;
	reg[7:0] gpr21;
	reg[7:0] gpr22;
	reg[7:0] gpr23;
	reg[7:0] gpr24;
	reg[7:0] gpr25;
	reg[7:0] gpr26;
	reg[7:0] gpr27;
	reg[7:0] gpr28;
	reg[7:0] gpr29;
	reg[7:0] gpr30;
	reg[7:0] gpr31;
	
	reg[7:0] data_to_data_bus;
	assign data_bus = write_to_data_bus ? data_to_data_bus : 8'bzzzzzzzz;
	
	always@(posedge(clock))
	begin
		if (read_from_data_bus)
		begin
			case(register_to_read_from_data_bus)
				5'd0: gpr0 <= data_bus;
				5'd1: gpr1 <= data_bus;
				5'd2: gpr2 <= data_bus;
				5'd3: gpr3 <= data_bus;
				5'd4: gpr4 <= data_bus;
				5'd5: gpr5 <= data_bus;
				5'd6: gpr6 <= data_bus;
				5'd7: gpr7 <= data_bus;
				5'd8: gpr8 <= data_bus;
				5'd9: gpr9 <= data_bus;
				5'd10: gpr10 <= data_bus;
				5'd11: gpr11 <= data_bus;
				5'd12: gpr12 <= data_bus;
				5'd13: gpr13 <= data_bus;
				5'd14: gpr14 <= data_bus;
				5'd15: gpr15 <= data_bus;
				5'd16: gpr16 <= data_bus;
				5'd17: gpr17 <= data_bus;
				5'd18: gpr18 <= data_bus;
				5'd19: gpr19 <= data_bus;
				5'd20: gpr20 <= data_bus;
				5'd21: gpr21 <= data_bus;
				5'd22: gpr22 <= data_bus;
				5'd23: gpr23 <= data_bus;
				5'd24: gpr24 <= data_bus;
				5'd25: gpr25 <= data_bus;
				5'd26: gpr26 <= data_bus;
				5'd27: gpr27 <= data_bus;
				5'd28: gpr28 <= data_bus;
				5'd29: gpr29 <= data_bus;
				5'd30: gpr30 <= data_bus;
				5'd31: gpr31 <= data_bus;
			endcase
		end
	end
	
	always@(posedge(write_to_data_bus))
	begin
		case(register_to_write_to_data_bus)
			5'd0: data_to_data_bus <= gpr0;
			5'd1: data_to_data_bus <= gpr1;
			5'd2: data_to_data_bus <= gpr2;
			5'd3: data_to_data_bus <= gpr3;
			5'd4: data_to_data_bus <= gpr4;
			5'd5: data_to_data_bus <= gpr5;
			5'd6: data_to_data_bus <= gpr6;
			5'd7: data_to_data_bus <= gpr7;
			5'd8: data_to_data_bus <= gpr8;
			5'd9: data_to_data_bus <= gpr9;
			5'd10: data_to_data_bus <= gpr10;
			5'd11: data_to_data_bus <= gpr11;
			5'd12: data_to_data_bus <= gpr12;
			5'd13: data_to_data_bus <= gpr13;
			5'd14: data_to_data_bus <= gpr14;
			5'd15: data_to_data_bus <= gpr15;
			5'd16: data_to_data_bus <= gpr16;
			5'd17: data_to_data_bus <= gpr17;
			5'd18: data_to_data_bus <= gpr18;
			5'd19: data_to_data_bus <= gpr19;
			5'd20: data_to_data_bus <= gpr20;
			5'd21: data_to_data_bus <= gpr21;
			5'd22: data_to_data_bus <= gpr22;
			5'd23: data_to_data_bus <= gpr23;
			5'd24: data_to_data_bus <= gpr24;
			5'd25: data_to_data_bus <= gpr25;
			5'd26: data_to_data_bus <= gpr26;
			5'd27: data_to_data_bus <= gpr27;
			5'd28: data_to_data_bus <= gpr28;
			5'd29: data_to_data_bus <= gpr29;
			5'd30: data_to_data_bus <= gpr30;
			5'd31: data_to_data_bus <= gpr31;
		endcase
	end
	
endmodule
