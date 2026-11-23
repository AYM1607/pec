# Engineering Log

Very loosely formatted and raw notes in reverse chronological order.

## 11/21/26

I want to understand in depth what this stanza from https://tinytapeout.com/hdl/fpga_vs_asic means:

```
In an FPGA, registers are ‘free’ in that every LUT has a flop. So people are used to doing lots of pipelining and registering. But in an ASIC, these are the most ’expensive’ cells in terms of area, so it’s better to do more with combinational and only use flops where necessary. This might mean doing deeper levels of combinational logic with fewer flops in between.
```

I'm still rusty on digital design, and want to make sure I'm not taking wrong turns early on.

Found out that the docs generation action fails if there's not at least one documented pin in the design, the error wasn't terribly useful: https://github.com/TinyTapeout/tt-support-tools/blob/0922544e6c7f6126047c3fba720b0437fa32a1b8/project_info.py#L27
