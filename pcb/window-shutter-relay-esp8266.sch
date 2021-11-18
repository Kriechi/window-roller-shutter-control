EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Window Shutter Control 3-gang"
Date "2021-11-13"
Rev ""
Comp "Thomas Kriechbaumer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Relay:SANYOU_SRD_Form_C K5
U 1 1 5C85533A
P 8800 5450
F 0 "K5" H 9230 5496 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 9230 5405 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9250 5400 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8800 5450 50  0001 C CNN
	1    8800 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack J0
U 1 1 5C855415
P 1000 900
F 0 "J0" H 1055 1225 50  0000 C CNN
F 1 "Barrel_Jack" H 1055 1134 50  0000 C CNN
F 2 "Connectors:Barrel_Jack_CUI_PJ-036AH-SMT" H 1050 860 50  0001 C CNN
F 3 "~" H 1050 860 50  0001 C CNN
	1    1000 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q6
U 1 1 5C8552CE
P 8100 5950
F 0 "Q6" H 8291 5996 50  0000 L CNN
F 1 "Q_NPN_BCE" H 8291 5905 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8300 6050 50  0001 C CNN
F 3 "~" H 8100 5950 50  0001 C CNN
	1    8100 5950
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D6
U 1 1 5C856014
P 8200 5450
F 0 "D6" V 8250 5700 50  0000 R CNN
F 1 "DIODE" V 8150 5800 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 8200 5450 50  0001 C CNN
F 3 "~" H 8200 5450 50  0001 C CNN
	1    8200 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 5750 8200 5750
Wire Wire Line
	8200 5750 8200 5650
Wire Wire Line
	8600 5150 8200 5150
Wire Wire Line
	8200 5150 8200 5250
$Comp
L Device:R R6
U 1 1 5C87A118
P 7750 5950
F 0 "R6" V 7543 5950 50  0000 C CNN
F 1 "220" V 7634 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7680 5950 50  0001 C CNN
F 3 "~" H 7750 5950 50  0001 C CNN
	1    7750 5950
	0    1    1    0   
$EndComp
Text GLabel 8200 6150 3    50   Input ~ 0
GND
Text GLabel 8200 5150 1    50   Input ~ 0
5V
Text GLabel 1300 4500 0    50   Input ~ 0
MCU_VIN
Text GLabel 1300 1000 2    50   Input ~ 0
GND
Text GLabel 1300 4400 0    50   Input ~ 0
GND
$Comp
L Relay:SANYOU_SRD_Form_C K6
U 1 1 5C87D4A6
P 8800 4050
F 0 "K6" H 9230 4096 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 9230 4005 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9250 4000 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8800 4050 50  0001 C CNN
	1    8800 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q5
U 1 1 5C87D4AD
P 8100 4550
F 0 "Q5" H 8291 4596 50  0000 L CNN
F 1 "Q_NPN_BCE" H 8291 4505 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8300 4650 50  0001 C CNN
F 3 "~" H 8100 4550 50  0001 C CNN
	1    8100 4550
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D5
U 1 1 5C87D4B4
P 8200 4050
F 0 "D5" V 8250 4300 50  0000 R CNN
F 1 "DIODE" V 8150 4400 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 8200 4050 50  0001 C CNN
F 3 "~" H 8200 4050 50  0001 C CNN
	1    8200 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 4350 8200 4350
Wire Wire Line
	8200 4350 8200 4250
Wire Wire Line
	8600 3750 8200 3750
Wire Wire Line
	8200 3750 8200 3850
$Comp
L Device:R R5
U 1 1 5C87D4C0
P 7750 4550
F 0 "R5" V 7543 4550 50  0000 C CNN
F 1 "220" V 7634 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7680 4550 50  0001 C CNN
F 3 "~" H 7750 4550 50  0001 C CNN
	1    7750 4550
	0    1    1    0   
