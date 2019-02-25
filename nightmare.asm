;Qualquer X neste codigo refere se a linhas,Y para colunas.
;include emu8086.inc 
CURSOROFF 

RESET2:


MOV AH, 9  
LEA DX, ZA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, Z2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, Z3
INT 21H                                                  
MOV AH, 9
LEA DX, Z4
INT 21H                                                  
MOV AH, 9
LEA DX, Z5
INT 21H                                                  
MOV AH, 9
LEA DX, Z6
INT 21H                                                  
MOV AH, 9
LEA DX, Z7
INT 21H                                                  
MOV AH, 9
LEA DX, Z8
INT 21H                                                  
MOV AH, 9
LEA DX, Z9
INT 21H                                                  
MOV AH, 9
LEA DX, Z10
INT 21H                                                  
MOV AH, 9
LEA DX, Z11
INT 21H                                                  
MOV AH, 9
LEA DX, Z12
INT 21H                                                  
MOV AH, 9
LEA DX, Z13
INT 21H                                                  
MOV AH, 9
LEA DX, Z14
INT 21H                                                  
MOV AH, 9
LEA DX, Z15
INT 21H                                                  
MOV AH, 9
LEA DX, Z16
INT 21H                                                  
MOV AH, 9
LEA DX, Z17
INT 21H                                                  
MOV AH, 9
LEA DX, Z18
INT 21H                                                  
MOV AH, 9
LEA DX, Z19
INT 21H                                                  
MOV AH, 9
LEA DX, Z20
INT 21H                                                  
MOV AH, 9
LEA DX, Z21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, Z26
INT 21H  
MOV AH, 9
LEA DX, Z27
INT 21H                                         
MOV AH, 9
LEA DX, ZB
INT 21H                                                  


;PACMAN

MOV PX, 8
MOV PY, 2  

MOV POX, 0
MOV POY, 0

MOV CON, 0          
MOV BOLA, 0

;STALKER
MOV SX, 22
MOV SY, 22
MOV SOX, 0
MOV SOY, 0

;RANDY
MOV Gx, 22
MOV GY, 23
MOV GOX, 0
MOV GOY, 0
MOV RAND, 0 

;MIRROR
MOV MX, 22
MOV MY, 22
MOV MOX, 0
MOV MOY, 0
                                           
;MOVIMENTO

PACMAN2:
   
INICIO2:
GOTOXY  POY,POX
PUTC 002
GOTOXY  PY,PX
PUTC 128     

;Movimento Mirror


GOTOXY  MOY,MOX
PUTC 002
GOTOXY  MY,MX
PUTC 036

MOV BH,PY
CMP MY,BH
JE GO3
JMP STALKER2


GO3:
MOV BH,PX
CMP MX,BH
JE GAMEOVER2
JNE STALKER2




WHAT2:;LEITURA DE CARACTERES
mov     ah, 01h
int     16h
jz      CONTINUO2
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h           

;COMPARACOES

CMP AL,087
JE UP2
CMP AL,083
JE DOWN2
CMP AL,068
JE RIGHT2
CMP AL,065
JE LEFT2 

;minusculas

CMP AL,119
JE UP2
CMP AL,115
JE DOWN2
CMP AL,100
JE RIGHT2
CMP AL,097
JE LEFT2

JMP INICIO2


UP2: 
MOV DH,PX
MOV POX,DH
MOV DL,PY 
MOV POY,DL
SUB PX,1 

;MIRROR
MOV DH,MX
MOV MOX,DH
MOV DL,MY 
MOV MOY,DL
INC MX 
 
MOV CON,1
JMP WALL2        


DOWN2:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PX 

;MIRROR
MOV DH,MX
MOV MOX,DH
MOV DL,MY 
MOV MOY,DL
SUB MX,1
 
MOV CON,2 
JMP WALL2

RIGHT2:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PY 

;MIRROR
MOV DH,MX
MOV MOX,DH
MOV DL,MY 
MOV MOY,DL
INC MY

MOV CON,3
JMP WALL2      

LEFT2: 
MOV DH,PX
MOV DL,PY
MOV POX,DH
MOV POY,DL
SUB PY,1

;MIRROR
MOV DH,MX
MOV MOX,DH
MOV DL,MY 
MOV MOY,DL
SUB MY,1

MOV CON,4
JMP WALL2  


