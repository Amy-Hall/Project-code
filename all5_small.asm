
; PICBASIC PRO(TM) Compiler 2.47, (c) 1998, 2006 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\18F2420.INC"


; Define statements.
#define		OSC		 4
#define		CHAR_PACING		 1000
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
_an_3            		EQU	RAM_START + 020h
_an_4            		EQU	RAM_START + 022h
_an_frequency    		EQU	RAM_START + 024h
_dT_1            		EQU	RAM_START + 026h
_dT_2            		EQU	RAM_START + 028h
_flow_decimal    		EQU	RAM_START + 02Ah
_flow_pwm_val    		EQU	RAM_START + 02Ch
_flow_ref        		EQU	RAM_START + 02Eh
_flow_val        		EQU	RAM_START + 030h
_i               		EQU	RAM_START + 032h
_loops           		EQU	RAM_START + 034h
_n               		EQU	RAM_START + 036h
_n1              		EQU	RAM_START + 038h
_n2              		EQU	RAM_START + 03Ah
_p_in            		EQU	RAM_START + 03Ch
_p_pwm_val       		EQU	RAM_START + 03Eh
_p_ref           		EQU	RAM_START + 040h
_p_val           		EQU	RAM_START + 042h
_pressure        		EQU	RAM_START + 044h
_pressure_div100 		EQU	RAM_START + 046h
_pressure_ref    		EQU	RAM_START + 048h
_setting         		EQU	RAM_START + 04Ah
_t1adval         		EQU	RAM_START + 04Ch
_t1res_lower     		EQU	RAM_START + 04Eh
_t1res_upper     		EQU	RAM_START + 050h
_t1resistance    		EQU	RAM_START + 052h
_t1temp_decimal  		EQU	RAM_START + 054h
_t1temp_integer  		EQU	RAM_START + 056h
_t1temp_lower    		EQU	RAM_START + 058h
_t1temp_ref      		EQU	RAM_START + 05Ah
_t1temp_rem      		EQU	RAM_START + 05Ch
_t1temp_upper    		EQU	RAM_START + 05Eh
_t1temp_val      		EQU	RAM_START + 060h
_t2adval         		EQU	RAM_START + 062h
_t2res_lower     		EQU	RAM_START + 064h
_t2res_upper     		EQU	RAM_START + 066h
_t2resistance    		EQU	RAM_START + 068h
_t2temp_decimal  		EQU	RAM_START + 06Ah
_t2temp_integer  		EQU	RAM_START + 06Ch
_t2temp_lower    		EQU	RAM_START + 06Eh
_t2temp_ref      		EQU	RAM_START + 070h
_t2temp_rem      		EQU	RAM_START + 072h
_t2temp_upper    		EQU	RAM_START + 074h
_t2temp_val      		EQU	RAM_START + 076h
_temp_pwm_val    		EQU	RAM_START + 078h
_throttle        		EQU	RAM_START + 07Ah
_x               		EQU	RAM_START + 07Ch
_resistor_ref    		EQU	RAM_START + 07Eh
_temp_ref        		EQU	RAM_START + 0B4h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _TRISB??1        	 TRISB, 001h
#define _TRISB??2        	 TRISB, 002h
#define _TRISB??3        	 TRISB, 003h
#define _TRISB??4        	 TRISB, 004h
#define _CCP1CON??4      	 CCP1CON, 004h
#define _flow_pwm_val??0 	_flow_pwm_val, 000h
#define _CCP1CON??5      	 CCP1CON, 005h
#define _flow_pwm_val??1 	_flow_pwm_val, 001h
#define _PORTB??2        	 PORTB, 002h
#define _p_pwm_val??0    	_p_pwm_val, 000h
#define _p_pwm_val??1    	_p_pwm_val, 001h
#define _PORTB??4        	 PORTB, 004h

