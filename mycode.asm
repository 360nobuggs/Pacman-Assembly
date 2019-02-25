;Qualquer X neste codigo refere se a linhas,Y para colunas.
;include emu8086.inc 
CURSOROFF 

RESET2:


MOV AH, 9  
LEA DX, LA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, L2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, L3
INT 21H                                                  
MOV AH, 9
LEA DX, L4
INT 21H                                                  
MOV AH, 9
LEA DX, L5
INT 21H                                                  
MOV AH, 9
LEA DX, L6
INT 21H                                                  
MOV AH, 9
LEA DX, L7
INT 21H                                                  
MOV AH, 9
LEA DX, L8
INT 21H                                                  
MOV AH, 9
LEA DX, L9
INT 21H                                                  
MOV AH, 9
LEA DX, L10
INT 21H                                                  
MOV AH, 9
LEA DX, L11
INT 21H                                                  
MOV AH, 9
LEA DX, L12
INT 21H                                                  
MOV AH, 9
LEA DX, L13
INT 21H                                                  
MOV AH, 9
LEA DX, L14
INT 21H                                                  
MOV AH, 9
LEA DX, L15
INT 21H                                                  
MOV AH, 9
LEA DX, L16
INT 21H                                                  
MOV AH, 9
LEA DX, L17
INT 21H                                                  
MOV AH, 9
LEA DX, L18
INT 21H                                                  
MOV AH, 9
LEA DX, L19
INT 21H                                                  
MOV AH, 9
LEA DX, L20
INT 21H                                                  
MOV AH, 9
LEA DX, L21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, L26
INT 21H  
MOV AH, 9
LEA DX, L27
INT 21H                                         
MOV AH, 9
LEA DX, LB
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
                                           
;MOVIMENTO

PACMAN2:
   
INICIO2:
GOTOXY  POY,POX
PUTC 002
GOTOXY  PY,PX
PUTC 128

JMP STALKER2


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
 
MOV CON,1
JMP WALL2        


DOWN2:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PX 
MOV CON,2 
JMP WALL2

RIGHT2:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PY 

MOV CON,3
JMP WALL2      

LEFT2: 
MOV DH,PX
MOV DL,PY
MOV POX,DH
MOV POY,DL
SUB PY,1

MOV CON,4
JMP WALL2  


WALL2:   

;PAREDES
mov al, 47
mul PX   
mov dl, PY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP LA[BX],'X' 
JE stop2
CMP LA[BX],'|' 
JE stop2
CMP LA[BX],'=' 
JE stop2
;bolas
CMP LA[BX],'o'
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

MOV_STALK_X:
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
CMP LA[BX],'X' 
JE  STOPX2
CMP LA[BX],'|' 
JE  STOPX2
CMP LA[BX],'=' 
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

CMP LA[BX],'X' 
JE  STOPY2
CMP LA[BX],'|' 
JE  STOPY2
CMP LA[BX],'=' 
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

CMP LA[BX],'X' 
JE stopghost2
CMP LA[BX],'|' 
JE stopghost2
CMP LA[BX],'=' 
JE stopghost2 
;CMP XA[BX],'o' 
;JE MOVIMENTOBOLA  
JMP MOVIMENTOGHOST2


STOPGHOST2:
MOV BH,GOX
MOV BL,GOY
MOV GX,BH
MOV GY,BL
JMP MOVIMENTOGHOST2





;PACMAN

PX DB 8
PY DB 2  

POX DB 0
POY DB 0

CON DB 0          
BOLA DB 0

;STALKER
SX db 22
SY db 22
SOX db 0
SOY db 0

;RANDY

GX DB 22
GY DB 23
GOX DB 0
GOY DB 0
RAND DB 0

;MAPAS                                                
 LA DB 13,10, '============================================','$'
 L2 DB 13,10, '|XXX X    XX   XX   XXXX   XX   XX    X XXX|','$'
 L3 DB 13,10, '|    X    oo      X      X            X    |','$'
 L4 DB 13,10, '| XX X    XXXXXXX X  XX  X XXXXXXX    X XX |','$'
 L5 DB 13,10, '| ooo     oo   XX X  XX  X XX   oo         |','$'
 L6 DB 13,10, '| XXX  XXXXXXX XX X  XX  X XX XXXXXXX  XXX |','$'
 L7 DB 13,10, '| XXX  X     X XX X  XX  X XX X     X  XXX |','$'
 L8 DB 13,10, '| XXX  XXXXXXX XX X      X XX XXXXXXX  XXX |','$'
 L9 DB 13,10, '|           X         oo       X           |','$'
