
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
_an_3            		EQU	RAM_START + 020h
_an_frequency    		EQU	RAM_START + 022h
_dT_1            		EQU	RAM_START + 024h
_dT_2            		EQU	RAM_START + 026h
_flow_decimal    		EQU	RAM_START + 028h
_flow_pwm_val    		EQU	RAM_START + 02Ah
_flow_ref        		EQU	RAM_START + 02Ch
_flow_val        		EQU	RAM_START + 02Eh
_i               		EQU	RAM_START + 030h
_loops           		EQU	RAM_START + 032h
_n               		EQU	RAM_START + 034h
_n1              		EQU	RAM_START + 036h
_n2              		EQU	RAM_START + 038h
_p_in            		EQU	RAM_START + 03Ah
_p_pwm_val       		EQU	RAM_START + 03Ch
_p_ref           		EQU	RAM_START + 03Eh
_p_val           		EQU	RAM_START + 040h
_pressure        		EQU	RAM_START + 042h
_pressure_ref    		EQU	RAM_START + 044h
_setting         		EQU	RAM_START + 046h
_t1adval         		EQU	RAM_START + 048h
_t1res_lower     		EQU	RAM_START + 04Ah
_t1res_upper     		EQU	RAM_START + 04Ch
_t1resistance    		EQU	RAM_START + 04Eh
_t1temp_decimal  		EQU	RAM_START + 050h
_t1temp_integer  		EQU	RAM_START + 052h
_t1temp_lower    		EQU	RAM_START + 054h
_t1temp_ref      		EQU	RAM_START + 056h
_t1temp_upper    		EQU	RAM_START + 058h
_t1temp_val      		EQU	RAM_START + 05Ah
_temp_pwm_val    		EQU	RAM_START + 05Ch
_throttle        		EQU	RAM_START + 05Eh
_x               		EQU	RAM_START + 060h
_resistor_ref    		EQU	RAM_START + 062h
_temp_ref        		EQU	RAM_START + 07Ah
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _TRISB??2        	 TRISB, 002h
#define _CCP1CON??4      	 CCP1CON, 004h
#define _flow_pwm_val??0 	_flow_pwm_val, 000h
#define _CCP1CON??5      	 CCP1CON, 005h
#define _flow_pwm_val??1 	_flow_pwm_val, 001h
#define _PORTB??2        	 PORTB, 002h
#define _p_pwm_val??0    	_p_pwm_val, 000h
#define _p_pwm_val??1    	_p_pwm_val, 001h

