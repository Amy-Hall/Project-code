
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
T2              		EQU	RAM_START + 015h
T3              		EQU	RAM_START + 017h
GOP             		EQU	RAM_START + 019h
RM1             		EQU	RAM_START + 01Ah
RM2             		EQU	RAM_START + 01Bh
RR1             		EQU	RAM_START + 01Ch
RR2             		EQU	RAM_START + 01Dh
RS1             		EQU	RAM_START + 01Eh
RS2             		EQU	RAM_START + 01Fh
_i               		EQU	RAM_START + 020h
_n               		EQU	RAM_START + 022h
_pwm_val         		EQU	RAM_START + 024h
_t0adval         		EQU	RAM_START + 026h
_t0res_lower     		EQU	RAM_START + 028h
_t0res_upper     		EQU	RAM_START + 02Ah
_t0resistance    		EQU	RAM_START + 02Ch
_t0temp_decimal  		EQU	RAM_START + 02Eh
_t0temp_integer  		EQU	RAM_START + 030h
_t0temp_lower    		EQU	RAM_START + 032h
_t0temp_upper    		EQU	RAM_START + 034h
_t1adval         		EQU	RAM_START + 036h
_t1res_lower     		EQU	RAM_START + 038h
_t1res_upper     		EQU	RAM_START + 03Ah
_t1resistance    		EQU	RAM_START + 03Ch
_t1temp_decimal  		EQU	RAM_START + 03Eh
_t1temp_integer  		EQU	RAM_START + 040h
_t1temp_lower    		EQU	RAM_START + 042h
_t1temp_upper    		EQU	RAM_START + 044h
_throttle        		EQU	RAM_START + 046h
_resistor_ref    		EQU	RAM_START + 048h
_temp_ref        		EQU	RAM_START + 070h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC

