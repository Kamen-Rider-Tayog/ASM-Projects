.MODEL SMALL
.STACK 100h

; ============================================================
; REUSABLE MACRO: draw_rectangle
; ============================================================
; Usage: draw_rectangle x_start, y_start, color, height, width
; ============================================================
draw_rectangle MACRO x, y, color, height, width
    LOCAL row_loop, col_loop
    MOV CX, x
    MOV DX, y
    MOV AL, color
    MOV SI, height
row_loop:
    PUSH CX
    MOV DI, width
col_loop:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ col_loop
    POP CX
    INC DX
    DEC SI
    JNZ row_loop
ENDM

.CODE
START:
    MOV AX, 13h
    INT 10h
    
    ; ===== WHITE BACKGROUND =====
    draw_rectangle 0, 0, 0, 200, 320
    


    ;PACMAN BASE
    draw_rectangle 20, 20, 44, 65, 65

    ;top left
    draw_rectangle 20, 20, 0, 20, 5
    draw_rectangle 25, 20, 0, 10, 5
    draw_rectangle 30, 20, 0, 5, 10

    ;bottom left
    draw_rectangle 20, 65, 0, 20, 5
    draw_rectangle 25, 75, 0, 10, 5
    draw_rectangle 30, 80, 0, 5, 10

    ;top right
    draw_rectangle 65, 20, 0, 5, 20
    draw_rectangle 75, 25, 0, 5, 10
    draw_rectangle 80, 30, 0, 10, 5

    ;bottom right
    draw_rectangle 65, 80, 0, 5, 20
    draw_rectangle 75, 75, 0, 5, 10
    draw_rectangle 80, 65, 0, 10, 5

    ;mouth
    draw_rectangle 40, 50, 0, 5, 15
    draw_rectangle 55, 45, 0, 15, 15
    draw_rectangle 70, 40, 0, 25, 15



    ;BLINKY BASE
    draw_rectangle 105, 20, 40, 70, 70

    ;top left
    draw_rectangle 105, 20, 0, 30, 5
    draw_rectangle 110, 20, 0, 15, 5
    draw_rectangle 115, 20, 0, 10, 5
    draw_rectangle 120, 20, 0, 5, 10

    ;top right
    draw_rectangle 170, 20, 0, 30, 5
    draw_rectangle 165, 20, 0, 15, 5
    draw_rectangle 160, 20, 0, 10, 5
    draw_rectangle 150, 20, 0, 5, 10

    ;bottom left
    draw_rectangle 110, 85, 0, 5, 15
    draw_rectangle 115, 80, 0, 5, 5

    ;bottom middle
    draw_rectangle 135, 80, 0, 10, 10

    ;bottom right
    draw_rectangle 155, 85, 0, 5, 15
    draw_rectangle 160, 80, 0, 5, 5

    ;left eye
    draw_rectangle 110, 40, 15, 15, 20
    draw_rectangle 115, 35, 15, 25, 10

    ;right eye
    draw_rectangle 140, 40, 15, 15, 20
    draw_rectangle 145, 35, 15, 25, 10

    ;pupils
    draw_rectangle 110, 45, 32, 10, 10
    draw_rectangle 140, 45, 32, 10, 10



    ;INKY BASE
    draw_rectangle 195, 20, 54, 70, 70

    ;top left
    draw_rectangle 195, 20, 0, 30, 5
    draw_rectangle 200, 20, 0, 15, 5
    draw_rectangle 205, 20, 0, 10, 5
    draw_rectangle 210, 20, 0, 5, 10

    ;top right
    draw_rectangle 260, 20, 0, 30, 5
    draw_rectangle 255, 20, 0, 15, 5
    draw_rectangle 250, 20, 0, 10, 5
    draw_rectangle 240, 20, 0, 5, 10

    ;bottom left
    draw_rectangle 200, 85, 0, 5, 15
    draw_rectangle 205, 80, 0, 5, 5

    ;bottom middle
    draw_rectangle 225, 80, 0, 10, 10

    ;bottom right
    draw_rectangle 245, 85, 0, 5, 15
    draw_rectangle 250, 80, 0, 5, 5

    ;left eye
    draw_rectangle 200, 40, 15, 15, 20
    draw_rectangle 205, 35, 15, 25, 10

    ;right eye
    draw_rectangle 230, 40, 15, 15, 20
    draw_rectangle 235, 35, 15, 25, 10

    ;pupils
    draw_rectangle 200, 45, 32, 10, 10
    draw_rectangle 230, 45, 32, 10, 10



        ;CLYDE BASE
    draw_rectangle 65, 110, 42, 70, 70

    ;top left
    draw_rectangle 65, 110, 0, 30, 5
    draw_rectangle 70, 110, 0, 15, 5
    draw_rectangle 75, 110, 0, 10, 5
    draw_rectangle 80, 110, 0, 5, 10

    ;top right
    draw_rectangle 130, 110, 0, 30, 5
    draw_rectangle 125, 110, 0, 15, 5
    draw_rectangle 120, 110, 0, 10, 5
    draw_rectangle 110, 110, 0, 5, 10

    ;bottom left
    draw_rectangle 70, 175, 0, 5, 15
    draw_rectangle 75, 170, 0, 5, 5

    ;bottom middle
    draw_rectangle 95, 170, 0, 10, 10

    ;bottom right
    draw_rectangle 115, 175, 0, 5, 15
    draw_rectangle 120, 170, 0, 5, 5

    ;left eye
    draw_rectangle 70, 130, 15, 15, 20
    draw_rectangle 75, 125, 15, 25, 10

    ;right eye
    draw_rectangle 100, 130, 15, 15, 20
    draw_rectangle 105, 125, 15, 25, 10

    ;pupils
    draw_rectangle 70, 135, 32, 10, 10
    draw_rectangle 100, 135, 32, 10, 10



    ;PINKY BASE
    draw_rectangle 155, 110, 13, 70, 70

    ;top left
    draw_rectangle 155, 110, 0, 30, 5
    draw_rectangle 160, 110, 0, 15, 5
    draw_rectangle 165, 110, 0, 10, 5
    draw_rectangle 170, 110, 0, 5, 10

    ;top right
    draw_rectangle 220, 110, 0, 30, 5
    draw_rectangle 215, 110, 0, 15, 5
    draw_rectangle 210, 110, 0, 10, 5
    draw_rectangle 200, 110, 0, 5, 10

    ;bottom left
    draw_rectangle 160, 175, 0, 5, 15
    draw_rectangle 165, 170, 0, 5, 5

    ;bottom middle
    draw_rectangle 185, 170, 0, 10, 10

    ;bottom right
    draw_rectangle 205, 175, 0, 5, 15
    draw_rectangle 210, 170, 0, 5, 5

    ;left eye
    draw_rectangle 160, 130, 15, 15, 20
    draw_rectangle 165, 125, 15, 25, 10

    ;right eye
    draw_rectangle 190, 130, 15, 15, 20
    draw_rectangle 195, 125, 15, 25, 10

    ;pupils
    draw_rectangle 160, 135, 32, 10, 10
    draw_rectangle 190, 135, 32, 10, 10

    ; Wait for key press
    XOR AH, AH
    INT 16h
    
    ; Return to text mode and exit
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START