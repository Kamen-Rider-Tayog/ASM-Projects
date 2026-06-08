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
    draw_rectangle 45, 30, 0, 45, 35
    
    ; CARVE CENTER HOLE 
    draw_rectangle 55, 55, 15, 10, 10

    ; left detail
    draw_rectangle 45, 45, 15, 5, 10
    draw_rectangle 45, 50, 15, 5, 5
    draw_rectangle 45, 70, 15, 5, 5

    ;bottom and right detail
    draw_rectangle 65, 70, 15, 5, 5
    draw_rectangle 75, 70, 15, 5, 5
    draw_rectangle 75, 30, 15, 35, 5
    draw_rectangle 70, 30, 15, 5, 5

    ; TOP OPENING 
    draw_rectangle 55, 40, 15, 10, 10
    
    ;CARVE TOP CURVE
    draw_rectangle 45, 30, 15, 5, 10
    draw_rectangle 45, 35, 15, 5, 5



    ; LETTER 'm' BASE
    draw_rectangle 85, 30, 0, 45, 55

    ;top detail
    draw_rectangle 85, 30, 15, 5, 10
    draw_rectangle 105, 30, 15, 5, 15
    draw_rectangle 130, 30, 15, 5, 10

    ;bottom detail
    draw_rectangle 95, 45, 15, 30, 10
    draw_rectangle 95, 45, 0, 5, 5
    draw_rectangle 120, 45, 15, 30, 10
    draw_rectangle 120, 45, 0, 5, 5
    
    ;corner detail
    draw_rectangle 85, 35, 15, 5, 5
    draw_rectangle 135, 35, 15, 5, 5



    ; LETTER 'a' BASE 2nd
    draw_rectangle 145, 30, 0, 45, 35
    
    ; CARVE CENTER HOLE 
    draw_rectangle 155, 55, 15, 10, 10

    ; left detail
    draw_rectangle 145, 45, 15, 5, 10
    draw_rectangle 145, 50, 15, 5, 5
    draw_rectangle 145, 70, 15, 5, 5

    ; bottom and right detail
    draw_rectangle 165, 70, 15, 5, 5
    draw_rectangle 175, 70, 15, 5, 5
    draw_rectangle 175, 30, 15, 35, 5
    draw_rectangle 170, 30, 15, 5, 5

    ; TOP OPENING 
    draw_rectangle 155, 40, 15, 10, 10
    
    ; CARVE TOP CURVE 
    draw_rectangle 145, 30, 15, 5, 10
    draw_rectangle 145, 35, 15, 5, 5



    ; LETTER 'z' BASE 
    draw_rectangle 185, 30, 0, 45, 30

    ; left details
    draw_rectangle 185, 40, 15, 20, 5
    draw_rectangle 190, 40, 15, 5, 10
    draw_rectangle 190, 45, 15, 5, 5

    ; right details
    draw_rectangle 210, 40, 15, 20, 5
    draw_rectangle 200, 55, 15, 5, 10
    draw_rectangle 205, 50, 15, 5, 5

    ; bottom detail
    draw_rectangle 190, 70, 15, 5, 20



    ; LETTER 'o' BASE
    draw_rectangle 220, 30, 0, 45, 35
    
    ; carve center hole for 'o'
    draw_rectangle 230, 40, 15, 25, 15

    ; inner hole corner
    draw_rectangle 230, 40, 0, 5, 5
    draw_rectangle 240, 40, 0, 5, 5
    draw_rectangle 230, 60, 0, 5, 5
    draw_rectangle 240, 60, 0, 5, 5
    
    ; top left detail
    draw_rectangle 220, 30, 15, 5, 10
    draw_rectangle 220, 35, 15, 5, 5

    ; top right detail
    draw_rectangle 245, 30, 15, 5, 10
    draw_rectangle 250, 35, 15, 5, 5

    ; bottom left detail
    draw_rectangle 220, 70, 15, 5, 10
    draw_rectangle 220, 65, 15, 5, 5

    ; bottom right detail
    draw_rectangle 245, 70, 15, 5, 10
    draw_rectangle 250, 65, 15, 5, 5
    


    ; LETTER 'n' BASE 
    draw_rectangle 260, 30, 0, 45, 30

    ; top details
    draw_rectangle 270, 30, 15, 5, 5
    draw_rectangle 285, 30, 15, 5, 5

    ; middle details
    draw_rectangle 270, 40, 15, 35, 10
    draw_rectangle 270, 40, 0, 5, 5



    ; Wait for key press
    XOR AH, AH
    INT 16h
    
    ; Return to text mode and exit
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START