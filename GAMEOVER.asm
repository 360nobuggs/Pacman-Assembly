
MOV AH, 9
LEA DX, DA
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, D2
INT 21H                                                                                                                                                                                             
MOV AH, 9
LEA DX, D3
INT 21H                                                  
MOV AH, 9
LEA DX, D4
INT 21H                                                  
MOV AH, 9
LEA DX, D5
INT 21H                                                  
MOV AH, 9
LEA DX, D6
INT 21H                                                  
MOV AH, 9
LEA DX, D7
INT 21H                                                  
MOV AH, 9
LEA DX, D8
INT 21H                                                  
MOV AH, 9
LEA DX, D9
INT 21H                                                  
MOV AH, 9
LEA DX, D10
INT 21H                                                  
MOV AH, 9
LEA DX, D11
INT 21H                                                  
MOV AH, 9
LEA DX, D12
INT 21H                                                  
MOV AH, 9
LEA DX, D13
INT 21H                                                  
MOV AH, 9
LEA DX, D14
INT 21H                                                  
MOV AH, 9
LEA DX, D15
INT 21H                                                  
MOV AH, 9
LEA DX, D16
INT 21H                                                  
MOV AH, 9
LEA DX, D17
INT 21H                                                  
MOV AH, 9
LEA DX, D18
INT 21H                                                  
MOV AH, 9
LEA DX, D19
INT 21H                                                  
MOV AH, 9
LEA DX, D20
INT 21H                                                  
MOV AH, 9
LEA DX, D21
INT 21H                                                                                                                                         
MOV AH, 9
LEA DX, D26
INT 21H  
MOV AH, 9
LEA DX, D27
INT 21H                                         
MOV AH, 9
LEA DX, D111
INT 21H  

edn:
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
JNE edn
RET


 DA DB 13,10, '===============================================','$'
 D2 DB 13,10, '|                                             |','$'
 D3 DB 13,10, '|   ______  _____ ______  _____  ___  _____   |','$'
 D4 DB 13,10, '|   |  _  \|  ___||  ___||  ___|/ _ \|_   _|  |','$'
 D5 DB 13,10, '|   | | | || |__  | |_   | |__ / /_\ \ | |    |','$'
 D6 DB 13,10, '|   | | | ||  __| |  _|  |  __||  _  | | |    |','$'
 D7 DB 13,10, '|   | |/ / | |___ | |    | |___| | | | | |    |','$'
 D8 DB 13,10, '|   |___/  \____/ \_|    \____/\_| |_/ \_/    |','$'
 D9 DB 13,10, '|                                             |','$'
D10 DB 13,10, '|                                             |','$'
D11 DB 13,10, '|                                             |','$'
D12 DB 13,10, '|                     .-.                     |','$'
D13 DB 13,10, '|       .''.  .''.   | --|   .''.  .''.       |','$'
D14 DB 13,10, '|       '..'  '..'   | /\|   '..'  '..'       |','$'
D15 DB 13,10, '|                    '^^^'                    |','$'
D16 DB 13,10, '|                                             |','$'
D17 DB 13,10, '|                  GAME OVER                  |','$'
D18 DB 13,10, '|                                             |','$'
D19 DB 13,10, '|          ...PRESS K TO PLAY AGAIN...        |','$'
D20 DB 13,10, '|                  M to menu                  |','$'
D21 DB 13,10, '|                                             |','$'
D26 DB 13,10, '|                                             |','$'
D27 DB 13,10, '|                                             |','$'
D111 DB 13,10, '===============================================','$'   