$EndComp
Text GLabel 8200 4750 3    50   Input ~ 0
GND
Text GLabel 8200 3750 1    50   Input ~ 0
5V
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 5C86CDA5
P 10250 4750
F 0 "J3" H 10330 4792 50  0000 L CNN
F 1 "Terminal_01x03" H 10330 4701 50  0000 L CNN
F 2 "footprints:TerminalBlock_HB-9500-3_P9.50mm" H 10250 4750 50  0001 C CNN
F 3 "~" H 10250 4750 50  0001 C CNN
	1    10250 4750
	1    0    0    1   
$EndComp
Wire Wire Line
	8900 5150 8900 4750
Wire Wire Line
	8900 4750 9000 4750
Wire Wire Line
	9000 4750 9000 4350
Wire Wire Line
	9100 3750 10000 3750
Wire Wire Line
	9100 4850 9100 5150
Connection ~ 8200 5750
Connection ~ 8200 4350
$Comp
L Switch:SW_SPDT SW1
U 1 1 5C8ADF21
P 2250 1000
F 0 "SW1" H 2250 1285 50  0000 C CNN
F 1 "SW_SPDT" H 2250 1194 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2250 1000 50  0001 C CNN
F 3 "" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
Text GLabel 2050 1000 0    50   Input ~ 0
GND
Text GLabel 2450 900  2    50   Input ~ 0
SW1_1
Text GLabel 2450 1100 2    50   Input ~ 0
SW1_2
$Comp
L Switch:SW_SPDT SW2
U 1 1 5C8B041D
P 2250 1550
F 0 "SW2" H 2250 1835 50  0000 C CNN
F 1 "SW_SPDT" H 2250 1744 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2250 1550 50  0001 C CNN
F 3 "" H 2250 1550 50  0001 C CNN
	1    2250 1550
	1    0    0    -1  
$EndComp
Text GLabel 2050 1550 0    50   Input ~ 0
GND
Text GLabel 2450 1450 2    50   Input ~ 0
SW2_1
Text GLabel 2450 1650 2    50   Input ~ 0
SW2_2
$Comp
L Switch:SW_SPDT SW3
U 1 1 5C8B2349
P 2250 2100
F 0 "SW3" H 2250 2385 50  0000 C CNN
F 1 "SW_SPDT" H 2250 2294 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2250 2100 50  0001 C CNN
F 3 "" H 2250 2100 50  0001 C CNN
	1    2250 2100
	1    0    0    -1  
$EndComp
Text GLabel 2050 2100 0    50   Input ~ 0
GND
Text GLabel 2450 2000 2    50   Input ~ 0
SW3_1
Text GLabel 2450 2200 2    50   Input ~ 0
SW3_2
Text GLabel 8600 4350 3    50   Input ~ 0
SW3_1
Text GLabel 8600 5750 3    50   Input ~ 0
SW3_2
$Comp
L symbols:NodeMCU1.0(ESP-12E)-ESP8266 U1
U 1 1 5C8C3694
P 2100 3800
F 0 "U1" H 2100 4887 60  0000 C CNN
F 1 "NodeMCU1.0(ESP-12E)" H 2100 4781 60  0000 C CNN
F 2 "ESP8266:NodeMCU-LoLinV3" H 1500 2950 60  0001 C CNN
F 3 "" H 1500 2950 60  0000 C CNN
	1    2100 3800
	1    0    0    -1  
$EndComp
Text GLabel 1300 4000 0    50   Input ~ 0
GND
Text GLabel 2900 3700 2    50   Input ~ 0
GND
Text GLabel 2900 4400 2    50   Input ~ 0
GND
$Comp
L Regulator_Linear:AMS1117-5.0 U2
U 1 1 5C8EB4C9
P 1050 2150
F 0 "U2" H 1050 2392 50  0001 C CNN
F 1 "AMS1117-5.0" H 1050 2300 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 1050 2350 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 1150 1900 50  0001 C CNN
	1    1050 2150
	1    0    0    -1  
