;GUI
INCLUDE emu8086.inc
CURSOROFF
MENU:

MOV AH, 9
LEA DX, PA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, P2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, P3
INT 21H                                                  
MOV AH, 9
LEA DX, P4
INT 21H                                                  
MOV AH, 9
LEA DX, P5
INT 21H                                                  
MOV AH, 9
LEA DX, P6
INT 21H                                                  
MOV AH, 9
LEA DX, P7
INT 21H                                                  
MOV AH, 9
LEA DX, P8
INT 21H                                                  
MOV AH, 9
LEA DX, P9
INT 21H                                                  
MOV AH, 9
LEA DX, P10
INT 21H                                                  
MOV AH, 9
LEA DX, P11
INT 21H                                                  
MOV AH, 9
LEA DX, P12
INT 21H                                                  
MOV AH, 9
LEA DX, P13
INT 21H                                                  
MOV AH, 9
LEA DX, P14
INT 21H                                                  
MOV AH, 9
LEA DX, P15
INT 21H                                                  
MOV AH, 9
LEA DX, P16
INT 21H                                                  
MOV AH, 9
LEA DX, P17
INT 21H                                                  
MOV AH, 9
LEA DX, P18
INT 21H                                                  
MOV AH, 9
LEA DX, P19
INT 21H                                                  
MOV AH, 9
LEA DX, P20
INT 21H                                                  
MOV AH, 9
LEA DX, P21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, P26
INT 21H  
MOV AH, 9
LEA DX, P27
INT 21H                                         
MOV AH, 9
LEA DX, PB
INT 21H                                                  

CODE:

mov ah, 00h
int 16h
mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h    

CMP AL,31h
JE  PLAY
CMP AL,32h
JE  INSTRUCTIONS
CMP AL,33h
JE  CREDITS
CMP AL,34h
JE  NIGHT

JMP CODE

PLAY:

include pac.asm
RET



INSTRUCTIONS:
MOV AH, 9
LEA DX, IA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, I2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, I3
INT 21H                                                  
MOV AH, 9
LEA DX, I4
INT 21H                                                  
MOV AH, 9
LEA DX, I5
INT 21H                                                  
MOV AH, 9
LEA DX, I6
INT 21H                                                  
MOV AH, 9
LEA DX, I7
INT 21H                                                  
MOV AH, 9
LEA DX, I8
INT 21H                                                  
MOV AH, 9
LEA DX, I9
INT 21H                                                  
MOV AH, 9
LEA DX, I10
INT 21H                                                  
MOV AH, 9
LEA DX, I11
INT 21H                                                  
MOV AH, 9
LEA DX, I12
INT 21H                                                  
MOV AH, 9
LEA DX, I13
INT 21H                                                  
MOV AH, 9
LEA DX, I14
INT 21H                                                  
MOV AH, 9
LEA DX, I15
INT 21H                                                  
MOV AH, 9
LEA DX, I16
INT 21H                                                  
MOV AH, 9
LEA DX, I17
INT 21H                                                  
MOV AH, 9
LEA DX, I18
INT 21H                                                  
MOV AH, 9
LEA DX, I19
INT 21H                                                  
MOV AH, 9
LEA DX, I20
INT 21H                                                  
MOV AH, 9
LEA DX, I21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, I26
INT 21H  
MOV AH, 9
LEA DX, I27
INT 21H                                         
MOV AH, 9
LEA DX, IB
INT 21H                                                  
                                           
INS:
mov ah, 00h
int 16h
mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h 
   

CMP Al,'r'
JE MENU  
CMP Al,'R'
JE MENU
JNE INS


CREDITS: 

MOV AH, 9
LEA DX, CA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, C2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, C3
INT 21H                                                  
MOV AH, 9
LEA DX, C4
INT 21H                                                  
MOV AH, 9
LEA DX, C5
INT 21H                                                  
MOV AH, 9
LEA DX, C6
INT 21H                                                  
MOV AH, 9
LEA DX, C7
INT 21H                                                  
MOV AH, 9
LEA DX, C8
INT 21H                                                  
MOV AH, 9
LEA DX, C9
INT 21H                                                  
MOV AH, 9
LEA DX, C10
INT 21H                                                  
MOV AH, 9
LEA DX, C11
INT 21H                                                  
MOV AH, 9
LEA DX, C12
INT 21H                                                  
MOV AH, 9
LEA DX, C13
INT 21H                                                  
MOV AH, 9
LEA DX, C14
INT 21H                                                  
MOV AH, 9
LEA DX, C15
INT 21H                                                  
MOV AH, 9
LEA DX, C16
INT 21H                                                  
MOV AH, 9
LEA DX, C17
INT 21H                                                  
MOV AH, 9
LEA DX, C18
INT 21H                                                  
MOV AH, 9
LEA DX, C19
INT 21H                                                  
MOV AH, 9
LEA DX, C20
INT 21H                                                  
MOV AH, 9
LEA DX, C21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, C26
INT 21H  
MOV AH, 9
LEA DX, C27
INT 21H                                         
MOV AH, 9
LEA DX, CB
INT 21H                                                  
                                           
CRE:
;return
mov ah, 00h
int 16h
mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h 
   

CMP Al,'r'
JE MENU  
CMP Al,'R'
JE MENU
JNE CRE

NIGHT:
include nightmare.asm

RET

