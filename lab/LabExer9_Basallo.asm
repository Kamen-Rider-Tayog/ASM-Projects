.model small
.stack 100h

.data
    char1 db '?$'
    char2 db '!$'
    char3 db '?$'
    char4 db '<$'
    char5 db '>$'
    char6 db '@$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ;Display ?-tayog
    mov dx, offset char1
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display !
    mov dx, offset char2
    mov ah, 9
    int 21h

    ;New line-tayog
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display ?
    mov dx, offset char3
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display <-tayog
    mov dx, offset char4
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display >-tayog
    mov dx, offset char5
    mov ah, 9
    int 21h

    ;New line
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ;Display @
    mov dx, offset char6
    mov ah, 9
    int 21h

    ;-tayog
    mov ah, 4ch
    int 21h
main endp
end main