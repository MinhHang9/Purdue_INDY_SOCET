// ref https://wishbone-interconnect.readthedocs.io/en/latest/02_interface.html

// Master interface
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
    modport intercon(
        input MCLK, MRESET, ADR_O, DAT_O, CYC_O, STB_O, WE_O, SEL_O, LOCK_O, TGA_O, TGC_O,
        output DAT_I, ACK_I, ERR_I, RTY_I
    );

endinterface


// Slave interface 
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
    
    modport intercon(
        input SCLK, SRESET, ADR_I, SDAT_I, CYC_I, STB_I, WE_I, SEL_I, LOCK_I, TGA_I, TGC_I,
        output SDAT_O, ACK_O, ERR_O, RTY_O
    );
    
endinterface
