
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
#define		ADC_BITS		 10
#define		ADC_SAMPLEUS		 50 
#define		CCP1_REG		 PORTC
#define		CCP1_BIT		 2

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
_flow_ref        		EQU	RAM_START + 01Eh
_flow_val        		EQU	RAM_START + 020h
_frequency       		EQU	RAM_START + 022h
_pwm_val         		EQU	RAM_START + 024h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _TRISC??2        	 TRISC, 002h
#define _CCP1CON??4      	 CCP1CON, 004h
#define _pwm_val??0      	_pwm_val, 000h
#define _CCP1CON??5      	 CCP1CON, 005h
#define _pwm_val??1      	_pwm_val, 001h
#define _PORTB??5        	 PORTB, 005h

; EEPROM data.


	INCLUDE	"WATER_~2.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	040h, OSCCON
	MOVE?CB	000h, ADCON1
	MOVE?CB	087h, ADCON2
	MOVE?CB	0FFh, TRISA
	MOVE?CB	000h, TRISC
	MOVE?CT	000h, _TRISC??2
	MOVE?CB	00Ch, CCP1CON
	MOVE?CB	007h, T2CON
	MOVE?CB	0FFh, PR2
	MOVE?CW	064h, _pwm_val
	MOVE?TT	_pwm_val??0, _CCP1CON??4
	MOVE?TT	_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_pwm_val, 002h, CCPR1L

	LABEL?L	_main	
	MOVE?CB	00Dh, ADCON0
	ADCIN?CW	003h, _flow_ref
	MUL?WCW	_flow_ref, 02Ch, T1
	DIV?WCW	T1, 00400h, _flow_ref
	GOSUB?L	_get_flowrate
	GOSUB?L	_get_water_pwm
	MOVE?TT	_pwm_val??0, _CCP1CON??4
	MOVE?TT	_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_pwm_val, 002h, CCPR1L
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	066h
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	077h
	LCDOUT?C	03Dh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_val
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	066h
	LCDOUT?C	072h
	LCDOUT?C	071h
	LCDOUT?C	03Dh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_frequency
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	066h
	LCDOUT?C	03Dh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_ref
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	070h
	LCDOUT?C	077h
	LCDOUT?C	06Dh
	LCDOUT?C	03Dh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_pwm_val
	LCDOUTDEC?	
	GOTO?L	_main
	END?	

	LABEL?L	_get_flowrate	
	COUNT?TCW	_PORTB??5, 0FAh, _frequency
	DIV?WCW	_frequency, 001h, _frequency
	MUL?WCW	_frequency, 078h, T1
	DIV?WCW	T1, 00564h, _flow_val
	RETURN?	

	LABEL?L	_get_water_pwm	
	CMPGE?WWL	_flow_val, _flow_ref, L00001
	CMPGE?WCL	_pwm_val, 078h, L00003
	SUB?WWW	_flow_ref, _flow_val, T1
	CMPLE?WCL	T1, 005h, L00005
	SUB?WWW	_flow_ref, _flow_val, T1
	DIV?WCW	T1, 005h, T1
	ADD?WWW	_pwm_val, T1, _pwm_val
	GOTO?L	L00006
	LABEL?L	L00005	
	ADD?WCW	_pwm_val, 001h, _pwm_val
	LABEL?L	L00006	
	GOTO?L	L00004
	LABEL?L	L00003	
	MOVE?CW	078h, _pwm_val
	LABEL?L	L00004	
	LABEL?L	L00001	
	CMPLE?WWL	_flow_val, _flow_ref, L00007
	CMPLE?WCL	_pwm_val, 032h, L00009
	SUB?WWW	_flow_val, _flow_ref, T1
	CMPLE?WCL	T1, 005h, L00011
	SUB?WWW	_flow_val, _flow_ref, T1
	DIV?WCW	T1, 005h, T1
	SUB?WWW	_pwm_val, T1, _pwm_val
	GOTO?L	L00012
	LABEL?L	L00011	
	SUB?WCW	_pwm_val, 001h, _pwm_val
	LABEL?L	L00012	
	GOTO?L	L00010
	LABEL?L	L00009	
	MOVE?CW	032h, _pwm_val
	LABEL?L	L00010	
	LABEL?L	L00007	
	RETURN?	

	END
