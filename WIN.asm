MOV AH, 9
LEA DX, WA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, W2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, W3
INT 21H                                                  
MOV AH, 9
LEA DX, W4
INT 21H                                                  
MOV AH, 9
LEA DX, W5
INT 21H                                                  
MOV AH, 9
LEA DX, W6
INT 21H                                                  
MOV AH, 9
LEA DX, W7
INT 21H                                                  
MOV AH, 9
LEA DX, W8
INT 21H                                                  
MOV AH, 9
LEA DX, W9
INT 21H                                                  
MOV AH, 9
LEA DX, W10
INT 21H                                                  
MOV AH, 9
LEA DX, W11
INT 21H                                                  
MOV AH, 9
LEA DX, W12
INT 21H                                                  
MOV AH, 9
LEA DX, W13
INT 21H                                                  
MOV AH, 9
LEA DX, W14
INT 21H                                                  
MOV AH, 9
LEA DX, W15
INT 21H                                                  
MOV AH, 9
LEA DX, W16
INT 21H                                                  
MOV AH, 9
LEA DX, W17
INT 21H                                                  
MOV AH, 9
LEA DX, W18
INT 21H                                                  
MOV AH, 9
LEA DX, W19
INT 21H                                                  
MOV AH, 9
LEA DX, W20
INT 21H                                                  
MOV AH, 9
LEA DX, W21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, W26
INT 21H  
MOV AH, 9
LEA DX, W27
INT 21H                                         
MOV AH, 9
LEA DX, WB
INT 21H        

edu:
mov ah, 00h
int 16h
mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h 
   
CMP AL,'K'
JE RESET
CMP AL,'M'
JE MENU  
JNE edu
RET
 
 
 WA DB 13,10, '===============================================','$'
 W2 DB 13,10, '|                                             |','$'
 W3 DB 13,10, '|                                             |','$'
 W4 DB 13,10, '|  _   _ _____ _____ _____ _____________   __ |','$'
 W5 DB 13,10, '| | | | |_   _/  __ |_   _|  _  | ___ \ \ / / |','$'
 W6 DB 13,10, '| | | | | | | | /  \/ | | | | | | |_/ /\ V /  |','$'
 W7 DB 13,10, '| | | | | | | | |     | | | | | |    /  \ /   |','$'
 W8 DB 13,10, '| \ \_/ /_| |_| \__/\ | | \ \_/ | |\ \  | |   |','$'
 W9 DB 13,10, '|  \___/ \___/ \____/ \_/  \___/\_| \_| \_/   |','$'
W10 DB 13,10, '|                                             |','$'
W11 DB 13,10, '|                                             |','$'
W12 DB 13,10, '|                     .-.                     |','$'
W13 DB 13,10, '|       .''.  .''.   | OO|   .''.  .''.       |','$'
W14 DB 13,10, '|       '..'  '..'   | ~~|   '..'  '..'       |','$'
W15 DB 13,10, '|                    '^^^'                    |','$'
W16 DB 13,10, '|                                             |','$'
W17 DB 13,10, '|                  YOU WON !!!                |','$'
W18 DB 13,10, '|                                             |','$'
W19 DB 13,10, '|      DARE TO TRY NIGHTMARE MODE NEXT!!      |','$'
W20 DB 13,10, '|                                             |','$'
W21 DB 13,10, '|                  M to menu                  |','$'
W26 DB 13,10, '|               K to play again               |','$'
W27 DB 13,10, '|                                             |','$'
 WB DB 13,10, '===============================================','$'        
 
