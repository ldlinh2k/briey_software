  assign apbCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign apbCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign apbCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign apbCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (posedge toplevel_io_axiClk) begin
    case(io_apb_PADDR)
      5'b00000 : begin
        if(apbCtrl_doWrite)begin
          prince_module_cs_driver <= _zz_1_[0];
        end
      end
      5'b00100 : begin
        if(apbCtrl_doWrite)begin
          prince_module_we_driver <= _zz_2_[0];
        end
      end
      5'b01000 : begin
        if(apbCtrl_doWrite)begin
          prince_module_address_driver <= io_apb_PWDATA[7 : 0];
        end
      end
      5'b01100 : begin
        if(apbCtrl_doWrite)begin
          prince_module_write_data_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

endmodule
