.model small
.stack 100
.data
    msj1 db 'La conjetura Collats: ','$'
    msj6 db ' ','$'
    linea db 13,10,'$'
    var1 db 0
    var2 db 0
    var3 db 0
    
.code
.startup

call limpia
    mov var2,2
     mov var1,9 
    mov ah,09h
    lea dx, msj1 ;desplegar numero 1:
    int 21h

    
    ;----------------------------------------------
    xor ax,ax ;limpiamos el registro ax. 
mov al,var2; al=var2
mov bl,al; bl=al
mov al,var1; al=var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX -->dx=al/bl
 cmp ah,1
 je impar
 
  par:        
xor ax,ax ;limpiamos el registro ax. 
mov al,var2; al=var2
mov bl,al; bl=al
mov al,var1; al=var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX -->dx=al/bl
mov bl,al
mov dl,bl
add dl,30h;suma 48
mov var1,dl
mov ah,02h;imprime valor
int 21h
mov ah,09h
lea dx,msj6 ;desplegar div
int 21h

sub var1,30h
comp:
xor ax,ax ;limpiamos el registro ax. 
mov al,var2; al=var2
mov bl,al; bl=al
mov al,var1; al=var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX -->dx=al/bl

 cmp ah,0
 je par
 ;----------------------------------------------------------------------------------------------------------------------
 ;                                              impar
 impar:
       ;
       
       cmp  var1,1
       je nuevo
mov al,var1
mov bl,3
mul bl ;mult al=al*bl
mov dl,al ;mover al a dl para imprimir
add dl,1
add dl,30h ;sumar 30 para obtener caracter
mov var1,dl
mov ah,02h ;imprimir caracter
int 21h
mov ah,09h
lea dx,msj6 ;desplegar div
int 21h
;
sub var1,30h

;
xor ax,ax ;limpiamos el registro ax. 
mov al,var2; al=var2
mov bl,al; bl=al
mov al,var1; al=var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX -->dx=al/bl
mov bl,al
mov dl,bl
add dl,30h;suma 48
mov var1,dl
mov ah,02h;imprime valor
int 21h
mov ah,09h
lea dx,msj6 ;desplegar div
int 21h

sub var1,30h

xor ax,ax ;limpiamos el registro ax. 
mov al,var2; al=var2
mov bl,al; bl=al
mov al,var1; al=var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX -->dx=al/bl

jmp comp

    nuevo:
    mov ah,09h
    lea dx,msj6 ;desplegar div
    int 21h
.exit

;------

; ****************PROCEDIMIENTOS
salto proc near
mov ah,09h
lea dx,linea
int 21h
mov dl,00h
ret
salto endp

leer proc near
mov ah,01h;leer caracter desde el teclado
int 21h;lee primer caracter
ret
leer endp

limpia proc near
mov ah,00h
mov al,03h
int 10h
ret
limpia endp
end
