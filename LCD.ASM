
; PICBASIC PRO(TM) Compiler 2.47, (c) 1998, 2006 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\18F2420.INC"


; Define statements.
#define		OSC		 8
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
GOP             		EQU	RAM_START + 013h
RM1             		EQU	RAM_START + 014h
RM2             		EQU	RAM_START + 015h
RR1             		EQU	RAM_START + 016h
RR2             		EQU	RAM_START + 017h
RS1             		EQU	RAM_START + 018h
RS2             		EQU	RAM_START + 019h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _temp_ref        	_PORTA??2
#define _flow_ref        	_PORTA??3
#define _temp1           	_PORTA??0
#define _temp2           	_PORTA??1
#define _PORTA??2        	 PORTA, 002h
#define _PORTA??3        	 PORTA, 003h
#define _PORTA??0        	 PORTA, 000h
#define _PORTA??1        	 PORTA, 001h

; EEPROM data.


	INCLUDE	"LCD.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	000h, TRISC
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	048h
	LCDOUT?C	065h
	LCDOUT?C	06Ch
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	057h
	LCDOUT?C	06Fh
	LCDOUT?C	072h
	LCDOUT?C	06Ch
	LCDOUT?C	064h

	END
