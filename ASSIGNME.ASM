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
    dec si          ; Move to the next position in the array
    test ax, ax     ; Check if AX is zero (all digits extracted)
    jnz extract_digits ; If not zero, continue extracting digits

; Display the digits
mov ah, 09h           ; AH=09h for displaying a string
mov dx, offset message
int 21h

mov si, 0            ; Reset the index to the beginning of the array

print_digits:
    mov dl, [array + si]  ; Load the ASCII digit from the array
    mov ah, 02h           ; AH=02h for printing a character
    int 21h               ; DOS interrupt to print the character
    inc si                ; Move to the next digit
    cmp si, 4             ; Check if all digits have been printed
    jnz print_digits      ; If not, continue printing

mov ah, 4ch
int 21h


end
