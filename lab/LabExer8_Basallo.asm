.model small
.stack 100h

.data
    line1   db "==============================================$"
    hello   db "             HELLO!$"
    thisis  db "THIS              IS$"
    lab     db "                  LABORATORY 8$"
    line2   db "===============================================$"

.code
main proc
    mov ax, @data
    mov ds, ax

    ;Display top border
    mov dx, offset line1
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display HELLO!-tayog
    mov dx, offset hello
    mov ah, 9
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display THIS and IS-tayog
    mov dx, offset thisis
    mov ah, 9
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display LABORATORY 8
    mov dx, offset lab
    mov ah, 9
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display bottom border-tayog
    mov dx, offset line2
    mov ah, 9
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main