JMP MENU      
 ;CREDITOS
                                                
 CA DB 13,10, '===============================================','$'
 C2 DB 13,10, '|                                             |','$'
 C3 DB 13,10, '|                                             |','$'
 C4 DB 13,10, '| ===========================                 |','$'
 C5 DB 13,10, '|    .-.     .-.    .--.                      |','$'
 C6 DB 13,10, '|   | OO|   | OO|  . O                        |','$'
 C7 DB 13,10, '|   | ~~|   | ~~|  .  <  o                    |','$'
 C8 DB 13,10, '|   '^^^'   '^^^'   .__.                      |','$'
 C9 DB 13,10, '| ===========================                 |','$'
C10 DB 13,10, '|Trabalho realizado por Vasco Oliveira (65689)|','$'
C11 DB 13,10, '|na cadeira de Arquitetura de Computadores.   |','$'
C12 DB 13,10, '|                       _____________________ |','$'
C13 DB 13,10, '|2017             .-.  |                     ||','$'
C14 DB 13,10, '|ENGENHARIA      | ^^|<|Press R to return to ||','$'
C15 DB 13,10, '|INFORMATICA    \|  -|/|the main menu.       ||','$'
C16 DB 13,10, '|                '^^^' |_____________________||','$'
C17 DB 13,10, '| ______   ___   _____ ___  ___  ___   _   _  |','$'
C18 DB 13,10, '| | ___ \ / _ \ /  __ \|  \/  | / _ \ | \ | | |','$'
C19 DB 13,10, '| | |_/ // /_\ \| /  \/| .  . |/ /_\ \|  \| | |','$'
C20 DB 13,10, '| |  __/ |  _  || |    | |\/| ||  _  || .   | |','$'
C21 DB 13,10, '| | |    | | | || \__/\| |  | || | | || |\  | |','$'
C26 DB 13,10, '| \_|    \_| |_/ \____/\_|  |_/\_| |_/\_| \_/ |','$'
C27 DB 13,10, '|                                             |','$'
 CB DB 13,10, '===============================================','$'                                                                                                                                          
 
 
 ;MENU         
                                                
 PA DB 13,10, '===============================================','$'
 P2 DB 13,10, '|                                             |','$'
 P3 DB 13,10, '|                                             |','$'
 P4 DB 13,10, '| ===========================                 |','$'
 P5 DB 13,10, '|  .-.   .-.        .--.                      |','$'
 P6 DB 13,10, '| | OO| | OO|      . O                        |','$'
 P7 DB 13,10, '| | ~~| | ~~|      .  < o o o                 |','$'
 P8 DB 13,10, '| '^^^' '^^^'       .__.                      |','$'
 P9 DB 13,10, '| ===========================                 |','$'
P10 DB 13,10, '|                       Please press:         |','$'
P11 DB 13,10, '|                                             |','$'
P12 DB 13,10, '|                       1.PLAY                |','$'
P13 DB 13,10, '|                       2.Instructions        |','$'
P14 DB 13,10, '|                       3.Credits             |','$'
P15 DB 13,10, '|                       4.Nightmare Mode      |','$'
P16 DB 13,10, '|                                             |','$'
P17 DB 13,10, '| ______   ___   _____ ___  ___  ___   _   _  |','$'
P18 DB 13,10, '| | ___ \ / _ \ /  __ \|  \/  | / _ \ | \ | | |','$'
P19 DB 13,10, '| | |_/ // /_\ \| /  \/| .  . |/ /_\ \|  \| | |','$'
P20 DB 13,10, '| |  __/ |  _  || |    | |\/| ||  _  || .   | |','$'
P21 DB 13,10, '| | |    | | | || \__/\| |  | || | | || |\  | |','$'
P26 DB 13,10, '| \_|    \_| |_/ \____/\_|  |_/\_| |_/\_| \_/ |','$'
P27 DB 13,10, '|                                             |','$'
 PB DB 13,10, '===============================================','$'        
 
 IA DB 13,10, '===============================================','$'
 I2 DB 13,10, '|                                             |','$'
 I3 DB 13,10, '|                                             |','$'
 I4 DB 13,10, '| ===========================   O objetivo do |','$'
 I5 DB 13,10, '|    .-.     .-.    .--.       jogo e coletar |','$'
 I6 DB 13,10, '|   | OO|   | OO|  . O         10 das bolas(o)|','$'
 I7 DB 13,10, '|   | ~~|   | ~~|  .  <  o     espalhadas pelo|','$'
 I8 DB 13,10, '|   '^^^'   '^^^'   .__.      mapa e evitar os|','$'
 I9 DB 13,10, '| =========================== fantasmas.      |','$'
I10 DB 13,10, '|                                             |','$'
I11 DB 13,10, '|  Utilize w,a,s,d para se deslocar.          |','$'
I12 DB 13,10, '|                       _____________________ |','$'
I13 DB 13,10, '|                 .-.  |                     ||','$'
I14 DB 13,10, '|                | ^^|<|Press R to return to ||','$'
I15 DB 13,10, '|               \|  -|/|the main menu.       ||','$'
I16 DB 13,10, '|                '^^^' |_____________________||','$'
I17 DB 13,10, '| ______   ___   _____ ___  ___  ___   _   _  |','$'
I18 DB 13,10, '| | ___ \ / _ \ /  __ \|  \/  | / _ \ | \ | | |','$'
I19 DB 13,10, '| | |_/ // /_\ \| /  \/| .  . |/ /_\ \|  \| | |','$'
I20 DB 13,10, '| |  __/ |  _  || |    | |\/| ||  _  || .   | |','$'
I21 DB 13,10, '| | |    | | | || \__/\| |  | || | | || |\  | |','$'
I26 DB 13,10, '| \_|    \_| |_/ \____/\_|  |_/\_| |_/\_| \_/ |','$'
I27 DB 13,10, '|                                             |','$'
 IB DB 13,10, '===============================================','$'                                                                                                                                          
 
 