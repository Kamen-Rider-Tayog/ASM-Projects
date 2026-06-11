.model small
.stack 100h

.data
    letterA db 'A$'
    letterB db 'B$'
    letterC db 'C$'
    letterD db 'D$'
    letterE db 'E$'
    letterF db 'F$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ;Display A
    mov dx, offset letterA
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display B-tayog
    mov dx, offset letterB
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display C
    mov dx, offset letterC
    mov ah, 9
    int 21h

    ;New line-tayog
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display D
    mov dx, offset letterD
    mov ah, 9
    int 21h

    ;New line-tayog
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display E
    mov dx, offset letterE
    mov ah, 9
    int 21h

    ;New line-tayog
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display F
    mov dx, offset letterF
    mov ah, 9
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main