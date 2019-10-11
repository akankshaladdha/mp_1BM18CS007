.model small
.code
mov ah,2ch
int 21h

mov al,ch
aam
mov bx,ax
call disp
mov dl,20h
mov ah,02h
int 21h

mov al,cl
aam
mov bx,ax
call disp

mov dl,20h
mov ah,02h
int 21h

mov al,dh
aam
mov bx,ax
call disp

mov ah,4ch
int 21h

disp proc near
mov dl,bh
add dl,30h
mov ah,02h
int 21h
mov dl,bl
add dl,30h
int 21h
ret
disp endp
end
