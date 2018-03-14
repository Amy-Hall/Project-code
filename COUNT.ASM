
; PICBASIC PRO(TM) Compiler 2.47, (c) 1998, 2006 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\18F2420.INC"


; Define statements.
#define		OSC		 4 
#define		LCD_DREG		 PORTC
#define		LCD_DBIT		 4
#define		LCD_RSREG		 PORTC
#define		LCD_RSBIT		 0
#define		LCD_EREG		 PORTC
#define		LCD_EBIT		 3
#define		LCD_BITS		 4
#define		LCD_LINES		 2

RAM_START       		EQU	00000h
RAM_END         		EQU	002FFh
RAM_BANKS       		EQU	00003h
BANK0_START     		EQU	00080h
BANK0_END       		EQU	000FFh
BANK1_START     		EQU	00100h
BANK1_END       		EQU	001FFh
BANK2_START     		EQU	00200h
BANK2_END       		EQU	002FFh
BANKA_START     		EQU	00000h
BANKA_END       		EQU	0007Fh

FLAGS           		EQU	RAM_START + 000h
R0              		EQU	RAM_START + 001h
R1              		EQU	RAM_START + 003h
R2              		EQU	RAM_START + 005h
R3              		EQU	RAM_START + 007h
R4              		EQU	RAM_START + 009h
R5              		EQU	RAM_START + 00Bh
R6              		EQU	RAM_START + 00Dh
R7              		EQU	RAM_START + 00Fh
R8              		EQU	RAM_START + 011h
T1              		EQU	RAM_START + 013h
GOP             		EQU	RAM_START + 015h
RM1             		EQU	RAM_START + 016h
RM2             		EQU	RAM_START + 017h
RR1             		EQU	RAM_START + 018h
RR2             		EQU	RAM_START + 019h
RS1             		EQU	RAM_START + 01Ah
RS2             		EQU	RAM_START + 01Bh
_flow_decimal    		EQU	RAM_START + 01Ch
_flow_integer    		EQU	RAM_START + 01Eh
_frequency       		EQU	RAM_START + 020h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _PORTB??5        	 PORTB, 005h

; EEPROM data.


	INCLUDE	"COUNT.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	040h, OSCCON
	MOVE?CB	000h, TRISC

	LABEL?L	_mainloop	
	COUNT?TCW	_PORTB??5, 003E8h, _frequency
	DIV?WCW	_frequency, 004h, _frequency
	MUL?WCW	_frequency, 01Eh, T1
	DIV?WCW	T1, 00D7Ah, _flow_integer
	MUL?WCW	_frequency, 01Eh, T1
	DIV?WCW	T1, 00159h, T1
	MOD?WCW	T1, 00Ah, _flow_decimal
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	046h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	071h
	LCDOUT?C	075h
	LCDOUT?C	065h
	LCDOUT?C	06Eh
	LCDOUT?C	063h
	LCDOUT?C	079h
	LCDOUT?C	03Ah
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_frequency
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	046h
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	077h
	LCDOUT?C	072h
	LCDOUT?C	061h
	LCDOUT?C	074h
	LCDOUT?C	065h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_integer
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_decimal
	LCDOUTDEC?	
	LCDOUT?C	04Ch
	LCDOUT?C	02Fh
	LCDOUT?C	06Dh
	GOTO?L	_mainloop
	END?	

	END
