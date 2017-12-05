INCLUDE "ez8.inc"
VECTOR Reset=zacatek
org %100
zacatek:
SRP #%00
LDX SPL,#%FF
LDX SPH,#%00

LDX PAADDR,#%01
LDX PACTL,#%00

LDX R11,#%11

;dasdasdasdsdasdasdasdsadasdasdads

LDX R11,#%11
opakuj:
LDX R10,#%60
zacit_vlevo:
CALL toc_doleva
DEC R10
JP nz,zacit_vlevo
CALL cekej
CALL cekej
CALL cekej
CALL cekej

LDX R10,#%40

zacit_vpravo:
CALL toc_doprava
DEC R10
JP nz,zacit_vpravo
CALL cekej
CALL cekej
CALL cekej
CALL cekej
JP opakuj


;konec

toc_doleva:
LDX PAOUT,R11
RL R11
CALL cekej
RET

toc_doprava:
LDX PAOUT,R11
RR R11
CALL cekej
RET

cekej:
LDX R0,#%04
CLR R1
CLR R2
hopsem:
DEC R2
JR nz,hopsem

DEC R1
JR nz,hopsem

DEC R0
JR nz,hopsem

RET