; This code was developed to help out in simple operation such as addition, subtraction, multiplication, and devision.
.model small
.data
; Specify the required variables
msg db "Specify an operation $"
msg1 db "Enter a number $"
.code
;Load your data segment
mov ax, @data
mov ds, ax

; Tell the user to select an operation
Mov dx, offset msg
mov ah, 09h
int 21h

;Get an operation from the user
Mov ah, 01h
int 21h

;Check which operation the user has selected
cmp al, '+'
call TLine
; Jump to the edition segment if user pressed +
je addtion


; Segment that contains the addition logic
Addtion:
; Tell the user to give us the first number
Mov dx, offset msg1
mov ah, 09h
int 21h

; Take first number
mov ah, 01h
int 21h

;Subtract ascii and save the given number in bl
mov bl, al
sub bl, 30h
call TLine

; Tell the user to give us the second number.
Mov dx, offset msg1
mov ah, 09h
int 21h

; Get the second number
mov ah, 01h
int 21h

;Subtract asciii
sub al, 30h

;Add the numbers
add al, bl

;Move the number to dl to print it out.
mov cl, al
call TLine
mov dl, cl
;Add ascii to the number.
add dl, 30h

; Let us print.
mov ah, 02h
int 21h

; Terminate the program
mov ah, 4ch
int 21h

Tline proc
Mov dl, 0ah
mov ah, 02h
int 21h
ret
Tline endp




end