; Constants.
_T2400           		EQU	00000h
_T1200           		EQU	00001h
_T9600           		EQU	00002h
_T300            		EQU	00003h
_N2400           		EQU	00004h
_N1200           		EQU	00005h
_N9600           		EQU	00006h
_N300            		EQU	00007h
_OT2400          		EQU	00008h
_OT1200          		EQU	00009h
_OT9600          		EQU	0000Ah
_OT300           		EQU	0000Bh
_ON2400          		EQU	0000Ch
_ON1200          		EQU	0000Dh
_ON9600          		EQU	0000Eh
_ON300           		EQU	0000Fh
_MSBPRE          		EQU	00000h
_LSBPRE          		EQU	00001h
_MSBPOST         		EQU	00002h
_LSBPOST         		EQU	00003h
_LSBFIRST        		EQU	00000h
_MSBFIRST        		EQU	00001h
_CLS             		EQU	00000h
_HOME            		EQU	00001h
_BELL            		EQU	00007h
_BKSP            		EQU	00008h
_TAB             		EQU	00009h
_CR              		EQU	0000Dh
_UnitOn          		EQU	00012h
_UnitOff         		EQU	0001Ah
_UnitsOff        		EQU	0001Ch
_LightsOn        		EQU	00014h
_LightsOff       		EQU	00010h
_Dim             		EQU	0001Eh
_Bright          		EQU	00016h