$EndComp
Text GLabel 1350 2150 2    50   Output ~ 0
5V
Text GLabel 1050 2450 3    50   Input ~ 0
GND
Text GLabel 750  2150 0    50   Input ~ 0
VIN
Text GLabel 1300 800  2    50   Output ~ 0
VIN
Text GLabel 7600 4550 0    50   Input ~ 0
D6
Text GLabel 7600 5950 0    50   Input ~ 0
D7
Text GLabel 2900 3100 2    50   Input ~ 0
D0
Text GLabel 2900 3200 2    50   Input ~ 0
D1
Text GLabel 2900 3300 2    50   Input ~ 0
D2
Text GLabel 2900 3800 2    50   Input ~ 0
D5
Text GLabel 3400 1600 3    50   Input ~ 0
GND
Text GLabel 3700 1000 2    50   Output ~ 0
5V
Text GLabel 3300 1600 3    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5C8E8751
P 3400 2300
F 0 "J5" H 3506 2478 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3506 2387 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3400 2300 50  0001 C CNN
F 3 "~" H 3400 2300 50  0001 C CNN
	1    3400 2300
	1    0    0    -1  
$EndComp
Text GLabel 3600 2300 2    50   Input ~ 0
GND
Text GLabel 3600 2400 2    50   Input ~ 0
5V
$Comp
L pspice:CAP C1
U 1 1 5C8E939D
P 4600 1150
F 0 "C1" H 4778 1196 50  0000 L CNN
F 1 "CAP" H 4778 1105 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 4600 1150 50  0001 C CNN
F 3 "~" H 4600 1150 50  0001 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C2
U 1 1 5C8E9423
P 5150 1150
F 0 "C2" H 5328 1196 50  0000 L CNN
F 1 "CAP" H 5328 1105 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 5150 1150 50  0001 C CNN
F 3 "~" H 5150 1150 50  0001 C CNN
	1    5150 1150
	1    0    0    -1  
$EndComp
Text GLabel 4600 900  1    50   Input ~ 0
5V
Text GLabel 5150 900  1    50   Input ~ 0
5V
Text GLabel 4600 1400 3    50   Input ~ 0
GND
Text GLabel 5150 1400 3    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5D057ECB
P 3400 2800
F 0 "J6" H 3506 2978 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3506 2887 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3400 2800 50  0001 C CNN
F 3 "~" H 3400 2800 50  0001 C CNN
	1    3400 2800
	1    0    0    -1  
$EndComp
Text GLabel 3600 2800 2    50   Input ~ 0
GND
Text GLabel 3600 2900 2    50   Input ~ 0
VIN
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5D06A28B
P 4300 2350
F 0 "J7" H 4408 2631 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4408 2540 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4300 2350 50  0001 C CNN
F 3 "~" H 4300 2350 50  0001 C CNN
	1    4300 2350
	1    0    0    -1  
$EndComp
Text GLabel 4500 2450 2    50   Input ~ 0
VIN
Text GLabel 4500 2250 2    50   Input ~ 0
5V
Text GLabel 4500 2350 2    50   Input ~ 0
MCU_VIN
Text GLabel 2900 4000 2    50   Input ~ 0
D7
Text GLabel 2900 3900 2    50   Input ~ 0
D6
Text GLabel 2900 4100 2    50   Input ~ 0
D8_DO_NOT_USE
Text GLabel 2900 3500 2    50   Input ~ 0
D4_DO_NOT_USE
Text GLabel 2900 3400 2    50   Input ~ 0
D3_DO_NOT_USE
$Comp
L Regulator_Linear:AMS1117-5.0 U4
U 1 1 5D097178
P 1050 1350
F 0 "U4" H 1050 1592 50  0001 C CNN
F 1 "AMS1117-3.3" H 1050 1500 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 1050 1550 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 1150 1100 50  0001 C CNN
	1    1050 1350
	1    0    0    -1  
