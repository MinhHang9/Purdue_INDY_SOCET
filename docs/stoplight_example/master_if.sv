// ref https://wishbone-interconnect.readthedocs.io/en/latest/02_interface.html
interface master_if #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic MCLK, // from SYSCON
    input logic MRESET 
);
    logic [ADDR_WIDTH-1:0] ADR_O; // Address 
    logic [DATA_WIDTH-1:0] MDAT_O; // write data
    logic [DATA_WIDTH-1:0] MDAT_I; // read: slave to master
    logic CYC_O; // cycle signal
    logic STB_O; // strobe signal
    logic WE_O; // write enable signal (1 for write, 0 for read)
    logic [(DATA_WIDTH/8)-1:0] SEL_O;
    logic ACK_I; 
    logic ERR_I;
    logic RTY_I; //retry signal optional
    logic LOCK_O;
    logic TGA_O; // optional
    logic TGC_O; // optional

    modport master (
        input MCLK, MRESET, DAT_I, ACK_I, ERR_I, RTY_I,
        output ADR_O, DAT_O, CYC_O, STB_O, WE_O, SEL_O, LOCK_O, TGA_O, TGC_O
    );
endinterface