; EEPROM data.


	INCLUDE	"ALL5_S~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	040h, OSCCON
	MOVE?CB	0FFh, TRISA
	MOVE?CT	001h, _TRISB??1
	MOVE?CT	001h, _TRISB??2
	MOVE?CT	001h, _TRISB??3
	MOVE?CT	000h, _TRISB??4
	MOVE?CB	000h, TRISC
	MOVE?CB	007h, ADCON1
	MOVE?CB	087h, ADCON2
	MOVE?CB	00Ch, CCP1CON
	MOVE?CB	007h, T2CON
	MOVE?CB	0FFh, PR2
	MOVE?CW	064h, _dT_1
	MOVE?CW	00Ah, _dT_2
	MOVE?CW	005h, _n1
	MOVE?CW	032h, _n2
	MOVE?CW	005h, _temp_ref
	MOVE?CW	00Ah, _temp_ref + 00002h
	MOVE?CW	00Fh, _temp_ref + 00004h
	MOVE?CW	010h, _temp_ref + 00006h
	MOVE?CW	012h, _temp_ref + 00008h
	MOVE?CW	014h, _temp_ref + 0000Ah
	MOVE?CW	016h, _temp_ref + 0000Ch
	MOVE?CW	018h, _temp_ref + 0000Eh
	MOVE?CW	01Ah, _temp_ref + 00010h
	MOVE?CW	01Ch, _temp_ref + 00012h
	MOVE?CW	01Eh, _temp_ref + 00014h
	MOVE?CW	020h, _temp_ref + 00016h
	MOVE?CW	022h, _temp_ref + 00018h
	MOVE?CW	023h, _temp_ref + 0001Ah
	MOVE?CW	028h, _temp_ref + 0001Ch
	MOVE?CW	02Dh, _temp_ref + 0001Eh
	MOVE?CW	032h, _temp_ref + 00020h
	MOVE?CW	037h, _temp_ref + 00022h
	MOVE?CW	03Ch, _temp_ref + 00024h
	MOVE?CW	041h, _temp_ref + 00026h
	MOVE?CW	046h, _temp_ref + 00028h
	MOVE?CW	04Bh, _temp_ref + 0002Ah
	MOVE?CW	050h, _temp_ref + 0002Ch
	MOVE?CW	055h, _temp_ref + 0002Eh
	MOVE?CW	05Ah, _temp_ref + 00030h
	MOVE?CW	05Fh, _temp_ref + 00032h
	MOVE?CW	064h, _temp_ref + 00034h
	MOVE?CW	013DBh, _resistor_ref
	MOVE?CW	00FF1h, _resistor_ref + 00002h
	MOVE?CW	00CE3h, _resistor_ref + 00004h
	MOVE?CW	00C68h, _resistor_ref + 00006h
	MOVE?CW	00B73h, _resistor_ref + 00008h
	MOVE?CW	00A7Eh, _resistor_ref + 0000Ah
	MOVE?CW	009BCh, _resistor_ref + 0000Ch
	MOVE?CW	008F9h, _resistor_ref + 0000Eh
	MOVE?CW	0084Bh, _resistor_ref + 00010h
	MOVE?CW	007B0h, _resistor_ref + 00012h
	MOVE?CW	00716h, _resistor_ref + 00014h
	MOVE?CW	0069Ah, _resistor_ref + 00016h
	MOVE?CW	0061Eh, _resistor_ref + 00018h
	MOVE?CW	005DFh, _resistor_ref + 0001Ah
	MOVE?CW	004E6h, _resistor_ref + 0001Ch
	MOVE?CW	0041Bh, _resistor_ref + 0001Eh
	MOVE?CW	00376h, _resistor_ref + 00020h
	MOVE?CW	002EEh, _resistor_ref + 00022h
	MOVE?CW	0027Fh, _resistor_ref + 00024h
	MOVE?CW	00222h, _resistor_ref + 00026h
	MOVE?CW	001D4h, _resistor_ref + 00028h
	MOVE?CW	00194h, _resistor_ref + 0002Ah
	MOVE?CW	0015Eh, _resistor_ref + 0002Ch
	MOVE?CW	00130h, _resistor_ref + 0002Eh
	MOVE?CW	0010Ah, _resistor_ref + 00030h
	MOVE?CW	0E9h, _resistor_ref + 00032h
	MOVE?CW	0CCh, _resistor_ref + 00034h
	MOVE?CW	064h, _flow_pwm_val
	MOVE?CW	064h, _p_pwm_val
	MOVE?TT	_flow_pwm_val??0, _CCP1CON??4
	MOVE?TT	_flow_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_flow_pwm_val, 002h, CCPR1L
	MOVE?CW	000h, _loops

	LABEL?L	_main	
	MOVE?CB	009h, ADCON0
	ADCIN?CW	002h, _t1temp_ref
	MUL?WCW	_t1temp_ref, 019h, T1
	DIV?WCW	T1, 0FFh, _t1temp_ref
	GOSUB?L	_get_temp_value
	GOSUB?L	_get_air_temp
	GOSUB?L	_get_temp_pwm
	HPWM?CWC	002h, _temp_pwm_val, 0F5h
	MOVE?CB	00Dh, ADCON0
	ADCIN?CW	003h, _an_3
	MOVE?CB	011h, ADCON0
	ADCIN?CW	004h, _an_4
	GOSUB?L	_get_flowrate
	GOSUB?L	_get_pressure
	MUL?WCW	_an_3, 02Ch, T1
	DIV?WCW	T1, 00400h, _flow_ref
	MUL?WCW	_an_4, 029h, T1
	DIV?WCW	T1, 002h, T1
	DIV?WCW	T1, 001F4h, T1
	MUL?WCW	T1, 001F4h, _pressure_ref
	CMPNE?TCL	_PORTB??2, 000h, L00001
	GOSUB?L	_get_water_pwm
	MOVE?TT	_flow_pwm_val??0, _CCP1CON??4
	MOVE?TT	_flow_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_flow_pwm_val, 002h, CCPR1L
	GOTO?L	L00002
	LABEL?L	L00001	
	GOSUB?L	_get_water_p_pwm
	MOVE?TT	_p_pwm_val??0, _CCP1CON??4
	MOVE?TT	_p_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_p_pwm_val, 002h, CCPR1L
	PAUSE?C	064h
	LABEL?L	L00002	
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	054h
	LCDOUT?C	065h
	LCDOUT?C	06Dh
	LCDOUT?C	070h
	LCDOUT?C	03Ah
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t1temp_ref
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t1temp_integer
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t2temp_integer
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_temp_pwm_val
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	046h
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	077h
	LCDOUT?C	03Ah
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	DIV?WCW	_flow_ref, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	MOD?WCW	_flow_ref, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	DIV?WCW	_flow_val, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	MOD?WCW	_flow_val, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	0FEh
	LCDOUT?C	094h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h
	LCDOUT?C	075h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	03Ah
	LCDOUTCOUNT?C	000h
	DIV?WCW	_pressure_ref, 003E8h, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	DIV?WCW	_pressure_ref, 064h, T1
	MOD?WCW	T1, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	DIV?WCW	_pressure, 003E8h, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	LCDOUT?C	02Eh
	LCDOUTCOUNT?C	000h
	DIV?WCW	_pressure, 064h, T1
	MOD?WCW	T1, 00Ah, T1
	LCDOUTNUM?W	T1
	LCDOUTDEC?	
	CMPNE?TCL	_PORTB??2, 000h, L00003
	LCDOUT?C	0FEh
	LCDOUT?C	0D4h
	LCDOUT?C	046h
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	077h
	LCDOUT?C	020h
	LCDOUT?C	070h
	LCDOUT?C	077h
	LCDOUT?C	06Dh
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_pwm_val
	LCDOUTDEC?	
	GOTO?L	L00004
	LABEL?L	L00003	
	LCDOUT?C	0FEh
	LCDOUT?C	0D4h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h
	LCDOUT?C	075h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	020h
	LCDOUT?C	070h
	LCDOUT?C	077h
	LCDOUT?C	06Dh
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_p_pwm_val
	LCDOUTDEC?	
	LABEL?L	L00004	
	SERPIN?T	_PORTB??4
	SERMODE?C	_N9600
	SEROUTD?W	_t1temp_ref
	SEROUT?C	020h
	SEROUTD?W	_t2temp_integer
	SEROUT?C	00Ah
	SEROUT?C	00Dh
	GOTO?L	_main
	END?	

	LABEL?L	_get_temp_value	
	MOVE?CB	001h, ADCON0
	ADCIN?CW	000h, _t1adval
	DIV?CWW	0DC00h, _t1adval, T1
	MUL?WCW	T1, 028h, T1
	SUB?WCW	T1, 00898h, _t1resistance
	CMPGT?WWB	_t1resistance, _resistor_ref, T1
	CMPLT?WWB	_t1resistance, _resistor_ref + 00036h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00005
	GOTO?L	L00006
	LABEL?L	L00005	
	MOVE?CW	000h, _i
	LABEL?L	L00007	
	CMPGT?WCL	_i, 013h, L00008
	AOUT?WWW	_resistor_ref, _i, T1
	CMPLT?WWB	_t1resistance, T1, T1
	ADD?WCW	_i, 001h, T2
	AOUT?WWW	_resistor_ref, T2, T2
	CMPGE?WWB	_t1resistance, T2, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00009
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_resistor_ref, T1, _t1res_lower
	AOUT?WWW	_resistor_ref, _i, _t1res_upper
	AOUT?WWW	_temp_ref, _i, _t1temp_lower
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_temp_ref, T1, _t1temp_upper
	LABEL?L	L00009	
	NEXT?WCL	_i, 001h, L00007
	LABEL?L	L00008	
	CMPLE?WCB	_t1temp_upper, 00Fh, T1
	CMPGE?WCB	_t1temp_lower, 023h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00011
	MUL?WCW	_t1temp_upper, 064h, T1
	SUB?WWW	_t1resistance, _t1res_lower, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t1res_upper, _t1res_lower, T3
	DIV?WWW	T2, T3, T3
	MUL?WCW	T3, 005h, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t1temp_val
	LCDOUT?C	0FEh
	LCDOUT?C	0D4h
	LCDOUT?C	068h
	LCDOUT?C	065h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_t1temp_val
	LCDOUTDEC?	
	GOTO?L	L00012
	LABEL?L	L00011	
	CMPEQ?WCB	_t1temp_lower, 00Fh, T1
	CMPEQ?WCB	_t1temp_lower, 022h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00013
	MUL?WCW	_t1temp_upper, 064h, T1
	SUB?WWW	_t1resistance, _t1res_lower, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t1res_upper, _t1res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t1temp_val
	GOTO?L	L00014
	LABEL?L	L00013	
	MUL?WCW	_t1temp_upper, 064h, T1
	SUB?WWW	_t1resistance, _t1res_lower, T2
	MUL?WCW	T2, 002h, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t1res_upper, _t1res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t1temp_val
	LABEL?L	L00014	
	LABEL?L	L00012	
	DIV?WCW	_t1temp_val, 00Ah, _t1temp_integer
	MOD?WCW	_t1temp_val, 00Ah, _t1temp_rem
	CMPLT?WCL	_t1temp_rem, 008h, L00015
	ADD?WCW	_t1temp_integer, 001h, _t1temp_integer
	MOVE?CW	000h, _t1temp_decimal
	LABEL?L	L00015	
	CMPLT?WCB	_t1temp_rem, 008h, T1
	CMPGT?WCB	_t1temp_rem, 002h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00017
	MOVE?CW	005h, _t1temp_decimal
	LABEL?L	L00017	
	CMPGE?WCL	_t1temp_rem, 003h, L00019
	MOVE?CW	000h, _t1temp_decimal
	LABEL?L	L00019	
	LABEL?L	L00006	
	RETURN?	

	LABEL?L	_get_air_temp	
	MOVE?CB	005h, ADCON0
	ADCIN?CW	001h, _t2adval
	DIV?CWW	0DC00h, _t2adval, T1
	MUL?WCW	T1, 028h, T1
	SUB?WCW	T1, 00898h, _t2resistance
	CMPGT?WWB	_t2resistance, _resistor_ref, T1
	CMPLT?WWB	_t2resistance, _resistor_ref + 00026h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00021
	GOTO?L	L00022
	LABEL?L	L00021	
	MOVE?CW	000h, _i
	LABEL?L	L00023	
	CMPGT?WCL	_i, 013h, L00024
	AOUT?WWW	_resistor_ref, _i, T1
	CMPLT?WWB	_t2resistance, T1, T1
	ADD?WCW	_i, 001h, T2
	AOUT?WWW	_resistor_ref, T2, T2
	CMPGE?WWB	_t2resistance, T2, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00025
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_resistor_ref, T1, _t2res_lower
	AOUT?WWW	_resistor_ref, _i, _t2res_upper
	AOUT?WWW	_temp_ref, _i, _t2temp_lower
	ADD?WCW	_i, 001h, T1
	AOUT?WWW	_temp_ref, T1, _t2temp_upper
	LABEL?L	L00025	
	NEXT?WCL	_i, 001h, L00023
	LABEL?L	L00024	
	CMPLE?WCB	_t2temp_upper, 00Fh, T1
	CMPGE?WCB	_t2temp_lower, 023h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00027
	MUL?WCW	_t2temp_upper, 064h, T1
	SUB?WWW	_t2resistance, _t2res_lower, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t2res_upper, _t2res_lower, T3
	DIV?WWW	T2, T3, T3
	MUL?WCW	T3, 005h, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t2temp_val
	GOTO?L	L00028
	LABEL?L	L00027	
	CMPEQ?WCB	_t2temp_lower, 00Fh, T1
	CMPEQ?WCB	_t2temp_lower, 022h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00029
	MUL?WCW	_t2temp_upper, 064h, T1
	SUB?WWW	_t2resistance, _t2res_lower, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t2res_upper, _t2res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t2temp_val
	GOTO?L	L00030
	LABEL?L	L00029	
	MUL?WCW	_t2temp_upper, 064h, T1
	SUB?WWW	_t2resistance, _t2res_lower, T2
	MUL?WCW	T2, 002h, T2
	MUL?WCW	T2, 064h, T2
	SUB?WWW	_t2res_upper, _t2res_lower, T3
	DIV?WWW	T2, T3, T3
	SUB?WWW	T1, T3, T3
	DIV?WCW	T3, 00Ah, _t2temp_val
	LABEL?L	L00030	
	LABEL?L	L00028	
	DIV?WCW	_t2temp_val, 00Ah, _t2temp_integer
	MOD?WCW	_t2temp_val, 00Ah, _t2temp_rem
	CMPLT?WCL	_t2temp_rem, 008h, L00031
	ADD?WCW	_t2temp_integer, 001h, _t2temp_integer
	MOVE?CW	000h, _t2temp_decimal
	LABEL?L	L00031	
	CMPLT?WCB	_t2temp_rem, 008h, T1
	CMPGT?WCB	_t2temp_rem, 002h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00033
	MOVE?CW	005h, _t2temp_decimal
	LABEL?L	L00033	
	CMPGE?WCL	_t2temp_rem, 003h, L00035
	MOVE?CW	000h, _t2temp_decimal
	LABEL?L	L00035	
	LABEL?L	L00022	
	RETURN?	

	LABEL?L	_get_temp_pwm	
	CMPLE?WWL	_t2temp_integer, _t1temp_ref, L00037
	CMPLE?WCL	_temp_pwm_val, 000h, L00039
	SUB?WWW	_t2temp_integer, _t1temp_ref, T1
	CMPLE?WCL	T1, 003h, L00041
	SUB?WWW	_t2temp_integer, _t1temp_ref, T1
	SUB?WWW	_temp_pwm_val, T1, _temp_pwm_val
	GOTO?L	L00042
	LABEL?L	L00041	
	SUB?WCW	_temp_pwm_val, 001h, _temp_pwm_val
	LABEL?L	L00042	
	GOTO?L	L00040
	LABEL?L	L00039	
	MOVE?CW	000h, _temp_pwm_val
	LABEL?L	L00040	
	LABEL?L	L00037	
	CMPGE?WWL	_t2temp_integer, _t1temp_ref, L00043
	CMPGE?WCL	_t2temp_integer, 046h, L00045
	CMPGE?WCL	_temp_pwm_val, 0FEh, L00047
	SUB?WWW	_t1temp_ref, _t2temp_integer, T1
	CMPLE?WCL	T1, 003h, L00049
	SUB?WWW	_t1temp_ref, _t2temp_integer, T1
	ADD?WWW	_temp_pwm_val, T1, _temp_pwm_val
	GOTO?L	L00050
	LABEL?L	L00049	
	ADD?WCW	_temp_pwm_val, 001h, _temp_pwm_val
	LABEL?L	L00050	
	GOTO?L	L00048
	LABEL?L	L00047	
	MOVE?CW	0FEh, _temp_pwm_val
	LABEL?L	L00048	
	GOTO?L	L00046
	LABEL?L	L00045	
	SUB?WCW	_temp_pwm_val, 001h, _temp_pwm_val
	LABEL?L	L00046	
	LABEL?L	L00043	
	CMPLE?WCL	_temp_pwm_val, 0FEh, L00051
	MOVE?CW	0FEh, _temp_pwm_val
	LABEL?L	L00051	
	CMPNE?WCL	_t1temp_ref, 000h, L00053
	MOVE?CW	000h, _temp_pwm_val
	LABEL?L	L00053	
	RETURN?	

	LABEL?L	_get_flowrate	
	MOVE?CB	025h, ADCON0
	ADCIN?CW	009h, _an_frequency
	MUL?WCW	_an_frequency, 032h, T1
	DIV?WCW	T1, 0049Ah, _flow_val
	RETURN?	

	LABEL?L	_get_water_pwm	
	CMPNE?WCL	_loops, 003h, L00055
	MOVE?CW	000h, _loops
	LABEL?L	L00055	
	ADD?WCW	_loops, 001h, _loops
	CMPNE?WCL	_loops, 001h, L00057
	CMPGE?WWL	_flow_val, _flow_ref, L00059
	CMPGE?WCL	_flow_pwm_val, 078h, L00061
	SUB?WWW	_flow_ref, _flow_val, T1
	CMPLE?WCL	T1, 002h, L00063
	SUB?WWW	_flow_ref, _flow_val, T1
	MUL?CWW	002h, T1, T1
	DIV?WCW	T1, 003h, T1
	ADD?WWW	_flow_pwm_val, T1, _flow_pwm_val
	GOTO?L	L00064
	LABEL?L	L00063	
	ADD?WCW	_flow_pwm_val, 001h, _flow_pwm_val
	LABEL?L	L00064	
	GOTO?L	L00062
	LABEL?L	L00061	
	MOVE?CW	078h, _flow_pwm_val
	LABEL?L	L00062	
	LABEL?L	L00059	
	CMPLE?WWL	_flow_val, _flow_ref, L00065
	CMPLE?WCL	_flow_pwm_val, 032h, L00067
	SUB?WWW	_flow_val, _flow_ref, T1
	CMPLE?WCL	T1, 002h, L00069
	SUB?WWW	_flow_val, _flow_ref, T1
	MUL?CWW	002h, T1, T1
	DIV?WCW	T1, 003h, T1
	SUB?WWW	_flow_pwm_val, T1, _flow_pwm_val
	GOTO?L	L00070
	LABEL?L	L00069	
	SUB?WCW	_flow_pwm_val, 001h, _flow_pwm_val
	LABEL?L	L00070	
	GOTO?L	L00068
	LABEL?L	L00067	
	MOVE?CW	032h, _flow_pwm_val
	LABEL?L	L00068	
	LABEL?L	L00065	
	CMPNE?WCL	_flow_ref, 000h, L00071
	MOVE?CW	032h, _flow_pwm_val
	LABEL?L	L00071	
	LABEL?L	L00057	
	RETURN?	

	LABEL?L	_get_pressure	
	MOVE?CB	029h, ADCON0
	ADCIN?CW	00Ah, _p_in
	MUL?WCW	_p_in, 03Ch, T1
	DIV?WCW	T1, 038h, T1
	SUB?WCW	T1, 023h, _p_val
	MUL?WCW	_p_in, 017h, T1
	ADD?WCW	T1, 0A2h, T1
	MOD?WCW	T1, 032h, _pressure_div100
	MUL?WCW	_p_in, 017h, T1
	ADD?WCW	T1, 0A2h, T1
	DIV?WCW	T1, 001F4h, _pressure
	CMPLT?WCL	_pressure_div100, 0FAh, L00073
	ADD?WCW	_pressure, 001h, _pressure
	LABEL?L	L00073	
	MUL?WCW	_pressure, 001F4h, _pressure
	RETURN?	

	LABEL?L	_get_water_p_pwm	
	CMPGE?WWL	_pressure, _pressure_ref, L00075
	CMPGE?WCL	_p_pwm_val, 078h, L00077
	SUB?WWW	_pressure_ref, _pressure, T1
	CMPLE?WCL	T1, 002BCh, L00079
	SUB?WWW	_pressure_ref, _pressure, T1
	DIV?WCW	T1, 001F4h, T1
	ADD?WWW	_p_pwm_val, T1, _p_pwm_val
	GOTO?L	L00080
	LABEL?L	L00079	
	ADD?WCW	_p_pwm_val, 001h, _p_pwm_val
	LABEL?L	L00080	
	CMPLE?WCL	_p_pwm_val, 078h, L00081
	MOVE?CW	078h, _p_pwm_val
	LABEL?L	L00081	
	GOTO?L	L00078
	LABEL?L	L00077	
	MOVE?CW	078h, _p_pwm_val
	LABEL?L	L00078	
	LABEL?L	L00075	
	CMPLE?WWL	_pressure, _pressure_ref, L00083
	CMPLE?WCL	_p_pwm_val, 032h, L00085
	SUB?WWW	_pressure, _pressure_ref, T1
	CMPLE?WCL	T1, 002BCh, L00087
	SUB?WWW	_pressure, _pressure_ref, T1
	DIV?WCW	T1, 001F4h, T1
	SUB?WWW	_p_pwm_val, T1, _p_pwm_val
	GOTO?L	L00088
	LABEL?L	L00087	
	SUB?WCW	_p_pwm_val, 001h, _p_pwm_val
	LABEL?L	L00088	
	CMPNE?WCL	_pressure_ref, 000h, L00089
	MOVE?CW	032h, _p_pwm_val
	LABEL?L	L00089	
	GOTO?L	L00086
	LABEL?L	L00085	
	MOVE?CW	032h, _p_pwm_val
	LABEL?L	L00086	
	LABEL?L	L00083	
	RETURN?	

	END