; EEPROM data.


	INCLUDE	"ALL3.MAC"
	INCLUDE	"C:\PBP\PBPPIC18.LIB"

	MOVE?CB	040h, OSCCON
	MOVE?CB	0FFh, TRISA
	MOVE?CT	001h, _TRISB??2
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
	MOVE?CW	014h, _temp_ref + 00006h
	MOVE?CW	019h, _temp_ref + 00008h
	MOVE?CW	01Eh, _temp_ref + 0000Ah
	MOVE?CW	023h, _temp_ref + 0000Ch
	MOVE?CW	028h, _temp_ref + 0000Eh
	MOVE?CW	02Dh, _temp_ref + 00010h
	MOVE?CW	032h, _temp_ref + 00012h
	MOVE?CW	037h, _temp_ref + 00014h
	MOVE?CW	03Ch, _temp_ref + 00016h
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
	MOVE?CW	064h, _flow_pwm_val
	MOVE?CW	064h, _p_pwm_val
	MOVE?TT	_flow_pwm_val??0, _CCP1CON??4
	MOVE?TT	_flow_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_flow_pwm_val, 002h, CCPR1L
	MOVE?CW	000h, _loops

	LABEL?L	_main	
	CMPNE?WCL	_loops, 00Ah, L00001
	MOVE?CW	000h, _loops
	LABEL?L	L00001	
	ADD?WCW	_loops, 001h, _loops
	MOVE?CB	009h, ADCON0
	ADCIN?CW	002h, _t1temp_ref
	MUL?WCW	_t1temp_ref, 032h, T1
	DIV?WCW	T1, 0FFh, T1
	MUL?WCW	T1, 00Ah, _t1temp_ref
	GOSUB?L	_get_temp_value
	GOSUB?L	_get_temp_pwm
	HPWM?CWC	002h, _temp_pwm_val, 0F5h
	MOVE?CB	00Dh, ADCON0
	ADCIN?CW	003h, _an_3
	GOSUB?L	_get_flowrate
	GOSUB?L	_get_pressure
	MUL?WCW	_an_3, 02Ch, T1
	DIV?WCW	T1, 00400h, _flow_ref
	MUL?WCW	_an_3, 03Fh, T1
	DIV?WCW	T1, 008h, _pressure_ref
	CMPNE?TCL	_PORTB??2, 000h, L00003
	GOSUB?L	_get_water_pwm
	MOVE?TT	_flow_pwm_val??0, _CCP1CON??4
	MOVE?TT	_flow_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_flow_pwm_val, 002h, CCPR1L
	GOTO?L	L00004
	LABEL?L	L00003	
	GOSUB?L	_get_water_p_pwm
	MOVE?TT	_p_pwm_val??0, _CCP1CON??4
	MOVE?TT	_p_pwm_val??1, _CCP1CON??5
	SHIFTR?WCB	_p_pwm_val, 002h, CCPR1L
	PAUSE?C	064h
	LABEL?L	L00004	
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
	LCDOUTNUM?W	_t1temp_val
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
	LCDOUTNUM?W	_flow_ref
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_val
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
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_pressure_ref
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_pressure
	LCDOUTDEC?	
	CMPNE?TCL	_PORTB??2, 000h, L00005
	LCDOUT?C	0FEh
	LCDOUT?C	0D4h
	LCDOUT?C	046h
	LCDOUT?C	06Ch
	LCDOUT?C	06Fh
	LCDOUT?C	077h
	LCDOUT?C	020h
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_flow_pwm_val
	LCDOUTDEC?	
	GOTO?L	L00006
	LABEL?L	L00005	
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
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_p_pwm_val
	LCDOUTDEC?	
	LABEL?L	L00006	
	GOTO?L	_main
	END?	

	LABEL?L	_get_temp_value	
	MOVE?CB	001h, ADCON0
	ADCIN?CW	000h, _t1adval
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
	SUB?WWW	T1, T3, _t1temp_val
	LABEL?L	L00008	
	RETURN?	

	LABEL?L	_get_temp_pwm	
	CMPLE?WWL	_t1temp_val, _t1temp_ref, L00013
	CMPLE?WCL	_temp_pwm_val, 000h, L00015
	SUB?WWW	_t1temp_val, _t1temp_ref, T1
	CMPLE?WWL	T1, _dT_1, L00017
	SUB?WCW	_temp_pwm_val, 00Ch, _temp_pwm_val
	LABEL?L	L00017	
	SUB?WWW	_t1temp_val, _t1temp_ref, T1
	CMPGT?WWB	T1, _n2, T1
	SUB?WWW	_t1temp_val, _t1temp_ref, T2
	CMPLT?WWB	T2, _n1, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00019
	SUB?WCW	_temp_pwm_val, 008h, _temp_pwm_val
	LABEL?L	L00019	
	SUB?WWW	_t1temp_val, _t1temp_ref, T1
	CMPGE?WWL	T1, _n2, L00021
	SUB?WCW	_temp_pwm_val, 001h, _temp_pwm_val
	LABEL?L	L00021	
	GOTO?L	L00016
	LABEL?L	L00015	
	MOVE?CW	000h, _temp_pwm_val
	LABEL?L	L00016	
	GOTO?L	L00014
	LABEL?L	L00013	
	CMPGE?WCL	_temp_pwm_val, 0FEh, L00023
	SUB?WWW	_t1temp_ref, _t1temp_val, T1
	CMPLE?WWL	T1, _dT_1, L00025
	ADD?WCW	_temp_pwm_val, 00Ch, _temp_pwm_val
	LABEL?L	L00025	
	SUB?WWW	_t1temp_ref, _t1temp_val, T1
	CMPGT?WWB	T1, _dT_2, T1
	SUB?WWW	_t1temp_ref, _t1temp_val, T2
	CMPLT?WWB	T2, _dT_1, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00027
	ADD?WCW	_temp_pwm_val, 008h, _temp_pwm_val
	LABEL?L	L00027	
	SUB?WWW	_t1temp_ref, _t1temp_val, T1
	CMPGE?WWL	T1, _dT_2, L00029
	ADD?WCW	_temp_pwm_val, 001h, _temp_pwm_val
	LABEL?L	L00029	
	GOTO?L	L00024
	LABEL?L	L00023	
	MOVE?CW	0FEh, _temp_pwm_val
	LABEL?L	L00024	
	LABEL?L	L00014	
	RETURN?	

	LABEL?L	_get_flowrate	
	MOVE?CB	011h, ADCON0
	ADCIN?CW	004h, _an_frequency
	MUL?WCW	_an_frequency, 032h, T1
	DIV?WCW	T1, 0049Ah, _flow_val
	RETURN?	

	LABEL?L	_get_water_pwm	
	CMPNE?WCL	_loops, 004h, L00031
	CMPGE?WWL	_flow_val, _flow_ref, L00033
	CMPGE?WCL	_flow_pwm_val, 078h, L00035
	SUB?WWW	_flow_ref, _flow_val, T1
	CMPLE?WCL	T1, 002h, L00037
	SUB?WWW	_flow_ref, _flow_val, T1
	MUL?CWW	004h, T1, T1
	DIV?WCW	T1, 005h, T1
	ADD?WWW	_flow_pwm_val, T1, _flow_pwm_val
	GOTO?L	L00038
	LABEL?L	L00037	
	ADD?WCW	_flow_pwm_val, 001h, _flow_pwm_val
	LABEL?L	L00038	
	GOTO?L	L00036
	LABEL?L	L00035	
	MOVE?CW	078h, _flow_pwm_val
	LABEL?L	L00036	
	LABEL?L	L00033	
	CMPLE?WWL	_flow_val, _flow_ref, L00039
	CMPLE?WCL	_flow_pwm_val, 032h, L00041
	SUB?WWW	_flow_val, _flow_ref, T1
	CMPLE?WCL	T1, 002h, L00043
	SUB?WWW	_flow_val, _flow_ref, T1
	MUL?CWW	004h, T1, T1
	DIV?WCW	T1, 005h, T1
	SUB?WWW	_flow_pwm_val, T1, _flow_pwm_val
	GOTO?L	L00044
	LABEL?L	L00043	
	SUB?WCW	_flow_pwm_val, 001h, _flow_pwm_val
	LABEL?L	L00044	
	GOTO?L	L00042
	LABEL?L	L00041	
	MOVE?CW	032h, _flow_pwm_val
	LABEL?L	L00042	
	LABEL?L	L00039	
	CMPEQ?WWB	_flow_val, _flow_ref, T1
	CMPEQ?WCB	_flow_ref, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00045
	MOVE?CW	032h, _flow_pwm_val
	LABEL?L	L00045	
	LABEL?L	L00031	
	RETURN?	

	LABEL?L	_get_pressure	
	MOVE?CB	011h, ADCON0
	ADCIN?CW	004h, _p_in
	MUL?WCW	_p_in, 03Ch, T1
	DIV?WCW	T1, 038h, T1
	SUB?WCW	T1, 023h, _p_val
	MUL?WCW	_p_in, 019h, T1
	DIV?WCW	T1, 003h, T1
	SUB?WCW	T1, 00115h, _pressure
	RETURN?	

	LABEL?L	_get_water_p_pwm	
	CMPGE?WWL	_p_val, _p_ref, L00047
	CMPGE?WCL	_p_pwm_val, 078h, L00049
	ADD?WCW	_p_pwm_val, 001h, _p_pwm_val
	GOTO?L	L00050
	LABEL?L	L00049	
	MOVE?CW	078h, _p_pwm_val
	LABEL?L	L00050	
	LABEL?L	L00047	
	CMPLE?WWL	_p_val, _p_ref, L00051
	CMPLE?WCL	_p_pwm_val, 032h, L00053
	SUB?WWW	_p_val, _p_ref, T1
	CMPLE?WCL	T1, 005h, L00055
	SUB?WWW	_p_val, _p_ref, T1
	DIV?WCW	T1, 032h, T1
	SUB?WWW	_p_pwm_val, T1, _p_pwm_val
	GOTO?L	L00056
	LABEL?L	L00055	
	SUB?WCW	_p_pwm_val, 001h, _p_pwm_val
	LABEL?L	L00056	
	GOTO?L	L00054
	LABEL?L	L00053	
	MOVE?CW	032h, _p_pwm_val
	LABEL?L	L00054	
	LABEL?L	L00051	
	RETURN?	

	END
