module forwardingUnit( input[4:0)]rs1_ID,
  input[4:0]rs2_ID,
  input[4:0]EX_MEM_rd,
  input[4:0]MEM_WB_rd,
  input EX_MEM_reg_write,
  input MEM_WB_reg_write,
  output reg[1:0]forward_A,
  output reg[1:0]forward_B);

always(*)begin
    if(reg_write_EX_MEM)begin
        if((rs1_ID!=0)&&(rs1_ID==rd_EX_MEM))
        begin
        forward_A=2'b02;//memory  
        end
        else forward_A=2'b00;
        if((rs2_ID!=0)&&(rs2_ID==rd_EX_MEM))
        begin
        forward_B=2'b02;//memory
        end
        else forward_b'2'b00;
    end

    else if(reg_write_MEM_WB)begin
        if ((rs1_ID!=0)&&(rs1_ID==rd_EX_MEM))
        begin
        forward_A=2'b01;
        end
        else forward_A=2'b00;
        if ((rs2_ID!=0)&&(rs2_ID==rd_EX_MEM))
        begin
        forward_B=2'b01;//wb
        end
        else forward_B=2'b00;
        end

    else
        begin
        forward_A=2'b00;
        forward_B=2'b00;
    end
end



end module