$EndComp
Text GLabel 1050 1650 3    50   Input ~ 0
GND
Text GLabel 750  1350 0    50   Input ~ 0
VIN
Text GLabel 1350 1350 2    50   Output ~ 0
3V3
Text GLabel 2100 5100 1    50   Input ~ 0
3V3
Text GLabel 1300 4100 0    50   Input ~ 0
3V3
$Comp
L pspice:CAP C3
U 1 1 5D0A08F8
P 5800 1150
F 0 "C3" H 5978 1196 50  0000 L CNN
F 1 "CAP" H 5978 1105 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 5800 1150 50  0001 C CNN
F 3 "~" H 5800 1150 50  0001 C CNN
	1    5800 1150
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C4
U 1 1 5D0A08FE
P 6350 1150
F 0 "C4" H 6528 1196 50  0000 L CNN
F 1 "CAP" H 6528 1105 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 6350 1150 50  0001 C CNN
F 3 "~" H 6350 1150 50  0001 C CNN
	1    6350 1150
	1    0    0    -1  
$EndComp
Text GLabel 5800 900  1    50   Input ~ 0
3V3
Text GLabel 6350 900  1    50   Input ~ 0
3V3
Text GLabel 5800 1400 3    50   Input ~ 0
GND
Text GLabel 6350 1400 3    50   Input ~ 0
GND
Text GLabel 7600 2900 0    50   Input ~ 0
D5
Text GLabel 7600 1500 0    50   Input ~ 0
D2
Text GLabel 8600 2700 3    50   Input ~ 0
SW2_2
Text GLabel 8600 1300 3    50   Input ~ 0
SW2_1
Text GLabel 8200 3100 3    50   Input ~ 0
GND
Connection ~ 8200 1300
Connection ~ 8200 2700
Wire Wire Line
	9100 650  9100 700 
Wire Wire Line
	8900 1700 8900 2100
Wire Wire Line
	9100 650  10000 650 
Wire Wire Line
	9000 1700 9000 1300
Wire Wire Line
	8900 1700 9000 1700
Text GLabel 8200 700  1    50   Input ~ 0
5V
Text GLabel 8200 1700 3    50   Input ~ 0
GND
$Comp
L Device:R R3
U 1 1 5C87D9E8
P 7750 1500
F 0 "R3" V 7543 1500 50  0000 C CNN
F 1 "220" V 7634 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7680 1500 50  0001 C CNN
F 3 "~" H 7750 1500 50  0001 C CNN
	1    7750 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 700  8200 800 
Wire Wire Line
	8600 700  8200 700 
Wire Wire Line
	8200 1300 8200 1200
Wire Wire Line
	8600 1300 8200 1300
$Comp
L pspice:DIODE D3
U 1 1 5C87D9DC
P 8200 1000
F 0 "D3" V 8250 1250 50  0000 R CNN
F 1 "DIODE" V 8150 1350 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 8200 1000 50  0001 C CNN
F 3 "~" H 8200 1000 50  0001 C CNN
	1    8200 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_BCE Q3
U 1 1 5C87D9D5
P 8100 1500
F 0 "Q3" H 8291 1546 50  0000 L CNN
F 1 "Q_NPN_BCE" H 8291 1455 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8300 1600 50  0001 C CNN
F 3 "~" H 8100 1500 50  0001 C CNN
	1    8100 1500
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K4
U 1 1 5C87D9CE
P 8800 1000
F 0 "K4" H 9230 1046 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 9230 955 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9250 950 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8800 1000 50  0001 C CNN
	1    8800 1000
	1    0    0    -1  
$EndComp
Text GLabel 8200 2100 1    50   Input ~ 0
5V
$Comp
L Device:R R4
U 1 1 5C87D645
P 7750 2900
F 0 "R4" V 7543 2900 50  0000 C CNN
F 1 "220" V 7634 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7680 2900 50  0001 C CNN
F 3 "~" H 7750 2900 50  0001 C CNN
	1    7750 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 2100 8200 2200
Wire Wire Line
	8600 2100 8200 2100
Wire Wire Line
	8200 2700 8200 2600
Wire Wire Line
	8600 2700 8200 2700
$Comp
L pspice:DIODE D4
U 1 1 5C87D639
P 8200 2400
F 0 "D4" V 8250 2650 50  0000 R CNN
F 1 "DIODE" V 8150 2750 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 8200 2400 50  0001 C CNN
F 3 "~" H 8200 2400 50  0001 C CNN
	1    8200 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_BCE Q4
