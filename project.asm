main	segment
assume	cs:main,ds:main
 
mov	ax,cs
mov	ds,ax

mov	cx,11
 
dec	cx
 
outloop:
mov	si,OFFSET arr1
mov	dx,cx

inloop:
mov	BX,[si]
mov	AX,[si+2]
CMP	BX,AX
JC	carry

MOV	[SI],AX
mov	[SI+2],BX
carry:
ADD	si,2
DEC	dx
JNZ	inloop
LOOP	outloop
 
 
 
mov 	di,offset arr1
mov	ax,[di]
mov	smallest,ax
mov	ax,[di+20]
mov	largest,ax
 

 
mov	ax,largest
mov	bx,10
mov	cx,0
 
 
 
outpush:
mov	dx,0
DIV	bx

push	dx
inc	cx

cmp	ax,0
jne	outpush
 
 
 
outpop:
POP	ax
add	al,'0'
 
mov	dl,al
mov	ah,2
int	21h
 
loop	outpop
 
mov	dl,32
mov	ah,2
int	21h
 
 
 
mov	ax,smallest
mov	bx,10
mov	cx,0
outpush2:
mov	dx,0
DIV	bx

push	dx
inc	cx

cmp	ax,0
jne	outpush2
 
outpop2:
POP	ax
add	al,'0'
 
mov	dl,al
mov	ah,2
int	21h
 
loop	outpop2
mov	dl,32
mov	ah,2
int	21h
 
mov	si,OFFSET arr1
mov	ax,[si+10]
mov	bx,10
mov	cx,0
 
 
outpush3:
mov	dx,0
DIV	bx
push	dx
inc	cx

cmp	ax,0
jne	outpush3
 
outpop3:
POP	ax
add	al,'0'
 
mov	dl,al
mov	ah,2
int	21h
 
loop	outpop3
 
 
 
mov	ah,4ch
int	21h
 
arr1	dw	2698h,0a120h,9548h,1410h,1111h,2222h,3333h,4444h,5555h,6666h,7777h
smallest	dw	?
middle	dw	?
largest	dw	?
 
main	ends
end
