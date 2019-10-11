.model small
.data
        n dw 6
        r dw 3
        res dw ?
.code
       mov ax,@data
       mov ds,ax
       mov ax,n
       mov bx,r
       mov res,0000
       call function
       ;mov ax,res
       mov ah,4ch
       int 21h
       function proc near
       cmp ax,bx
       je res1
       cmp bx,0
       je res1
       cmp bx,1
       je resn
       dec ax
       cmp bx,ax
       je incr
       push ax
       push bx
       call function
       pop bx
       pop ax
       dec bx
       push ax
       push bx
       call function
       pop bx
       pop ax
       ret
  res1 : inc res
          ret
   incr :inc res
   resn : add res,ax
           ret
          function endp
           end
        
