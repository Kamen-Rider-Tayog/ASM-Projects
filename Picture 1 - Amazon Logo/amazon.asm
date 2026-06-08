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
    draw_rectangle 20, 30, 0, 45, 35
    
    ; CARVE CENTER HOLE 
    draw_rectangle 30, 55, 15, 10, 10

    ; left detail
    draw_rectangle 20, 45, 15, 5, 10
    draw_rectangle 20, 50, 15, 5, 5
    draw_rectangle 20, 70, 15, 5, 5

    ;bottom and right detail
    draw_rectangle 40, 70, 15, 5, 5
    draw_rectangle 50, 70, 15, 5, 5
    draw_rectangle 50, 30, 15, 35, 5
    draw_rectangle 45, 30, 15, 5, 5

    ; TOP OPENING 
    draw_rectangle 30, 40, 15, 10, 10
    
    ;CARVE TOP CURVE
    draw_rectangle 20, 30, 15, 5, 10
    draw_rectangle 20, 35, 15, 5, 5
    


    ; LETTER 'm' BASE
    draw_rectangle 60, 30, 0, 45, 55

    ;top detail
    draw_rectangle 60, 30, 15, 5, 10
    draw_rectangle 80, 30, 15, 5, 15
    draw_rectangle 105, 30, 15, 5, 10

    ;bottom detail
    draw_rectangle 70, 45, 15, 30, 10
    draw_rectangle 70, 45, 0, 5, 5
    draw_rectangle 95, 45, 15, 30, 10
    draw_rectangle 95, 45, 0, 5, 5
    
    ;corner detail
    draw_rectangle 60, 35, 15, 5, 5
    draw_rectangle 110, 35, 15, 5, 5



    ;LETTER 'a' BASE 2nd
    draw_rectangle 120, 30, 0, 45, 35
    
    ;CARVE CENTER HOLE 
    draw_rectangle 130, 55, 15, 10, 10

    ;left detail
    draw_rectangle 120, 45, 15, 5, 10
    draw_rectangle 120, 50, 15, 5, 5
    draw_rectangle 120, 70, 15, 5, 5

    ;bottom and right detail
    draw_rectangle 140, 70, 15, 5, 5
    draw_rectangle 150, 70, 15, 5, 5
    draw_rectangle 150, 30, 15, 35, 5
    draw_rectangle 145, 30, 15, 5, 5

    ;TOP OPENING 
    draw_rectangle 130, 40, 15, 10, 10
    
    ;CARVE TOP CURVE 
    draw_rectangle 120, 30, 15, 5, 10
    draw_rectangle 120, 35, 15, 5, 5



    ;LETTER 'z' BASE 
    draw_rectangle 160, 30, 0, 45, 30

    ;left details
    draw_rectangle 160, 40, 15, 20, 5
    draw_rectangle 165, 40, 15, 5, 10
    draw_rectangle 165, 45, 15, 5, 5

    ;right details
    draw_rectangle 185, 40, 15, 20, 5
    draw_rectangle 175, 55, 15, 5, 10
    draw_rectangle 180, 50, 15, 5, 5

    ;bottom detail
    draw_rectangle 165, 70, 15, 5, 20



    ;LETTER 'o' BASE
    draw_rectangle 195, 30, 0, 45, 35
    
    ;carve center hole for 'o'
    draw_rectangle 205, 40, 15, 25, 15

    ;inner hole corner
    draw_rectangle 205, 40, 0, 5, 5
    draw_rectangle 215, 40, 0, 5, 5
    draw_rectangle 205, 60, 0, 5, 5
    draw_rectangle 215, 60, 0, 5, 5
    
    ;top left detail
    draw_rectangle 195, 30, 15, 5, 10
    draw_rectangle 195, 35, 15, 5, 5

    ;top right detail
    draw_rectangle 220, 30, 15, 5, 10
    draw_rectangle 225, 35, 15, 5, 5

    ;bottom left detail
    draw_rectangle 195, 70, 15, 5, 10
    draw_rectangle 195, 65, 15, 5, 5

    ;bottom right detail
    draw_rectangle 220, 70, 15, 5, 10
    draw_rectangle 225, 65, 15, 5, 5

    
    
    ;LETTER 'n' BASE 
    draw_rectangle 235, 30, 0, 45, 30

    ;top details
    draw_rectangle 245, 30, 15, 5, 5
    draw_rectangle 260, 30, 15, 5, 5

    ;middle details
    draw_rectangle 245, 40, 15, 35, 10
    draw_rectangle 245, 40, 0, 5, 5




    


    ; Wait for key press
    XOR AH, AH
    INT 16h
    
    ; Return to text mode and exit
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START