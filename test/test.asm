.MODEL SMALL
.STACK 100h

.CODE
START:
    MOV AX, 13h
    INT 10h
    
    ; ===== SQUARE 1 (TOP LEFT BODY) =====
    MOV CX, 70
    MOV DX, 30
    MOV AL, 7
    MOV SI, 45
    
ROW_LOOP1:
    PUSH CX
    MOV DI, 45
COL_LOOP1:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ COL_LOOP1
    POP CX
    INC DX
    DEC SI
    JNZ ROW_LOOP1
    
    ; ===== SQUARE 2 (BOTTOM LEFT BODY) =====
    MOV CX, 70
    MOV DX, 105
    MOV AL, 7
    MOV SI, 45
    
ROW_LOOP2:
    PUSH CX
    MOV DI, 45
COL_LOOP2:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ COL_LOOP2
    POP CX
    INC DX
    DEC SI
    JNZ ROW_LOOP2
    
    ; ===== RECTANGLE 1 =====
    MOV CX, 115
    MOV DX, 70
    MOV AL, 2
    MOV SI, 40
    
ROW_LOOP3:
    PUSH CX
    MOV DI, 100
COL_LOOP3:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ COL_LOOP3
    POP CX
    INC DX
    DEC SI
    JNZ ROW_LOOP3
    
    ; ===== TIP 1 (TOP RIGHT - SMALL) =====
    MOV CX, 215
    MOV DX, 70
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP1:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP1:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP1
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP1
    
    ; ===== TIP 2 (TOP RIGHT - MEDIUM) =====
    MOV CX, 225
    MOV DX, 75
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP2:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP2:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP2
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP2
    
    ; ===== TIP 3 (TOP RIGHT - LARGEST) =====
    MOV CX, 235
    MOV DX, 80
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP3:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP3:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP3
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP3
    
    ; ===== TIP 4 (CENTER TIP) =====
    MOV CX, 245
    MOV DX, 85
    MOV AL, 1
    MOV SI, 10
TIP_ROW_LOOP4:
    PUSH CX
    MOV DI, 5
TIP_COL_LOOP4:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP4
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP4
    
    ; ===== TIP 5 (MIRROR OF TIP 3 - BOTTOM) =====
    MOV CX, 235         ; Same X as Tip 3
    MOV DX, 95         ; Y = 80 + 20 (mirror below)
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP5:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP5:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP5
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP5
    
    ; ===== TIP 6 (MIRROR OF TIP 2 - BOTTOM) =====
    MOV CX, 225         ; Same X as Tip 2
    MOV DX, 100         ; Y mirror
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP6:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP6:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP6
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP6
    
    ; ===== TIP 7 (MIRROR OF TIP 1 - BOTTOM) =====
    MOV CX, 215         ; Same X as Tip 1
    MOV DX, 105         ; Y mirror
    MOV AL, 1
    MOV SI, 5
TIP_ROW_LOOP7:
    PUSH CX
    MOV DI, 15
TIP_COL_LOOP7:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ TIP_COL_LOOP7
    POP CX
    INC DX
    DEC SI
    JNZ TIP_ROW_LOOP7
    
    ; Wait for key
    XOR AH, AH
    INT 16h
    
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START