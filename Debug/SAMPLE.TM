* TINY Compilation to TM Code
* File: SAMPLE.tm
* Standard prelude:
  0:     LD  6,0(0) 	load maxaddress from location 0
  1:     ST  0,0(0) 	clear location 0
* End of standard prelude.
  2:     IN  0,0,0 	read integer value
  3:     ST  0,0(5) 	read: store value
* -> assign
* -> Const
  4:    LDC  0,1(0) 	load const
* <- Const
  5:     ST  0,1(5) 	assign: store value
* <- assign
* ->while
* while: jump after body comes back here
* -> Op
* -> Const
  6:    LDC  0,0(0) 	load const
* <- Const
  7:     ST  0,0(6) 	op: push left
* -> Id
  8:     LD  0,0(5) 	load id value
* <- Id
  9:     LD  1,0(6) 	op: load left
 10:    SUB  0,1,0 	op <
 11:    JLT  0,2(7) 	br if true
 12:    LDC  0,0(0) 	false case
 13:    LDA  7,1(7) 	unconditional jmp
 14:    LDC  0,1(0) 	true case
* <- Op
* while: jump to end belongs here
* -> assign
* -> Op
* -> Id
 16:     LD  0,1(5) 	load id value
* <- Id
 17:     ST  0,0(6) 	op: push left
* -> Id
 18:     LD  0,0(5) 	load id value
* <- Id
 19:     LD  1,0(6) 	op: load left
 20:    MUL  0,1,0 	op *
* <- Op
 21:     ST  0,1(5) 	assign: store value
* <- assign
* -> assign
* -> Op
* -> Id
 22:     LD  0,0(5) 	load id value
* <- Id
 23:     ST  0,0(6) 	op: push left
* -> Const
 24:    LDC  0,1(0) 	load const
* <- Const
 25:     LD  1,0(6) 	op: load left
 26:    SUB  0,1,0 	op -
* <- Op
 27:     ST  0,0(5) 	assign: store value
* <- assign
 28:    LDA  7,-23(7) 	jmp to the while test
 15:    JEQ  0,13(7) 	while: jmp to the end
*  < -while
* -> Id
 29:     LD  0,1(5) 	load id value
* <- Id
 30:    OUT  0,0,0 	write ac
* End of execution.
 31:   HALT  0,0,0 	
