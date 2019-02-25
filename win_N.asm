MOV AH, 9
LEA DX, NWA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, NW2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, NW3
INT 21H                                                  
MOV AH, 9
LEA DX, NW4
INT 21H                                                  
MOV AH, 9
LEA DX, NW5
INT 21H                                                  
MOV AH, 9
LEA DX, NW6
INT 21H                                                  
MOV AH, 9
LEA DX, NW7
INT 21H                                                  
MOV AH, 9
LEA DX, NW8
INT 21H                                                  
MOV AH, 9
LEA DX, NW9
INT 21H                                                  
MOV AH, 9
LEA DX, NW10
INT 21H                                                  
MOV AH, 9
LEA DX, NW11
INT 21H                                                  
MOV AH, 9
LEA DX, NW12
INT 21H                                                  
MOV AH, 9
LEA DX, NW13
INT 21H                                                  
MOV AH, 9
LEA DX, NW14
INT 21H                                                  
MOV AH, 9
LEA DX, NW15
INT 21H                                                  
MOV AH, 9
LEA DX, NW16
INT 21H                                                  
MOV AH, 9
LEA DX, NW17
INT 21H                                                  
MOV AH, 9
LEA DX, NW18
INT 21H                                                  
MOV AH, 9
LEA DX, NW19
INT 21H                                                  
MOV AH, 9
LEA DX, NW20
INT 21H                                                  
MOV AH, 9
LEA DX, NW21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, NW26
INT 21H  
MOV AH, 9
LEA DX, NW27
INT 21H                                         
MOV AH, 9
LEA DX, NWB
INT 21H        

def2:
mov ah, 00h
int 16h
mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h 
   
CMP AL,'K'
JE RESET2
CMP AL,'M'
JE MENU  
JNE def2
RET
 
 
 NWA DB 13,10, '===============================================','$'
 NW2 DB 13,10, '|                                             |','$'
 NW3 DB 13,10, '|                                             |','$'
 NW4 DB 13,10, '|  _   _ _____ _____ _____ _____________   __ |','$'
 NW5 DB 13,10, '| | | | |_   _/  __ |_   _|  _  | ___ \ \ / / |','$'
 NW6 DB 13,10, '| | | | | | | | /  \/ | | | | | | |_/ /\ V /  |','$'
 NW7 DB 13,10, '| | | | | | | | |     | | | | | |    /  \ /   |','$'
 NW8 DB 13,10, '| \ \_/ /_| |_| \__/\ | | \ \_/ | |\ \  | |   |','$'
 NW9 DB 13,10, '|  \___/ \___/ \____/ \_/  \___/\_| \_| \_/   |','$'
NW10 DB 13,10, '|                                             |','$'
NW11 DB 13,10, '|                                             |','$'
NW12 DB 13,10, '|                     .-.                     |','$'
NW13 DB 13,10, '|       .''.  .''.   | OO|   .''.  .''.       |','$'
NW14 DB 13,10, '|       '..'  '..'   | ~~|   '..'  '..'       |','$'
NW15 DB 13,10, '|                    '^^^'                    |','$'
NW16 DB 13,10, '|                                             |','$'
NW17 DB 13,10, '|                  YOU WON !!!                |','$'
NW18 DB 13,10, '|                                             |','$'
NW19 DB 13,10, '|              YOU ARE THE BEST!!!            |','$'
NW20 DB 13,10, '|                                             |','$'
NW21 DB 13,10, '|                  M to menu                  |','$'
NW26 DB 13,10, '|               K to play again               |','$'
NW27 DB 13,10, '|                                             |','$'
NWB DB 13,10, '===============================================','$'        
 
