## Timer

A timer is a counter with a Delay Value and an output done. The output done is high when the counter reaches the count of the delay value. 
A Timer is used for producing precise time delay. Secondly, it can be used to repeat or initiate an action after/at a known period of time.
This feature is very commonly used in several applications.
An example could be setting up an alarm which triggers at a point of time or after a period of time.

Design Specs:                                                                                                                                          
This is the design of a generic timer                                                                                                                                                                      
Parameter (DELAY) >> specifies the delay provided by the timer                                                                                                                                                                      
Inputs >> clk, rstn                                                                                                                                                                      
Output >> done                                                                                                                                                                      
