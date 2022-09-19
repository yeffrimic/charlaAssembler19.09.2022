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

mov ah,09;preparar para mostrar informacion
lea dx,cad ; mover con puntero a dx
int 21h; mostrar la info


mov ah,01; esperar tecla
int 21h; ejecutar int

;fin de programa
mov ax,4c00h; le dice al programa que termina y devuelve el control al SO
int 21h
end start
