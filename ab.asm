.model small
.data
    array db 4 dup(0)   ; Use db (byte) to store individual digits
    message db 10, 13, "Digits: $"

.code
org 100h ; 

mov ax, @data
mov ds, ax

mov si, 3 ; 
mov ax, 5678 ;
mov bx, 10

; Loop to extract digits and store them in the array
extract_digits:
    xor dx, dx      ; 
    div bx          ; 
    add dl, '0'     ; 
    mov [array + s
    dec si          ; 
    test ax, ax     ; 
    jnz extract_digits ; 

; Display the digits
mov ah, 09h           ; 
mov dx, offset message
int 21h

mov si, 0            ; 

print_digits:
    mov dl, [array + si]  ; 
    mov ah, 02h           ; 
    int 21h               ; 
    inc si                ; 
    cmp si, 4             ; 
    jnz print_digits      ; 

mov ah, 4ch
int 21h


end
