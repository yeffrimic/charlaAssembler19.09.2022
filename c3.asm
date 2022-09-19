;yeffrimic, xibalba hackerspace 2022

.model small
.stack
.data
cad db 'Hola Mundo',10,13,'$'
long dw 40
cordx dw 0
cordy dw 0
cordx1 dw 0
cordy1 dw 0
color dw 10

.code

pixel proc
push ax
push bx
push cx
push dx
push bp
mov ah,0ch
mov bh,00
mov bp,sp
mov cx,[bp+16]	;horizontal
mov dx,[bp+14]	;vertical
mov al,[bp+12]	;color
int 10h
pop bp
pop dx
pop cx
pop bx
pop ax
ret
pixel endp


horizontal proc
push ax
push cx
mov cx,long
l_derecha_c1:
mov ax,cx	;horizontal
add ax,cordx	;640 a 320
push ax
mov ax,cordy
push ax		;vertical
mov ax,color			;color azul
push ax
call pixel
pop ax
pop ax
pop ax
loop l_derecha_c1
pop cx
pop ax
ret
horizontal endp

vertical proc
mov cx,long
lin_ab_ciclo:
mov ax,cordx1
push ax
mov ax, cordy1
mov cordy,cx
add cordy,ax
mov ax,cordy
push ax
mov al,12
push ax
call pixel
pop ax
pop ax
pop ax 
loop lin_ab_ciclo
ret
vertical endp

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

mov cx,long ; longitud e inicio del loop
mov cordy,200 ; coordenda y
mov cordx,400; coordenda x
mov long,100
call horizontal

mov cordy1,200 ; coordenda y
mov cordx1,100; coordenda x
mov long,100
call vertical



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
