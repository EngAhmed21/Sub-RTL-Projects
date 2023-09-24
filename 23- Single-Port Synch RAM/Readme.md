## Single-Port Synch RAM

This is the design of a generic single-port synchronous RAM.                                                                 

It has a 3 parameters:
1. WIDTH >> specifies the size of the word
2. DEPTH >> specifies the depth of the memory
3. ADDR >> specifies the number of bits of the address

It has 2 control signals WE and RE 
1. WE >> write enable
2. RE >> read enable
3. The write enable has the highest priority
