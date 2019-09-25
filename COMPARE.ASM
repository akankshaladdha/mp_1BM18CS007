.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
        msg1 db 0dh,0ah,"Enter string$"
        msg2 db 0dh,0ah,"Equal$"
        msg3 db 0dh,0ah,"Not equal$"
        str1 db 10h dup(0)
        str2 db 10h dup(0)
        len dw 0
        len1 dw 0
.code
        mov ax,@data
        mov ds,ax
        display msg1
        mov si,00h
        mov di,00h
back1 : mov ah,01h
        int 21h
        cmp al,0dh
        jz back2
        mov str1[si],al
        inc si
        inc len
        jmp back1
back2 : display msg1
next : mov ah,01h
        int 21h
        cmp al,0dh
        jz loop1
        mov str2[di],al
        inc di
        inc len1
        jmp next
loop1 :mov cx,len
        cmp len1,cx
        jnz result
        mov si,00h
        mov di,00h
        mov cx,len
compare : mov al,str1[si]
          cmp str2[di],al
          jnz result
          inc si
          inc di
          loop compare
          display msg2
          jmp last
result : display msg3
last : mov ah,4ch
        int 21h
        end