L10 DB 13,10, '|X X XXXX   X       XXXX       X   XXXX X X|','$'
L11 DB 13,10, '|X X Xo     XXXXXX        XXXXXX    ooX X X|','$'
L12 DB 13,10, '|X X XoXX X X X XX        XX X X X XXoX X X|','$'
L13 DB 13,10, '|X X X XX X XXXXXX  XXXX  XXXXXX X XX X X X|','$'
L14 DB 13,10, '|  X X XX           XXXX      o    XX X X  |','$'
L15 DB 13,10, '|    X XX  XXXXXXXX      XXXXXXX   XX X    |','$'
L16 DB 13,10, '|XXX X XX  X                   X   XX X XXX|','$'
L17 DB 13,10, '|          X  X    X    X    X X           |','$'
L18 DB 13,10, '| XXX  XXXXX  X X  X    X   X  XXXXX  XXXX |','$'
L19 DB 13,10, '|      X X X  X    X XX  X  X  X X X       |','$'
L20 DB 13,10, '| XX  oXXXXX  X                XXXXX  X XX |','$'
L21 DB 13,10, '| XX  o         X  X XX X  X     o      XX |','$'
L26 DB 13,10, '| XX      XXXXX X  X    X  X XXXXX  XX  XX |','$'
L27 DB 13,10, '|    XXX   ooo                      XXX    |','$'
 LB DB 13,10, '============================================','$'

;Qualquer X neste codigo refere se a linhas,Y para colunas.
;include emu8086.inc 
CURSOROFF 

RESET:


MOV AH, 9  
LEA DX, LA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, L2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, L3
INT 21H                                                  
MOV AH, 9
LEA DX, L4
INT 21H                                                  
MOV AH, 9
LEA DX, L5
INT 21H                                                  
MOV AH, 9
LEA DX, L6
INT 21H                                                  
MOV AH, 9
LEA DX, L7
INT 21H                                                  
MOV AH, 9
LEA DX, L8
INT 21H                                                  
MOV AH, 9
LEA DX, L9
INT 21H                                                  
MOV AH, 9
LEA DX, L10
INT 21H                                                  
MOV AH, 9
LEA DX, L11
INT 21H                                                  
MOV AH, 9
LEA DX, L12
INT 21H                                                  
MOV AH, 9
LEA DX, L13
INT 21H                                                  
MOV AH, 9
LEA DX, L14
INT 21H                                                  
MOV AH, 9
LEA DX, L15
INT 21H                                                  
MOV AH, 9
LEA DX, L16
INT 21H                                                  
MOV AH, 9
LEA DX, L17
INT 21H                                                  
MOV AH, 9
LEA DX, L18
INT 21H                                                  
MOV AH, 9
LEA DX, L19
INT 21H                                                  
MOV AH, 9
LEA DX, L20
INT 21H                                                  
MOV AH, 9
LEA DX, L21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, L26
INT 21H  
MOV AH, 9
LEA DX, L27
INT 21H                                         
MOV AH, 9
LEA DX, LB
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


                                           
;MOVIMENTO

PACMAN:
   
INICIO:
GOTOXY  POY,POX
PUTC 002
GOTOXY  PY,PX
PUTC 128

JMP STALKER


WHAT:;LEITURA DE CARACTERES
mov     ah, 01h
int     16h
jz      CONTINUO
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h           

;COMPARACOES

CMP AL,087
JE UP
CMP AL,083
JE DOWN
CMP AL,068
JE RIGHT
CMP AL,065
JE LEFT 

;minusculas

CMP AL,119
JE UP
CMP AL,115
JE DOWN
CMP AL,100
JE RIGHT
CMP AL,097
JE LEFT

JMP INICIO


UP: 
MOV DH,PX
MOV POX,DH
MOV DL,PY 
MOV POY,DL
SUB PX,1
 
MOV CON,1
JMP WALL        


DOWN:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PX 
MOV CON,2 
JMP WALL

RIGHT:
MOV DH,PX
MOV DL,PY 
MOV POX,DH
MOV POY,DL
INC PY 

MOV CON,3
JMP WALL      

LEFT: 
MOV DH,PX
MOV DL,PY
MOV POX,DH
MOV POY,DL
SUB PY,1

MOV CON,4
JMP WALL  


WALL:   

;PAREDES
mov al, 47
mul PX   
mov dl, PY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP LA[BX],'X' 
JE stop
CMP LA[BX],'|' 
JE stop
CMP LA[BX],'=' 
JE stop
;bolas
CMP LA[BX],'o'
JE BOLAS
;fantasmas



   
JMP INICIO

;PARA MOVIMENTO
STOP:

MOV BH,POX
MOV BL,POY
MOV PX,BH
MOV PY,BL
JMP INICIO


;ASSEGURA SE DO MOVIMENTO CONTINUO
CONTINUO:
CMP CON,1
JE UP
CMP CON,2
JE DOWN
CMP CON,3
JE RIGHT
CMP CON,4
JE LEFT
JMP INICIO

;MECANISMO DE VICTORIA
BOLAS:

INC BOLA
MOV DH,0
MOV DH,BOLA
CMP DH,10
JE WIN
JNE INICIO

WIN:
include WIN.asm                                           

RET

GAMEOVER: 
include GAMEOVER.asm



;STALKER

STALKER:

