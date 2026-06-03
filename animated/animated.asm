.MODEL SMALL
.STACK 100h

.DATA
    COLOR DB 4          ; Start with Red

.CODE
START:
    MOV AX, 13h
    INT 10h
    
    ; Block position
    MOV CX, 100          ; X
    MOV DX, 50           ; Y
    
    ; Direction
    MOV BX, 2            ; X direction
    MOV BP, 2            ; Y direction

GAME_LOOP:
    ; Draw block
    MOV AL, [COLOR]
    CALL DRAW_BLOCK
    
    ; Delay
    MOV SI, 0
DELAY:
    INC SI
    CMP SI, 20000       ; Slow speed
    JL DELAY
    
    ; Erase block
    MOV AL, 0
    CALL DRAW_BLOCK
    
    ; Update position
    ADD CX, BX
    ADD DX, BP
    
    ; Check wall hits and change color
    MOV AL, 0            ; Flag for color change
    
    ; Left wall
    CMP CX, 5
    JG CHECK_RIGHT
    MOV BX, 2
    MOV AL, 1            ; Color change flag
    
CHECK_RIGHT:
    ; Right wall
    CMP CX, 306
    JL CHECK_TOP
    MOV BX, -2
    MOV AL, 1
    
CHECK_TOP:
    ; Top wall
    CMP DX, 5
    JG CHECK_BOTTOM
    MOV BP, 2
    MOV AL, 1
    
CHECK_BOTTOM:
    ; Bottom wall
    CMP DX, 186
    JL AFTER_BOUNCE
    MOV BP, -2
    MOV AL, 1

AFTER_BOUNCE:
    ; Change color if hit a wall
    CMP AL, 1
    JNE NO_COLOR_CHANGE
    CALL CHANGE_COLOR

NO_COLOR_CHANGE:
    ; Check for key press to exit
    MOV AH, 1
    INT 16h
    JZ GAME_LOOP
    
    MOV AH, 0
    INT 16h
    
    ; Exit to text mode
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

; ===== CHANGE COLOR (ROYGBIV) =====
CHANGE_COLOR PROC
    MOV AL, [COLOR]
    
    ; Cycle through ROYGBIV
    CMP AL, 4            ; Red
    JE SET_ORANGE
    CMP AL, 6            ; Orange (brownish in 16-color palette)
    JE SET_YELLOW
    CMP AL, 14           ; Yellow
    JE SET_GREEN
    CMP AL, 2            ; Green
    JE SET_BLUE
    CMP AL, 1            ; Blue
    JE SET_INDIGO
    CMP AL, 9            ; Light Blue (closest to Indigo)
    JE SET_VIOLET
    JMP SET_RED         ; Violet -> back to Red

SET_ORANGE:
    MOV AL, 6            ; Brown/Orange
    JMP SAVE_COLOR
SET_YELLOW:
    MOV AL, 14           ; Yellow
    JMP SAVE_COLOR
SET_GREEN:
    MOV AL, 2            ; Green
    JMP SAVE_COLOR
SET_BLUE:
    MOV AL, 1            ; Blue
    JMP SAVE_COLOR
SET_INDIGO:
    MOV AL, 9            ; Light Blue (Indigo)
    JMP SAVE_COLOR
SET_VIOLET:
    MOV AL, 13           ; Light Magenta (Violet)
    JMP SAVE_COLOR
SET_RED:
    MOV AL, 4            ; Red

SAVE_COLOR:
    MOV [COLOR], AL
    RET
CHANGE_COLOR ENDP

; ===== DRAW 9x9 BLOCK =====
DRAW_BLOCK PROC
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
    
    MOV SI, 21            ; Height
ROW_LOOP:
    PUSH CX
    MOV DI, 21            ; Width
COL_LOOP:
    MOV AH, 0Ch
    INT 10h
    INC CX
    DEC DI
    JNZ COL_LOOP
    POP CX
    INC DX
    DEC SI
    JNZ ROW_LOOP
    
    POP DI
    POP SI
    POP DX
    POP CX
    RET
DRAW_BLOCK ENDP

END START