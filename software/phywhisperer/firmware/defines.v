//////////////////////////////////////////////////////////////////////////////////
// Company: NewAE
// Engineer: Jean-Pierre Thibault
// 
// Create Date: 
// Design Name: 
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define REG_SNIFF_FIFO_RD            6'h01
`define REG_TIMESTAMPS_DISABLE       6'h02
`define REG_ARM                      6'h03
`define REG_PATTERN                  6'h04
`define REG_PATTERN_MASK             6'h05
`define REG_TRIGGER_ENABLE           6'h06
`define REG_PATTERN_BYTES            6'h07
`define REG_CAPTURE_LEN              6'h08
`define REG_SNIFF_FIFO_STAT          6'h09
`define REG_TRIGGER_DELAY            6'h0a
`define REG_TRIGGER_WIDTH            6'h0b
`define REG_USB_SPEED                6'h0c
`define REG_USB_AUTO_DEFAULTS        6'h0d
`define REG_CAPTURE_DELAY            6'h0e
`define REG_BUILDTIME                6'h0f
`define REG_USB_AUTO_WAIT1           6'h10
`define REG_USB_AUTO_WAIT2           6'h11
`define REG_TRIG_CLK_PHASE_SHIFT     6'h12
`define REG_STAT_PATTERN             6'h13
`define REG_STAT_MATCH               6'h14
`define REG_NUM_TRIGGERS             6'h15
`define REG_USERIO_DATA              6'h16
`define REG_USERIO_PWDRIVEN          6'h17


// FIFO bitfields:
//                   31 30 29 28 27 26 25 24   23 22 21 20 19 18 17 16   15 14 13 12 11 10  9  8   7  6  5  4  3  2  1  0
//                 +------------------------++------------------+-----++------------------------++---------------+--------+
// data command:   |         zeros          ||    FIFO status   | 0 0 ||    USB  data  byte     ||  USB status   |  time  |
//                 +------------------------++------------------+-----++------------------------++---------------+--------+
// stat command:   |         zeros          ||    FIFO status   | 0 1 ||        zeros           ||  USB status   |  time  |
//                 +------------------------++------------------+-----++------------------------++---------------+--------+
// time command:   |         zeros          ||    FIFO status   | 1 0 ||              long     time      stamp            |
//                 +------------------------++------------------+-----++------------------------++------------------------+
// stream command: |         zeros          ||    FIFO status   | 1 1 ||      stream status     ||          zeros         |
//                 +------------------------++------------------+-----++------------------------++------------------------+
`define FE_FIFO_CMD_DATA 2'b00
`define FE_FIFO_CMD_STAT 2'b01
`define FE_FIFO_CMD_TIME 2'b10
`define FE_FIFO_CMD_STRM 2'b11

`define FE_FIFO_CMD_START 16
`define FE_FIFO_CMD_BIT_LEN 2

`define FE_FIFO_TIME_START 0
`define FE_FIFO_SHORTTIME_LEN 3
`define FE_FIFO_FULLTIME_LEN 16

`define FE_FIFO_USB_STATUS_BITS_START 3
`define FE_FIFO_USB_STATUS_BITS_LEN 5
`define FE_FIFO_RXACTIVE_BIT 3
`define FE_FIFO_RXERROR_BIT 4
`define FE_FIFO_SESSVLD_BIT 5
`define FE_FIFO_SESSEND_BIT 6
`define FE_FIFO_VBUSVLD_BIT 7

`define FE_FIFO_DATA_START 8
`define FE_FIFO_DATA_LEN 8

`define FE_FIFO_STRM_EMPTY 8'h0

// FIFO status register bits:
`define FIFO_STAT_EMPTY 0
`define FIFO_STAT_UNDERFLOW 1
`define FIFO_STAT_EMPTY_THRESHOLD 2
`define FIFO_STAT_FULL 3
`define FIFO_STAT_OVERFLOW_BLOCKED 4
`define FIFO_STAT_CAPTURE_DONE 5

// and this is where those FIFO status bits show up in the FIFO read,
// as opposed to register read:
// (avoiding refering to `FIFO_STAT_* to keep our Python parser stupid simple)
`define FE_FIFO_STAT_START 18
`define FE_FIFO_STAT_OFFSET 2
`define FE_FIFO_STAT_EMPTY 2
`define FE_FIFO_STAT_UNDERFLOW 3
`define FE_FIFO_STAT_EMPTY_THRESHOLD 4
`define FE_FIFO_STAT_FULL 5
`define FE_FIFO_STAT_OVERFLOW_BLOCKED 6
`define FE_FIFO_STAT_CAPTURE_DONE 7

// USB speed definitions
`define USB_SPEED_AUTO 0
`define USB_SPEED_LS 1
`define USB_SPEED_FS 2
`define USB_SPEED_HS 3

