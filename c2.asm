;Yeffrimic, Xibalba Hackerspace 2022



.model small
.stack
.data
cad db 'Hola Mundo',10,13,'$'
.code
start:
;inicio del programa
mov dx,@data
mov ds,dx
;nuestro progama

mov ah,01; esperar tecla
int 21h; ejecutar int

mov ah,00
mov al, 12h; modo grafico 640x480 16 color graphics (VGA) 
int 10h
mov ah,0ch ; Write Graphics Pixel at Coordinate
mov al,10 ; color
mov cx, 320;coordenada y
mov dx, 240; coordenada x
int 10h


mov ah,01; esperar tecla
int 21h; ejecutar int

; modo texto
mov ah,00
mov al,03h
int 10h

;fin de programa
mov ax,4c00h; le dice al programa que termina y devuelve el control al SO
int 21h
end start
