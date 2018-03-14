
; PICBASIC PRO(TM) Compiler 2.47, (c) 1998, 2006 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\12F683.INC"


; Define statements.
#define		CCP1_REG		 GPIO
#define		CCP1_BIT		 2

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
#define _TRISIO??4       	 TRISIO, 004h
#define _TRISIO??2       	 TRISIO, 002h
#define _GPIO??4         	 GPIO, 004h
#define _GPIO??2         	 GPIO, 002h

; Constants.
_counter         		EQU	00004h
_out             		EQU	00002h
	INCLUDE	"COUNT_~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CT	001h, _TRISIO??4
	MOVE?CT	000h, _TRISIO??2

	LABEL?L	_mainloop	
	COUNT?CCW	_counter, 003E8h, _frequency
	CMPNE?TCL	_GPIO??4, 000h, L00001
	HIGH?T	_GPIO??2
	GOTO?L	L00002
	LABEL?L	L00001	
	LOW?T	_GPIO??2
	LABEL?L	L00002	
	DIV?WCW	_frequency, 001h, T1
	SUB?WCW	T1, 0C8h, _frequency
	MUL?WCW	_frequency, 0FFh, T1
	DIV?WCW	T1, 0C8h, _analog_out
	GOTO?L	_mainloop
	END?	

	END
