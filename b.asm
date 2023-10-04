.model small
.stack 100h

.data
msg1 db "Enter a 4-digit number: $"
    msg2 db 10, 13, "Digits: $"
    digit db 4 dup('$')

.code
Declare variables
mov ax, 1234h ; Four-digit number
mov bx, 0 ; Digit counter
mov cx, 10 ; Division factor

; Loop to separate and print the digits
digit_loop:
    div cx ; Divide the number by 10
    mov [digits + bx], dl ; Store the remainder in the digits array
    inc bx ; Increment the digit counter
    cmp ax, 0 ; Check if the number is zero
    jne digit_loop ; If not, continue looping

; Print the digits in the digits array
print_digits:
    mov dl, [digits + bx - 1] ; Get the next digit from the digits array
    add dl, 30h ; Convert the digit to ASCII
    mov ah, 02h ; Print the digit
    int 21h
    dec bx ; Decrement the digit counter
    cmp bx, 0 ; Check if all digits have been printed
    jne print_digits ; If not, continue printing

; Exit the program
mov ah, 4ch
int 21h

; Digit array
digits db 4 dup(0)