MOV_STALK_X:
MOV DH,PX
CMP SX,DH
JG LESSPX
JL MOREPX
JE MOV_STALK_Y

MOV_STALK_Y:
MOV DH,PY
CMP SY,DH
JG LESSPY
JL MOREPY
JE MOV_STALK_X

LESSPX:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
SUB SX,1
JMP WALLS

MOREPX:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
INC SX
JMP WALLS

LESSPY:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
SUB SY,1
JMP WALLSY


MOREPY:
MOV DL,SX
MOV SOX,DL
MOV DL,SY
MOV SOY,DL
INC SY
JMP WALLSY

WALLS:
mov al, 47
mul SX   
mov dl, SY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax
CMP LA[BX],'X' 
JE  STOPX
CMP LA[BX],'|' 
JE  STOPX
CMP LA[BX],'=' 
JE  STOPX
;CMP LA[BX],'o' 
;JE MOVIMENTOBOLA_S  
JNE MOV_STALK
              
WALLSY:
mov al, 47
mul SX   
mov dl, SY
mov dh, 0 
add ax, dx
add ax, 2   
mov bx, ax

CMP LA[BX],'X' 
JE  STOPY
CMP LA[BX],'|' 
JE  STOPY
CMP LA[BX],'=' 
JE  STOPY
;CMP LA[BX],'o' 
;JE STOPX  
JNE MOV_STALK              
              
              
              
MOV_STALK:
GOTOXY  SOY,SOX
PUTC 002
GOTOXY  SY,SX
PUTC 035

MOV DH,PY
CMP SY,DH
JE GO2
JMP WHAT

GO2:
MOV DH,PX
CMP SX,DH
JE GAMEOVER
JNE WHAT


;MOVIMENTOBOLA_S:

;GOTOXY  SOY,SOX
;PUTC 000
;GOTOXY  SY,SX
;PUTC 035 
;JMP WHAT      

STOPX:
MOV DH,SOX
MOV SX,DH
MOV DH,SOY
MOV SY,DH            
;UNSTUCK           
mov     ah, 01h
int     16h
jz      MOV_STALK_Y
JNZ     WHAT
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h               
JMP MOV_STALK_Y

STOPY:
MOV DH,SOY
MOV SY,DH
MOV DH,SOX
MOV SX,DH 
;UNSTUCK
mov     ah, 01h
int     16h
jz      MOV_STALK_Y
JNZ     WHAT
mov     ah, 00h
int     16h
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h 
JMP MOV_STALK_X
  

;PACMAN

PX DB 8
PY DB 2  

POX DB 0
POY DB 0

CON DB 0          
BOLA DB 0

;STALKER
SX db 22
SY db 22
SOX db 0
SOY db 0

;MAPAS                                                
 LA DB 13,10, '============================================','$'
 L2 DB 13,10, '|XXX X    XX   XX   XXXX   XX   XX    X XXX|','$'
 L3 DB 13,10, '|    X    oo      X      X            X    |','$'
 L4 DB 13,10, '| XX X    XXXXXXX X  XX  X XXXXXXX    X XX |','$'
 L5 DB 13,10, '|         oooooXX X  XX  X XXooooo         |','$'
 L6 DB 13,10, '| XXX  XXXXXXX XX X  XX  X XX XXXXXXX  XXX |','$'
 L7 DB 13,10, '| XXX  X     X XX X  XX  X XX X     X  XXX |','$'
 L8 DB 13,10, '| XXX  XXXXXXX XX X      X XX XXXXXXX  XXX |','$'
 L9 DB 13,10, '|                     o                    |','$'
L10 DB 13,10, '|X X XXXX   XXXXXX  XXXX  XXXXXX   XXXX X X|','$'
L11 DB 13,10, '|X X Xoo    X X XX        XX X X    ooX X X|','$'
L12 DB 13,10, '|X X XoXX X X X XX        XX X X X XXoX X X|','$'
L13 DB 13,10, '|X X X XX X XXXXXX  XXXX  XXXXXX X XX X X X|','$'
L14 DB 13,10, '|  X X XX X                      X XX X X  |','$'
L15 DB 13,10, '|    X XX   XXXXXXX      XXXXXXX   XX X    |','$'
L16 DB 13,10, '|XXX X XX            oo            XX X XXX|','$'
L17 DB 13,10, '|             X    X    X    X             |','$'
L18 DB 13,10, '| XXX  XXX X  X X  X XX X  X X    XXX  XXX |','$'
L19 DB 13,10, '|      X X X  X X  X XX X  X X   oX X      |','$'
L20 DB 13,10, '| XX  oXXX X  X X  X XX X  X X   oXXX X XX |','$'
L21 DB 13,10, '| XX  o         X  X XX X  X     o      XX |','$'
L26 DB 13,10, '| XX  o   XXXXX X  X    X  X XXXXX  XX  XX |','$'
L27 DB 13,10, '|    XXX   ooo                      XXX    |','$'
 LB DB 13,10, '============================================','$'
