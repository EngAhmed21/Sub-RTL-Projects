## Adder/Subtractor

Design Specs:                                                                                                                                                                                                                                                                                                                           
This is the design of a generic binary adder/subtractor with 3 inputs and 2 outputs                                                                                                    
Parameter (WIDTH)  >> specifies the width of the inputs (A, B) and the outputs (Sum)                                                                                                    
Inputs             >> A, B, Cin                                                                                                                                                      
Outputs            >> Sum, Cout   

This design consists of three levels:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
1- Half Adder: A half adder is a digital logic circuit that performs binary addition of two single-bit binary numbers.
It has two inputs, A and B, and two outputs, SUM and CARRY. The SUM output is the least significant bit (LSB) of the result,
while the CARRY output is the most significant bit (MSB) of the result, indicating whether there was a carry-over from the addition of the two inputs. 
The half adder can be implemented using basic gates such as XOR and AND gates.
- The truth table:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
![ha_truth-300x235](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/00642cfe-9930-49dd-a33c-ed497f6814d8)

- Implementation:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
![Half_Adder](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/6ebb7659-cb26-45f1-a16a-fe77a5e51bfa)

2- Full Adder: Full Adder is the adder that adds three inputs and produces two outputs.
The first two inputs are A and B and the third input is an input carry as C-IN.
The output carry is designated as C-OUT and the normal output is designated as S which is SUM.
The C-OUT is also known as the majority 1’s detector, whose output goes high when more than one input is high.
- The truth table:                                                                                                                                                                                                                                                                                                      
![2-41](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/7e7f15f1-314e-433f-b23f-b0256c12977e)

- Implementation using half adders:                                                                                                                                                                                                                                                                                                      
![4-34](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/b39f0f86-0dbd-43b3-b6fb-a63ba6a09db5)

3- Binary Adder/Subtractor: A Binary Adder-Subtractor is capable of both the addition and subtraction of binary numbers in one circuit itself.
The operation is performed depending on the binary value the control signal holds.
It is one of the components of the ALU (Arithmetic Logic Unit). 

- Implementation using full adders:                                                                                                                                                                                                                                                                                                                           
![dig51](https://github.com/EngAhmed21/Sub-RTL-Projects/assets/90782588/9b434f05-5ad8-4e3c-b5a6-44fd85a41d77)
