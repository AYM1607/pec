`default_nettype none

module ulx3s_top (
    input logic clk_25mhz,
    output logic [7:0] led
);

    logic clk_50mhz;
    logic pll_lock;

    // The PEC ASIC runs at 50MHz, match it with a PLL
    // so we can stay time accurate during fpga prototyping.
    //
    // f_CLKOP = Fin / CLKI_DIV * CLKFB_DIV = 25MHz / 1 * 2 = 50MHz
    // f_VCO = f_CLKOP * CLKOP_DIV = 400MHz (within the 400..800MHz range)
    //
    // Derived from prjtrellis: https://github.com/YosysHQ/prjtrellis/blob/9febd0ee5e86ebe8e7342c98ef68419ebea24e24/examples/ulx3s/pll_120.v#L11-L45
    (* ICP_CURRENT="12" *)
    (* LPF_RESISTOR="8" *)
    (* MFG_ENABLE_FILTEROPAMP="1" *)
    (* MFG_GMCREF_SEL="2" *)
    EHXPLLL #(
        .CLKI_DIV   (1),
        .CLKFB_DIV  (2),
        .CLKOP_DIV  (8),
        .FEEDBK_PATH("CLKOP"),
        .PLL_LOCK_MODE(0),
        .INT_LOCK_STICKY("DISABLED")
    ) pll_50mhz (
        .CLKI   (clk_25mhz),
        .CLKOP  (clk_50mhz),
        .CLKFB  (clk_50mhz),
        .LOCK   (pll_lock),
        // These are active high, don't let them float.
        .RST    (1'b0),
        .STDBY  (1'b0)
    );

    // TODO(jmug): The wrapper should not polish the reset,
    // pass reset button & pll_lock raw to tt_um module and
    // build this synchronizer inside, keeping it here just for testing.
    logic [2:0] rst_sync_n;
    always_ff @(posedge clk_50mhz or negedge pll_lock)
        if (!pll_lock) rst_sync_n <= 3'b000; // Hold it in reset until pll locks.
        else                        rst_sync_n <= {rst_sync_n[1:0], 1'b1};

    logic synced_rst_n;
    assign synced_rst_n = rst_sync_n[2];
    
    logic [26:0] cnt;
    always_ff @(posedge clk_50mhz)
        if (synced_rst_n)   cnt <= cnt + 1;
        else                cnt <= 27'b0;

    assign led = {cnt[27:19]};

endmodule
