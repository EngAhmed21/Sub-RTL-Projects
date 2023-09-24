## ALSU

ALSU is a logic unit that can perform logical, arithmetic, and shift operations on input ports. Input ports A and B have various operations that can take place depending on the value of 
the opcode. Each input bit except for the clk and rst will be sampled at the rising edge before any 
processing so a D-FF is expected for each input bit at the design entry. The output of the ALSU is registered and is available at the rising edge of the clock.

Design Implementation:                                                                                                                                     
![Screenshot (628)](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/b10841ea-eabc-4ed7-8d52-86e3638a9a13)

Design Specs:                                                                                                     
- Inputs                                                                                                     
![Screenshot (629)](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/c412745c-cbd3-43c3-8776-e7f6a9048e2d)

- Outputs                                                                                                     
![Screenshot (630)](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/3dd91e44-a66b-466e-897d-c1d17f0721ca)

- Parameters                                                                                                     
![Screenshot (631)](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/83678ba9-27d8-4d67-a69c-eb391041201d)

- Opcode                                                                                                     
![Screenshot (632)](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/0c604e76-596a-4d9a-bc9d-883dc7b2ebc9)

- Invalid cases:                                                                                                     
  1. Opcode bits are set to 110 or 111                                                                                                     
  2. red_op_A or red_op_B are set to high and the opcode is not AND or XOR operation                                                                                                     
     
- Output when invalid cases occurs                                                                                                     
  1. leds are blinking                                                                                                     
  2. out bits are set to low                                                                                                     
