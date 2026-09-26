// ref https://wishbone-interconnect.readthedocs.io/en/latest/02_interface.html
interface slave_if #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic SCLK, // from SYSCON
    input logic SRESET 
);
    logic [ADDR_WIDTH-1:0] ADR_I; // Address from master
    logic [DATA_WIDTH-1:0] SDAT_O; // read data from slave
    logic [DATA_WIDTH-1:0] SDAT_I; // write data to: master to slave
    logic CYC_I; // cycle signal
    logic STB_I; // strobe signal
    logic WE_I; // write enable signal
    logic LOCK_I;
    logic [(DATA_WIDTH/8)-1:0] SEL_I;
    logic ACK_O; 
    logic ERR_O;
    logic RTY_O; //retry signal optional
    logic TGA_I; // optional
    logic TGC_I; // optional

    modport slave (
        input SCLK, SRESET, SDAT_I, ACK_I, ERR_I, RTY_I, ADR_I, CYC_I, STB_I, WE_I, SEL_I, LOCK_I, TGA_I, TGC_I,
        output SDAT_O, CYC_O, STB_O, WE_O, SEL_O, LOCK_O, ACK_O, ERR_O, RTY_O, TGA_I, TGC_I
    );
    
endinterface