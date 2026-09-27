// ref https://wishbone-interconnect.readthedocs.io/en/latest/02_interface.html

// Master interface
interface wishbone_if #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic SCLK, // from SYSCON
    input logic SRESET 
);
    logic [ADDR_WIDTH-1:0] ADR; // Address 
    logic [DATA_WIDTH-1:0] WDAT; // write data
    logic [DATA_WIDTH-1:0] RDAT; // read: slave to master
    logic CYC; // cycle signal
    logic STB; // strobe signal
    logic WE; // write enable signal (1 for write, 0 for read)
    logic [(DATA_WIDTH/8)-1:0] SEL;
    logic ACK; 
    logic ERR;
    logic RTY; //retry signal optional
    logic LOCK;
    logic TGA; // optional
    logic TGC; // optional

    modport master (
        input SCLK, SRESET, RDAT, ACK, ERR, RTY,
        output ADR, CYC, STB, WE, SEL, LOCK, TGA, TGC, WDAT
    );
    modport slave (
        input SCLK, SRESET, WDAT, ADR, CYC, STB, WE, SEL, LOCK, TGA, TGC,
        output RDAT, ACK, ERR, RTY
    );

endinterface