WALL2:

;Parede Mirror   
mov al, 47
mul MX   
mov dl, MY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP ZA[BX],'X' 
JE stopm
CMP ZA[BX],'|' 
JE stopm
CMP ZA[BX],'=' 
JE stopm


WALL3:

;PAREDES
mov al, 47
mul PX   
mov dl, PY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP ZA[BX],'X' 
JE stop2
CMP ZA[BX],'|' 
JE stop2
CMP ZA[BX],'=' 
JE stop2
;bolas
CMP ZA[BX],'o'
JE BOLAS2
;fantasmas



   
JMP INICIO2

;PARA MOVIMENTO
STOP2:

MOV BH,POX
MOV BL,POY
MOV PX,BH
MOV PY,BL
JMP INICIO2

;Para o movimento Mirror
STOPM:
MOV BH,MOX
MOV BL,MOY
MOV MX,BH
MOV MY,BL
JMP WALL3



;ASSEGURA SE DO MOVIMENTO CONTINUO
CONTINUO2:
CMP CON,1
JE UP2
CMP CON,2
JE DOWN2
CMP CON,3
JE RIGHT2
CMP CON,4
JE LEFT2
JMP INICIO2

;MECANISMO DE VICTORIA
BOLAS2:

INC BOLA
MOV DH,0
MOV DH,BOLA
CMP DH,10
JE WIN2
JNE INICIO2

WIN2:
include win_N.asm                                           

RET

GAMEOVER2: 
include gameover_N.asm
RET


;STALKER

STALKER2:

MOV_STALK_X2:
MOV DH,PX
CMP SX,DH
JG LESSPX2
JL MOREPX2
JE MOV_STALK_Y2

MOV_STALK_Y2:
MOV DH,PY
CMP SY,DH
JG LESSPY2
JL MOREPY2
JE MOV_STALK_X2

LESSPX2:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
SUB SX,1
JMP WALLS2

MOREPX2:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
INC SX
JMP WALLS2

LESSPY2:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
SUB SY,1
JMP WALLSY2


MOREPY2:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
INC SY
JMP WALLSY2

WALLS2:
mov al, 47
mul SX   
mov dl, SY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax
CMP ZA[BX],'X' 
JE  STOPX2
CMP ZA[BX],'|' 
JE  STOPX2
CMP ZA[BX],'=' 
JE  STOPX2
;CMP LA[BX],'o' 
;JE MOVIMENTOBOLA_S  
JNE MOV_STALK2
              
WALLSY2:
mov al, 47
mul SX   
mov dl, SY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP ZA[BX],'X' 
JE  STOPY2
CMP ZA[BX],'|' 
JE  STOPY2
CMP ZA[BX],'=' 
JE  STOPY2
;CMP LA[BX],'o' 
;JE STOPX  
JNE MOV_STALK2              
              
              
              
MOV_STALK2:
GOTOXY  SOY,SOX
PUTC 002
GOTOXY  SY,SX
PUTC 035

MOV DH,PY
CMP SY,DH
JE GO22
JMP ALIE2

GO22:
MOV DH,PX
CMP SX,DH
JE GAMEOVER2
JNE ALIE2


;MOVIMENTOBOLA_S:

;GOTOXY  SOY,SOX
;PUTC 000
;GOTOXY  SY,SX
;PUTC 035 
;JMP WHAT      

STOPX2:
MOV DH,SOX
MOV SX,DH
MOV DH,SOY
MOV SY,DH            
;UNSTUCK           
mov     ah, 01h
int     16h
jz      MOV_STALK_Y2
JNZ     ALIE2
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h               
JMP MOV_STALK_Y2

STOPY2:
MOV DH,SOY
MOV SY,DH
MOV DH,SOX
MOV SX,DH 
;UNSTUCK
mov     ah, 01h
int     16h
jz      MOV_STALK_Y2
JNZ     WHAT2
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h 
JMP MOV_STALK_X2
  

RANDY2:;Fantasma Aliatorio

MOVIMENTOGHOST2:

GOTOXY  GOY,GOX
PUTC 002
GOTOXY  GY,GX
PUTC 169
MOV DH,PY
CMP GY,DH
JE GO32
JMP WHAT2

GO32:
MOV DH,PX
CMP GX,DH
JE GAMEOVER2
JNE WHAT2


 
JMP WHAT2
;MOVIMENTO ALIETORIO


