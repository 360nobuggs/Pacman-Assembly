
MOV AH, 9
LEA DX, FA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, F2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, F3
INT 21H                                                  
MOV AH, 9
LEA DX, F4
INT 21H                                                  
MOV AH, 9
LEA DX, F5
INT 21H                                                  
MOV AH, 9
LEA DX, F6
INT 21H                                                  
MOV AH, 9
LEA DX, F7
INT 21H                                                  
MOV AH, 9
LEA DX, F8
INT 21H                                                  
MOV AH, 9
LEA DX, F9
INT 21H                                                  
MOV AH, 9
LEA DX, F10
INT 21H                                                  
MOV AH, 9
LEA DX, F11
INT 21H                                                  
MOV AH, 9
LEA DX, F12
INT 21H                                                  
MOV AH, 9
LEA DX, F13
INT 21H                                                  
MOV AH, 9
LEA DX, F14
INT 21H                                                  
MOV AH, 9
LEA DX, F15
INT 21H                                                  
MOV AH, 9
LEA DX, F16
INT 21H                                                  
MOV AH, 9
LEA DX, F17
INT 21H                                                  
MOV AH, 9
LEA DX, F18
INT 21H                                                  
MOV AH, 9
LEA DX, F19
INT 21H                                                  
MOV AH, 9
LEA DX, F20
INT 21H                                                  
MOV AH, 9
LEA DX, F21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, F26
INT 21H  
MOV AH, 9
LEA DX, F27
INT 21H                                         
MOV AH, 9
LEA DX, F111
INT 21H  

def:
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
JNE def
RET


 FA DB 13,10, '===============================================','$'
 F2 DB 13,10, '|                                             |','$'
 F3 DB 13,10, '|   ______  _____ ______  _____  ___  _____   |','$'
 F4 DB 13,10, '|   |  _  \|  ___||  ___||  ___|/ _ \|_   _|  |','$'
 F5 DB 13,10, '|   | | | || |__  | |_   | |__ / /_\ \ | |    |','$'
 F6 DB 13,10, '|   | | | ||  __| |  _|  |  __||  _  | | |    |','$'
 F7 DB 13,10, '|   | |/ / | |___ | |    | |___| | | | | |    |','$'
 F8 DB 13,10, '|   |___/  \____/ \_|    \____/\_| |_/ \_/    |','$'
 F9 DB 13,10, '|                                             |','$'
F10 DB 13,10, '|                                             |','$'
F11 DB 13,10, '|                                             |','$'
F12 DB 13,10, '|                     .-.                     |','$'
F13 DB 13,10, '|       .''.  .''.   | --|   .''.  .''.       |','$'
F14 DB 13,10, '|       '..'  '..'   | /\|   '..'  '..'       |','$'
F15 DB 13,10, '|                    '^^^'                    |','$'
F16 DB 13,10, '|                                             |','$'
F17 DB 13,10, '|                  GAME OVER                  |','$'
F18 DB 13,10, '|                                             |','$'
F19 DB 13,10, '|          ...PRESS K TO PLAY AGAIN...        |','$'
F20 DB 13,10, '|                  M to menu                  |','$'
F21 DB 13,10, '|                                             |','$'
F26 DB 13,10, '|                                             |','$'
F27 DB 13,10, '|                                             |','$'
F111 DB 13,10, '===============================================','$'   



