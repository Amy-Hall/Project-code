
; PICBASIC PRO(TM) Compiler 2.47, (c) 1998, 2006 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\12F683.INC"


; Define statements.
#define		CCP1_REG		 GPIO
#define		CCP1_BIT		 2
#define		OSC		 4 

RAM_START       		EQU	00020h
RAM_END         		EQU	000BFh
RAM_BANKS       		EQU	00002h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000BFh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	021FFh

R0              		EQU	RAM_START + 000h
R1              		EQU	RAM_START + 002h
R2              		EQU	RAM_START + 004h
R3              		EQU	RAM_START + 006h
R4              		EQU	RAM_START + 008h
R5              		EQU	RAM_START + 00Ah
R6              		EQU	RAM_START + 00Ch
R7              		EQU	RAM_START + 00Eh
R8              		EQU	RAM_START + 010h
FLAGS           		EQU	RAM_START + 012h
GOP             		EQU	RAM_START + 013h
RM1             		EQU	RAM_START + 014h
RM2             		EQU	RAM_START + 015h
RR1             		EQU	RAM_START + 016h
RR2             		EQU	RAM_START + 017h
_analog_out      		EQU	RAM_START + 018h
_frequency       		EQU	RAM_START + 01Ah
T1              		EQU	RAM_START + 01Ch
_PORTL           		EQU	 GPIO
_PORTH           		EQU	 GPIO
_TRISL           		EQU	 TRISIO
_TRISH           		EQU	 TRISIO

; Constants.
_counter         		EQU	00004h
	INCLUDE	"COUNT_~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CB	040h, OSCCON

	LABEL?L	_mainloop	
	COUNT?CCW	_counter, 0FAh, _frequency
	DIV?WCW	_frequency, 001h, _frequency
	MUL?WCW	_frequency, 07Fh, T1
	DIV?WCW	T1, 0FAh, _analog_out
	MOVE?CW	07Fh, _analog_out
	HPWM?CWC	001h, _analog_out, 0F5h
	GOTO?L	_mainloop
	END?	

	END
