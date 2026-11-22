# 32-bit-RISC-V-Processor
Building a 32-bit RISC-V Processor using System Verilog.

GOAL: 

  1. Make the processor run precompiled C programs (simple ones for now).
  2. Learn System Verilog syntax
  3. Learn how a (simplified) processor works and runs
  4. Have this project serve as a "beginner" tutorial to others wanting to learn System Verilog


WHY: 

  1. I chose a more complex project to challenge me. I believe that learning by building something more advanced will allow me to learn more.
  2. Also, most System Verilog resources out there tend to use confusing terms (jargon) that makes it difficult for a beginner to grasp. Here I aim to provide a more "hands on" learning guide with in depth comments in my code, and break downs of what each part of the processor does.
  3. In the future, I plan to make a YouTube tutorial breakdown of this project, and for other projects in the future.


Progress:

  In the process of test benching my stuff (ALU, register, etc.)
  So far ALU stuff has been uploaded
  REG Stuff has been uploaded - 11/22/2026


ALU:

  In short, the ALU is the "calculator". In my project, I have taken 2 inputs that can handle 32 bit data (0s and 1s), and I have 1 32 bit output.
  The ALU first reads the first 4 bits of data to know what operation to do for the data recieved.
  For a RISC-V 32 bit processor, that should be 40 total operators. However, implementing alot of those will take a lot of time.
  So I narrowed it down to 10 basic ones to keep things easy-ish.
