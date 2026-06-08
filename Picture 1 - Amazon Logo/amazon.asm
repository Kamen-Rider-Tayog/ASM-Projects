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
    draw_rectangle 0, 0, 15, 200, 320

    ; LETTER 'a' BASE
    draw_rectangle 40, 70, 0, 45, 35
    
    ; CARVE CENTER HOLE 
    draw_rectangle 50, 95, 15, 10, 10

    ; left detail
    draw_rectangle 40, 85, 15, 5, 10
    draw_rectangle 40, 90, 15, 5, 5
    draw_rectangle 40, 110, 15, 5, 5

    ;bottom and right detail
    draw_rectangle 60, 110, 15, 5, 5
    draw_rectangle 70, 110, 15, 5, 5
    draw_rectangle 70, 70, 15, 35, 5
    draw_rectangle 65, 70, 15, 5, 5

    ; TOP OPENING 
    draw_rectangle 50, 80, 15, 10, 10
    
    ;CARVE TOP CURVE
    draw_rectangle 40, 70, 15, 5, 10
    draw_rectangle 40, 75, 15, 5, 5

    ; LETTER 'm' BASE
    draw_rectangle 80, 70, 0, 45, 55

    ;top detail
    draw_rectangle 80, 70, 15, 5, 10
    draw_rectangle 100, 70, 15, 5, 15
    draw_rectangle 125, 70, 15, 5, 10

    ;bottom detail
    draw_rectangle 90, 85, 15, 30, 10
    draw_rectangle 90, 85, 0, 5, 5
    draw_rectangle 115, 85, 15, 30, 10
    draw_rectangle 115, 85, 0, 5, 5
    
    ;corner detail
    draw_rectangle 80, 75, 15, 5, 5
    draw_rectangle 130, 75, 15, 5, 5

    ; LETTER 'a' BASE 2nd
    draw_rectangle 140, 70, 0, 45, 35
    
    ; CARVE CENTER HOLE 
    draw_rectangle 150, 95, 15, 10, 10

    ; left detail
    draw_rectangle 140, 85, 15, 5, 10
    draw_rectangle 140, 90, 15, 5, 5
    draw_rectangle 140, 110, 15, 5, 5

    ; bottom and right detail
    draw_rectangle 160, 110, 15, 5, 5
    draw_rectangle 170, 110, 15, 5, 5
    draw_rectangle 170, 70, 15, 35, 5
    draw_rectangle 165, 70, 15, 5, 5

    ; TOP OPENING 
    draw_rectangle 150, 80, 15, 10, 10
    
    ; CARVE TOP CURVE 
    draw_rectangle 140, 70, 15, 5, 10
    draw_rectangle 140, 75, 15, 5, 5

    ; LETTER 'z' BASE 
    draw_rectangle 180, 70, 0, 45, 30

    ; left details
    draw_rectangle 180, 80, 15, 20, 5
    draw_rectangle 185, 80, 15, 5, 10
    draw_rectangle 185, 85, 15, 5, 5

    ; right details
    draw_rectangle 205, 80, 15, 20, 5
    draw_rectangle 195, 95, 15, 5, 10
    draw_rectangle 200, 90, 15, 5, 5

    ; bottom detail
    draw_rectangle 185, 110, 15, 5, 20

    ; LETTER 'o' BASE
    draw_rectangle 215, 70, 0, 45, 35
    
    ; carve center hole for 'o'
    draw_rectangle 225, 80, 15, 25, 15

    ; inner hole corner
    draw_rectangle 225, 80, 0, 5, 5
    draw_rectangle 235, 80, 0, 5, 5
    draw_rectangle 225, 100, 0, 5, 5
    draw_rectangle 235, 100, 0, 5, 5
    
    ; top left detail
    draw_rectangle 215, 70, 15, 5, 10
    draw_rectangle 215, 75, 15, 5, 5

    ; top right detail
    draw_rectangle 240, 70, 15, 5, 10
    draw_rectangle 245, 75, 15, 5, 5

    ; bottom left detail
    draw_rectangle 215, 110, 15, 5, 10
    draw_rectangle 215, 105, 15, 5, 5

    ; bottom right detail
    draw_rectangle 240, 110, 15, 5, 10
    draw_rectangle 245, 105, 15, 5, 5
    
    ; LETTER 'n' BASE 
    draw_rectangle 255, 70, 0, 45, 30

    ; top details
    draw_rectangle 265, 70, 15, 5, 5
    draw_rectangle 280, 70, 15, 5, 5

    ; middle details
    draw_rectangle 265, 80, 15, 35, 10
    draw_rectangle 265, 80, 0, 5, 5


    ;smile check
    draw_rectangle 75, 120, 42, 5, 5
    draw_rectangle 80, 125, 42, 5, 10
    draw_rectangle 90, 130, 42, 5, 15
    draw_rectangle 100, 135, 42, 5, 30
    draw_rectangle 110, 140, 42, 5, 50
    draw_rectangle 145, 135, 42, 5, 35
    draw_rectangle 175, 130, 42, 5, 15
    draw_rectangle 190, 125, 42, 5, 5
    draw_rectangle 195, 120, 42, 5, 5
    draw_rectangle 185, 115, 42, 5, 15
    draw_rectangle 200, 115, 42, 20, 5


    ; Wait for key press
    XOR AH, AH
    INT 16h
    
    ; Return to text mode and exit
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START