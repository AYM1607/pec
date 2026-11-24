<p align="center">
  <img src="assets/pec_logo.png" alt="Logo composed of a bird pecking down on the letters PEC" width="50%" />
</p>


![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

PEC (pronounced peck) is a my entry to [Jane Street's chip design competition](https://blog.janestreet.com/protocol-emulator-asic-competition/). It's binary compatible with the RP2040 PIO ISA (v0), with (hopefully) a few twists if I have enough time. The competition calls out for novelty and flexibility, given I'm a late solo competitor, novelty of the design is pretty much out the window, and I'll have to make up for it on my writeup.

Being binary compatible with PIO v0 means that I'm outsourcing the ISA design to RPi, and I can focus on microarchitecutre, simulation, and verification.

I'm using a ULX3S as a prototyping platform, and Pico 2 that'll serve as a quasi [TT ETR demo board](https://tinytapeout.com/guides/get-started-demoboard-etr/).

### Resources

I'm relying heavily on Harris & Harris' _Digital Design and Computer Architecture_ to dust off my theory, and [HDLBits](https://hdlbits.01xz.net) to get my fingers used to writing SystemVerilog.

### AI Usage

My digital design skills are a bit rusty, and I got started in late November (with a deadline of Jan 18th), so I'll have to leverage AI if I want to have a change to finish in time. Here are my hard guidelines:
- All HDL will be written by hand.
- Docs will be written by hand.
- AI may be used to aid in debugging, especially when it comes to tooling.
- Any "chore" task that does not directly affect the final design (like setting up tooling, configuring and debugging CI, etc), may be handed off to AI.

Additionally, I'll be using GLM 5.3 (maybe 5.4 if it comes out during my development) and OpenCode exclusively. This to evaluate the digital design capabilities of SOTA open models on an open harness.
