INCLUDE "ez8.inc"
VECTOR Reset=zacatek
org %100
zacatek:
SRP #%00
LDX SPL,#%FF
LDX SPH,#%00

LDX PAADDR,#%01
LDX PACTL,#%00
LDX PBADDR,#%01
LDX PBCTL,#%00

;CESA ----   
; C - 00111001 - 39
; E - 01111001 - 79
; S - 01101101 - 6D
; A - 01110111 - 77
; 
; AHOJ
; A - 77
; H - 01110110 - 76
; O - 00111111 - 3F
; J - 00011110 - 1E

; 8 - 4.
; 4 - 3.
; 2 - 2.
; 1 - 1.
LDX R3,#%04
CLR R4
CLR R5

opakuj:

;C
LDX PBOUT,#%01
LDX PAOUT,#%39
CALL cekej
;E
LDX PBOUT,#%02
LDX PAOUT,#%79
CALL cekej
;S
LDX PBOUT,#%04
LDX PAOUT,#%6D
CALL cekej
;A
LDX PBOUT,#%08
LDX PAOUT,#%77
CALL cekej


DEC R5
JR nz,opakuj
;DEC R4
;JR nz,opakuj
;DEC R3
;JR nz,opakuj

LDX R3,#%04
CLR R4
CLR R5

twoseg:
;A
LDX PBOUT,#%01
LDX PAOUT,#%77
CALL cekej
;H
LDX PBOUT,#%02
LDX PAOUT,#%76
CALL cekej
;O
LDX PBOUT,#%04
LDX PAOUT,#%3F
CALL cekej
;J
LDX PBOUT,#%08
LDX PAOUT,#%1E
CALL cekej

DEC R5
JR nz,twoseg
JP opakuj


cekej:
LDX R0,#%04
CLR R1
hopsem:

DEC R1
JR nz,hopsem

DEC R0
JR nz,hopsem

RET

cekejdyl:
LDX R3,#%04
CLR R4
CLR R5
hopsemdyl:
DEC R5
JR nz,hopsemdyl
DEC R4
JR nz,hopsemdyl

DEC R3
JR nz,hopsemdyl

RET