U 1 1 5C87D632
P 8100 2900
F 0 "Q4" H 8291 2946 50  0000 L CNN
F 1 "Q_NPN_BCE" H 8291 2855 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8300 3000 50  0001 C CNN
F 3 "~" H 8100 2900 50  0001 C CNN
	1    8100 2900
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K3
U 1 1 5C87D62B
P 8800 2400
F 0 "K3" H 9230 2446 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 9230 2355 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9250 2350 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8800 2400 50  0001 C CNN
	1    8800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1850 9100 2100
Wire Wire Line
	9000 2700 10000 2700
Wire Wire Line
	10050 1850 9100 1850
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5C86CC57
P 10250 1750
F 0 "J2" H 10330 1792 50  0000 L CNN
F 1 "Terminal_01x03" H 10330 1701 50  0000 L CNN
F 2 "footprints:TerminalBlock_HB-9500-3_P9.50mm" H 10250 1750 50  0001 C CNN
F 3 "~" H 10250 1750 50  0001 C CNN
	1    10250 1750
	1    0    0    1   
$EndComp
Wire Wire Line
	10050 4850 9100 4850
Wire Wire Line
	10050 4750 10000 4750
Wire Wire Line
	10000 4750 10000 5750
Wire Wire Line
	10000 5750 9000 5750
Wire Wire Line
	10050 4650 10000 4650
Wire Wire Line
	10000 4650 10000 3750
Wire Wire Line
	10000 2700 10000 1750
Wire Wire Line
	10000 1750 10050 1750
Wire Wire Line
	10050 1650 10000 1650
Wire Wire Line
	10000 1650 10000 650 
Text GLabel 4750 6850 3    50   Input ~ 0
GND
$Comp
L Relay:SANYOU_SRD_Form_C K1
U 1 1 5C87E611
P 5450 6150
F 0 "K1" H 5880 6196 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 5880 6105 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 5900 6100 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 5450 6150 50  0001 C CNN
	1    5450 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q2
U 1 1 5C87E618
P 4650 6650
F 0 "Q2" H 4841 6696 50  0000 L CNN
F 1 "Q_NPN_BCE" H 4841 6605 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4850 6750 50  0001 C CNN
F 3 "~" H 4650 6650 50  0001 C CNN
	1    4650 6650
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D2
U 1 1 5C87E61F
P 4750 6150
F 0 "D2" V 4800 6400 50  0000 R CNN
F 1 "DIODE" V 4700 6500 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 4750 6150 50  0001 C CNN
F 3 "~" H 4750 6150 50  0001 C CNN
	1    4750 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4750 6450 4750 6350
Wire Wire Line
	4750 5850 4750 5950
$Comp
L Device:R R2
U 1 1 5C87E62B
P 4300 6650
F 0 "R2" V 4093 6650 50  0000 C CNN
F 1 "220" V 4184 6650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4230 6650 50  0001 C CNN
F 3 "~" H 4300 6650 50  0001 C CNN
	1    4300 6650
	0    1    1    0   
$EndComp
Text GLabel 4750 5850 1    50   Input ~ 0
5V
$Comp
L Relay:SANYOU_SRD_Form_C K2
U 1 1 5C87E9CE
P 5350 4750
F 0 "K2" H 5780 4796 50  0000 L CNN
F 1 "SRD-05BDC-SL-C" H 5780 4705 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 5800 4700 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 5350 4750 50  0001 C CNN
	1    5350 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 5C87E9D5
P 4650 5250
F 0 "Q1" H 4841 5296 50  0000 L CNN
F 1 "Q_NPN_BCE" H 4841 5205 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4850 5350 50  0001 C CNN
F 3 "~" H 4650 5250 50  0001 C CNN
	1    4650 5250
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D1
U 1 1 5C87E9DC
P 4750 4750
F 0 "D1" V 4800 5000 50  0000 R CNN
F 1 "DIODE" V 4700 5100 50  0000 R CNN
F 2 "LEDs:LED_1206_HandSoldering" H 4750 4750 50  0001 C CNN
F 3 "~" H 4750 4750 50  0001 C CNN
	1    4750 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 5050 4750 5050