ALIE2:

MOV AH, 00h   
INT 1AH    
mov  ax, dx
xor  dx, dx
mov  cx, 4    
div  cx  
add  dl, '0' 
MOV RAND,DL
 
;COMPARACAO RANDY
CMP RAND,31h
JE UPG2
CMP RAND,32h
JE DOWNG2
CMP RAND,33h
JE RIGHTG2
CMP RAND,34h
JE LEFTG2


UPG2: 
MOV DH,GX
MOV GOX,DH
MOV DL,GY 
MOV GOY,DL
SUB GX,1
JMP WALLG2        


DOWNG2:
MOV DH,GX
MOV DL,GY 
MOV GOX,DH
MOV GOY,DL
INC GX  
JMP WALLG2

RIGHTG2:
MOV DH,GX
MOV DL,GY 
MOV GOX,DH
MOV GOY,DL
INC GY 

JMP WALLG2      

LEFTG2: 
MOV DH,GX
MOV DL,GY
MOV GOX,DH
MOV GOY,DL
SUB GY,1

JMP WALLG2  




WALLG2:   

;PAREDES
mov al, 47
mul GX   
mov dl, GY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP ZA[BX],'X' 
JE stopghost2
CMP ZA[BX],'|' 
JE stopghost2
CMP ZA[BX],'=' 
JE stopghost2 
;CMP XA[BX],'o' 
;JE MOVIMENTOBOLA  
JMP MOVIMENTOGHOST2


STOPGHOST2:
MOV BH,GOX
MOV BL,GOY
MOV GX,BH
MOV GY,BL
;Caso embata numa parede muda de direcao
JMP ALIE2

;Variaveis Nightmare Mode

;Fantasmas

;Mirror
MX DB 22
MY DB 22
MOX DB 0
MOY DB 0


;RANDY

GX DB 22
GY DB 23
GOX DB 0
GOY DB 0
RAND DB 0

;MAPAS                                                
 ZA DB 13,10, '============================================','$'
 Z2 DB 13,10, '|XXX X    XX   XX   XXXX   XX   XX    X XXX|','$'
 Z3 DB 13,10, '|    X    oo      X      X            X    |','$'
 Z4 DB 13,10, '| XX X    XXXXXXX X  XX  X XXXXXXX    X XX |','$'
 Z5 DB 13,10, '| ooo     oo   XX X  XX  X XX   oo         |','$'
 Z6 DB 13,10, '| XXX  XXXXXXX XX X  XX  X XX XXXXXXX  XXX |','$'
 Z7 DB 13,10, '| XXX  X     X XX X  XX  X XX X     X  XXX |','$'
 Z8 DB 13,10, '| XXX  XXXXXXX XX X      X XX XXXXXXX  XXX |','$'
 Z9 DB 13,10, '|                     oo                   |','$'
Z10 DB 13,10, '|X X XXXX   X       XXXX       X   XXXX X X|','$'
Z11 DB 13,10, '|X X Xo     XXXXXX        XXXXXX    ooX X X|','$'
Z12 DB 13,10, '|X X XoXX X X X XX        XX X X X XXoX X X|','$'
Z13 DB 13,10, '|X X X XX X XXXXXX  XXXX  XXXXXX X XX X X X|','$'
Z14 DB 13,10, '|  X X XX           XXXX      o    XX X X  |','$'
Z15 DB 13,10, '|    X XX  XXXXXXXX      XXXXXXX   XX X    |','$'
Z16 DB 13,10, '|XXX X XX  X                   X   XX X XXX|','$'
Z17 DB 13,10, '|             X    X    X   X              |','$'
Z18 DB 13,10, '| XXX  XXXXX  X X  X    X   X  XXXXX  XXXX |','$'
Z19 DB 13,10, '|      X X X  X    X XX  X  X  X X X       |','$'
Z20 DB 13,10, '| XX  oXXXXX  X                XXXXX  X XX |','$'
Z21 DB 13,10, '| XX  o         X  X XX X  X     o      XX |','$'
Z26 DB 13,10, '| XX      XXXXX X  X    X  X XXXXX  XX  XX |','$'
Z27 DB 13,10, '|    XXX   ooo                      XXX    |','$'
 ZB DB 13,10, '============================================','$'
