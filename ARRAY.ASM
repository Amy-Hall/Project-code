
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
#define		ADC_BITS		 10
#define		ADC_SAMPLEUS		 50 

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
_adval           		EQU	RAM_START + 01Ah
_i               		EQU	RAM_START + 01Ch
_op              		EQU	RAM_START + 01Eh
_array           		EQU	RAM_START + 020h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC

; EEPROM data.


	INCLUDE	"ARRAY.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	001h, ADCON0
	MOVE?CB	000h, ADCON1
	MOVE?CB	087h, ADCON2
	MOVE?CB	0FFh, TRISA
	MOVE?CW	005h, _array
	MOVE?CW	00Ah, _array + 00002h
	MOVE?CW	00Fh, _array + 00004h
	MOVE?CW	014h, _array + 00006h
	MOVE?CW	019h, _array + 00008h
	MOVE?CW	01Eh, _array + 0000Ah
	MOVE?CW	023h, _array + 0000Ch
	MOVE?CW	028h, _array + 0000Eh
	MOVE?CW	02Dh, _array + 00010h
	MOVE?CW	032h, _array + 00012h
	MOVE?CW	037h, _array + 00014h
	MOVE?CW	03Ch, _array + 00016h
	MOVE?CW	041h, _array + 00018h
	MOVE?CW	000h, _i
	MOVE?CW	00190h, _adval
	CMPLE?WCL	_adval, 001F4h, L00001
	MOVE?WW	_array + 00002h, _op
	GOTO?L	L00002
	LABEL?L	L00001	
	CMPLE?WCL	_adval, 0C8h, L00003
	MOVE?WW	_array + 00014h, _op
	GOTO?L	L00004
	LABEL?L	L00003	
	MOVE?WW	_array + 00016h, _op
	LABEL?L	L00004	
	LABEL?L	L00002	
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00002h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00004h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00006h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00008h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 0000Ah
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 0000Ch
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 0000Eh
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00010h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00012h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00014h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00016h
	LCDOUTDEC?	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_array + 00018h
	LCDOUTDEC?	

	END