; EEPROM data.


	INCLUDE	"TEMP_P~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	040h, OSCCON
	MOVE?CW	005h, _temp_ref
	MOVE?CW	00Ah, _temp_ref + 00002h
	MOVE?CW	00Fh, _temp_ref + 00004h
	MOVE?CW	014h, _temp_ref + 00006h
	MOVE?CW	019h, _temp_ref + 00008h
	MOVE?CW	01Eh, _temp_ref + 0000Ah
	MOVE?CW	023h, _temp_ref + 0000Ch
	MOVE?CW	028h, _temp_ref + 0000Eh
	MOVE?CW	02Dh, _temp_ref + 00010h
	MOVE?CW	032h, _temp_ref + 00012h
	MOVE?CW	037h, _temp_ref + 00014h
	MOVE?CW	03Ch, _temp_ref + 00016h
	MOVE?CW	041h, _temp_ref + 00018h
	MOVE?CW	046h, _temp_ref + 0001Ah
	MOVE?CW	04Bh, _temp_ref + 0001Ch
	MOVE?CW	050h, _temp_ref + 0001Eh
	MOVE?CW	055h, _temp_ref + 00020h
	MOVE?CW	05Ah, _temp_ref + 00022h
	MOVE?CW	05Fh, _temp_ref + 00024h
	MOVE?CW	064h, _temp_ref + 00026h
	MOVE?CW	013DBh, _resistor_ref
	MOVE?CW	00FF1h, _resistor_ref + 00002h
	MOVE?CW	00CE3h, _resistor_ref + 00004h
	MOVE?CW	00A7Dh, _resistor_ref + 00006h
	MOVE?CW	00898h, _resistor_ref + 00008h
	MOVE?CW	00715h, _resistor_ref + 0000Ah
	MOVE?CW	005DFh, _resistor_ref + 0000Ch
	MOVE?CW	004E6h, _resistor_ref + 0000Eh
	MOVE?CW	0041Bh, _resistor_ref + 00010h
	MOVE?CW	00376h, _resistor_ref + 00012h
	MOVE?CW	002EEh, _resistor_ref + 00014h
	MOVE?CW	0027Fh, _resistor_ref + 00016h
	MOVE?CW	00222h, _resistor_ref + 00018h
	MOVE?CW	001D4h, _resistor_ref + 0001Ah
	MOVE?CW	00194h, _resistor_ref + 0001Ch
	MOVE?CW	0015Eh, _resistor_ref + 0001Eh
	MOVE?CW	00130h, _resistor_ref + 00020h
	MOVE?CW	0010Ah, _resistor_ref + 00022h
	MOVE?CW	0E9h, _resistor_ref + 00024h
	MOVE?CW	0CCh, _resistor_ref + 00026h
	MOVE?CB	000h, ADCON1
	MOVE?CB	087h, ADCON2
	MOVE?CB	0FFh, TRISA
	MOVE?CB	000h, TRISC

	LABEL?L	_main	
	GOSUB?L	_get_temp0
	GOSUB?L	_get_temp1
	MOVE?CB	009h, ADCON0
	ADCIN?CW	002h, _throttle
	MUL?WCW	_throttle, 019h, T1
	DIV?WCW	T1, 066h, _pwm_val
	HPWM?CWC	002h, _pwm_val, 0F5h
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_pwm_val
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	054h
	LCDOUT?C	065h
	LCDOUT?C	06Dh
	LCDOUT?C	070h
	LCDOUT?C	03Ah
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t0temp_integer
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t0temp_decimal
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	094h
	LCDOUT?C	054h
	LCDOUT?C	065h
	LCDOUT?C	06Dh
	LCDOUT?C	070h
	LCDOUT?C	03Ah
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t1temp_integer
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t1temp_decimal
	LCDOUTDEC?	
	GOTO?L	_main
	END?	

	LABEL?L	_get_temp0	
	MOVE?CB	001h, ADCON0
	ADCIN?CW	000h, _t0adval
	DIV?CWW	055F0h, _t0adval, T1
	MUL?WCW	T1, 066h, T1
	SUB?WCW	T1, 00898h, _t0resistance
	CMPGT?WWB	_t0resistance, _resistor_ref, T1
	CMPLT?WWB	_t0resistance, _resistor_ref + 00016h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00001
	LCDOUT?C	0FEh
	LCDOUT?C	0D4h
	LCDOUT?C	074h
	LCDOUT?C	030h
	LCDOUT?C	020h
	LCDOUT?C	06Fh
	LCDOUT?C	075h
	LCDOUT?C	074h
	LCDOUT?C	020h
	LCDOUT?C	06Fh
	LCDOUT?C	066h
	LCDOUT?C	020h
	LCDOUT?C	072h
	LCDOUT?C	061h
	LCDOUT?C	06Eh
	LCDOUT?C	067h
	LCDOUT?C	065h
	GOTO?L	L00002
	LABEL?L	L00001	
	MOVE?CW	000h, _i
	LABEL?L	L00003	
	CMPGT?WCL	_i, 00Bh, L00004
	AOUT?WWW	_resistor_ref, _i, T1
	CMPLT?WWB	_t0resistance, T1, T1
	ADD?WCW	_i, 001h, T2
	AOUT?WWW	_resistor_ref, T2, T2
	CMPGE?WWB	_t0resistance, T2, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00005
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_resistor_ref, T1, _t0res_lower
	AOUT?WWW	_resistor_ref, _i, _t0res_upper
	AOUT?WWW	_temp_ref, _i, _t0temp_lower
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_temp_ref, T1, _t0temp_upper
	LABEL?L	L00005	
	NEXT?WCL	_i, 001h, L00003
	LABEL?L	L00004	
	MUL?WCW	_t0temp_upper, 00Ah, T1
	SUB?WWW	_t0resistance, _t0res_lower, T2
	MUL?WCW	T2, 032h, T2
	SUB?WWW	_t0res_upper, _t0res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t0temp_integer
	MUL?WCW	_t0temp_upper, 00Ah, T1
	SUB?WWW	_t0resistance, _t0res_lower, T2
	MUL?WCW	T2, 032h, T2
	SUB?WWW	_t0res_upper, _t0res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	MOD?WCW	T3, 00Ah, _t0temp_decimal
	LABEL?L	L00002	
	RETURN?	

	LABEL?L	_get_temp1	
	MOVE?CB	005h, ADCON0
	ADCIN?CW	001h, _t1adval
	DIV?CWW	0B000h, _t1adval, T1
	MUL?WCW	T1, 032h, T1
	SUB?WCW	T1, 00898h, _t1resistance
	CMPGT?WWB	_t1resistance, _resistor_ref, T1
	CMPLT?WWB	_t1resistance, _resistor_ref + 00016h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00007
	GOTO?L	L00008
	LABEL?L	L00007	
	MOVE?CW	000h, _i
	LABEL?L	L00009	
	CMPGT?WCL	_i, 00Bh, L00010
	AOUT?WWW	_resistor_ref, _i, T1
	CMPLT?WWB	_t1resistance, T1, T1
	ADD?WCW	_i, 001h, T2
	AOUT?WWW	_resistor_ref, T2, T2
	CMPGE?WWB	_t1resistance, T2, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00011
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_resistor_ref, T1, _t1res_lower
	AOUT?WWW	_resistor_ref, _i, _t1res_upper
	AOUT?WWW	_temp_ref, _i, _t1temp_lower
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_temp_ref, T1, _t1temp_upper
	LABEL?L	L00011	
	NEXT?WCL	_i, 001h, L00009
	LABEL?L	L00010	
	MUL?WCW	_t1temp_upper, 00Ah, T1
	SUB?WWW	_t1resistance, _t1res_lower, T2
	MUL?WCW	T2, 032h, T2
	SUB?WWW	_t1res_upper, _t1res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t1temp_integer
	MUL?WCW	_t1temp_upper, 00Ah, T1
	SUB?WWW	_t1resistance, _t1res_lower, T2
	MUL?WCW	T2, 032h, T2
	SUB?WWW	_t1res_upper, _t1res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	MOD?WCW	T3, 00Ah, _t1temp_decimal
	LABEL?L	L00008	
	RETURN?	

	END