Wire Wire Line
	4750 5050 4750 4950
Wire Wire Line
	5150 4450 4750 4450
Wire Wire Line
	4750 4450 4750 4550
$Comp
L Device:R R1
U 1 1 5C87E9E8
P 4300 5250
F 0 "R1" V 4093 5250 50  0000 C CNN
F 1 "220" V 4184 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4230 5250 50  0001 C CNN
F 3 "~" H 4300 5250 50  0001 C CNN
	1    4300 5250
	0    1    1    0   
$EndComp
Text GLabel 4750 5450 3    50   Input ~ 0
GND
Text GLabel 4750 4450 1    50   Input ~ 0
5V
Connection ~ 4750 5050
Wire Wire Line
	4750 6450 5250 6450
Wire Wire Line
	4750 5850 5250 5850
Wire Wire Line
	5550 5050 5550 5850
Wire Wire Line
	5650 4450 6550 4450
Connection ~ 4750 6450
Text GLabel 5150 5050 3    50   Input ~ 0
SW1_1
Text GLabel 5250 6450 3    50   Input ~ 0
SW1_2
Text GLabel 4150 5250 0    50   Input ~ 0
D0
Text GLabel 4150 6650 0    50   Input ~ 0
D1
Wire Wire Line
	6600 5550 5750 5550
Wire Wire Line
	6600 5350 6550 5350
Wire Wire Line
	6550 5350 6550 4450
Wire Wire Line
	6600 5450 6550 5450
Wire Wire Line
	5650 6450 6550 6450
Wire Wire Line
	5750 5550 5750 5850
Wire Wire Line
	6550 5450 6550 6450
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5C86C7AD
P 6800 5450
F 0 "J1" H 6880 5492 50  0000 L CNN
F 1 "Terminal_01x03" H 6880 5401 50  0000 L CNN
F 2 "footprints:TerminalBlock_HB-9500-3_P9.50mm" H 6800 5450 50  0001 C CNN
F 3 "~" H 6800 5450 50  0001 C CNN
	1    6800 5450
	1    0    0    1   
$EndComp
Text GLabel 2700 6000 2    50   Input ~ 0
D7
Text GLabel 2700 5900 2    50   Input ~ 0
D6
Text GLabel 2700 6100 2    50   Input ~ 0
D5
Text GLabel 2700 6300 2    50   Input ~ 0
D0
Text GLabel 2700 5800 2    50   Input ~ 0
D1
Text GLabel 2700 5700 2    50   Input ~ 0
D2
Text GLabel 2700 5500 2    50   Input ~ 0
D4_DO_NOT_USE
Text GLabel 2700 6200 2    50   Input ~ 0
D8_DO_NOT_USE
Text GLabel 2100 6600 3    50   Input ~ 0
GND
$Comp
L RF_Module:ESP-12E U3
U 1 1 5D08A92C
P 2100 5900
F 0 "U3" H 2250 6700 50  0000 C CNN
F 1 "ESP-12E" H 2100 6574 50  0000 C CNN
F 2 "ESP8266:ESP-12E_SMD" H 2100 5900 50  0001 C CNN
F 3 "http://l0l.org.uk/2014/12/esp8266-modules-hardware-guide-gotta-catch-em-all/" H 2100 5900 50  0001 C CNN
	1    2100 5900
	1    0    0    -1  
$EndComp
Text GLabel 2900 4500 2    50   Input ~ 0
3V3
Text GLabel 2900 3600 2    50   Input ~ 0
3V3
Text GLabel 2700 5300 2    50   Input ~ 0
D3_DO_NOT_USE
$Comp
L Connector:USB_B_Micro J4
U 1 1 5C8EED67
P 3400 1200
F 0 "J4" H 3455 1667 50  0000 C CNN
F 1 "USB_B_Micro" H 3455 1576 50  0000 C CNN
F 2 "Connectors:USB_Micro-B" H 3550 1150 50  0001 C CNN
F 3 "~" H 3550 1150 50  0001 C CNN
	1    3400 1200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
