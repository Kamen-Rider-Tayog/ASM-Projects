# Assembly Graphics - In-Depth Documentation

## 1. Program Structure

Every assembly program has this exact structure:

.MODEL SMALL      - Tells assembler how much memory to use
.STACK 100h       - Reserves 256 bytes for stack (where PUSH/POP work)

.CODE             - Everything below is actual code
START:            - Label where program starts executing

    ; ===== YOUR CODE HERE =====

    MOV AX, 4C00h - Exit program (MUST HAVE!)
    INT 21h
END START         - Tells assembler where program ends

---

## 2. Registers Explained

Registers are like variables but limited. You only have a few:

16-bit Registers (hold 0-65535):

AX - Used for function numbers and math
  AH = high byte (8 bits)
  AL = low byte (8 bits)

CX - X coordinate (horizontal position 0-319)
  CH = high byte
  CL = low byte

DX - Y coordinate (vertical position 0-199)
  DH = high byte
  DL = low byte

SI - Row counter (how many rows to draw)

DI - Column counter (how many pixels per row)

8-bit Registers (hold 0-255):

AH - BIOS function selector (must be 0Ch for drawing)
AL - Color (0-255)
BH - Page number (always 0 for us)

RULE OF THUMB:
- CX = X position
- DX = Y position
- AL = Color
- SI = Height (rows)
- DI = Width (pixels per row)

---

## 3. Loop System Deep Dive

THE PROBLEM: CX is used for BOTH position AND counting.
When you loop, CX changes. But you need CX to remember the starting X!

THE SOLUTION: PUSH and POP

Example:

MOV CX, 100    ; Start X = 100
MOV SI, 10     ; Draw 10 rows

ROW_LOOP:
    PUSH CX    ; SAVE current X (100) onto stack
    
    MOV DI, 20 ; Draw 20 pixels in this row
    
    COL_LOOP:
        MOV AH, 0Ch
        INT 10h
        INC CX   ; CX changes! (101, 102, 103...)
        DEC DI
        JNZ COL_LOOP
    
    POP CX     ; RESTORE X back to 100
    INC DX     ; Move down one row
    DEC SI
    JNZ ROW_LOOP

WHAT HAPPENS IF YOU FORGET PUSH/POP:

WRONG - NO PUSH/POP:
ROW_LOOP:
    MOV DI, 20
    COL_LOOP:
        INC CX   ; CX goes 100,101,102...
        DEC DI
        JNZ COL_LOOP
    ; After COL_LOOP, CX = 120
    INC DX
    DEC SI
    JNZ ROW_LOOP
    ; Next row starts at CX=120 (should be 100)!

RESULT: Diagonal line instead of horizontal!

---

## 4. Drawing System

BIOS Interrupt 10h (Video Services):

MOV AH, 0Ch    ; Function 0Ch = "Write pixel"
MOV AL, 7      ; Color (7 = light gray)
MOV BH, 0      ; Page 0 (always)
MOV CX, 100    ; X coordinate
MOV DX, 50     ; Y coordinate
INT 10h        ; Call BIOS to draw the pixel

Function 0Ch Details:
- Does NOT move the cursor
- Does NOT check boundaries (can draw off-screen!)
- IS slow (BIOS call takes time)

---

## 5. Coordinate Math

Screen Layout: 320 pixels wide x 200 pixels tall

X=0 is LEFT edge
X=319 is RIGHT edge
Y=0 is TOP edge
Y=199 is BOTTOM edge

Your Current Coordinates:

Shape                X Start  Y Start  Width  Height
Square 1 (Top Left)   70       30       45     45
Square 2 (Bottom Left)70       105      45     45
Rectangle             115      70       100    40
Tip 1                 215      70       15     5
Tip 2                 225      75       15     5
Tip 3                 235      80       15     5
Tip 4 (Center)        245      85       5      10
Tip 5 (Mirror 3)      235      95       15     5
Tip 6 (Mirror 2)      225      100      15     5
Tip 7 (Mirror 1)      215      105      15     5

How Mirroring Works:
Tip 3 at Y=80, height=5 covers Y=80,81,82,83,84
Mirror at Y=95 covers Y=95,96,97,98,99
The gap is 85-94 (10 pixels of empty space)

---

## 6. How Each Shape Works (Square 1 Example)

MOV CX, 70     ; Start X = 70 (left edge)
MOV DX, 30     ; Start Y = 30 (top edge)
MOV AL, 7      ; Color = light gray
MOV SI, 45     ; Draw 45 rows

ROW_LOOP1:
    PUSH CX    ; Save X=70
    MOV DI, 45 ; Draw 45 columns
    
    COL_LOOP1:
        MOV AH, 0Ch
        INT 10h    ; Draw pixel at (CX,DX)
        INC CX     ; Move right
        DEC DI     ; One less pixel to draw
        JNZ COL_LOOP1  ; If DI != 0, keep drawing
    
    POP CX     ; Restore X=70
    INC DX     ; Move down one row
    DEC SI     ; One less row to draw
    JNZ ROW_LOOP1  ; If SI != 0, draw next row

This draws: 45 rows x 45 pixels = 2,025 pixels total

---

## 7. Common Mistakes

MISTAKE 1: Forgetting to set graphics mode

WRONG:
.CODE
START:
    MOV CX, 100
    ...

RIGHT:
.CODE
START:
    MOV AX, 13h
    INT 10h      ; MUST have this!
    MOV CX, 100

MISTAKE 2: Wrong function number

WRONG:
MOV AH, 0Dh  ; Function 0Dh = read pixel (not draw)

RIGHT:
MOV AH, 0Ch  ; Function 0Ch = write pixel

MISTAKE 3: Missing PUSH/POP

WRONG - no PUSH/POP:
ROW_LOOP:
    MOV DI, 45
    COL_LOOP:
        INT 10h
        INC CX
        DEC DI
        JNZ COL_LOOP
    INC DX
    DEC SI
    JNZ ROW_LOOP

RIGHT - with PUSH/POP:
ROW_LOOP:
    PUSH CX     ; SAVE
    MOV DI, 45
    COL_LOOP:
        INT 10h
        INC CX
        DEC DI
        JNZ COL_LOOP
    POP CX      ; RESTORE
    INC DX
    DEC SI
    JNZ ROW_LOOP

MISTAKE 4: Forgetting to exit properly

WRONG:
END START

RIGHT:
    MOV AH, 00h  ; Wait for key press
    INT 16h
    MOV AX, 3    ; Back to text mode
    INT 10h
    MOV AX, 4C00h ; Exit to DOS
    INT 21h
END START

MISTAKE 5: Off-screen drawing

WRONG:
MOV CX, 350  ; X must be 0-319
MOV DX, 250  ; Y must be 0-199

RIGHT:
MOV CX, 100
MOV DX, 100

---

## 8. Quick Reference

Drawing a Pixel:
MOV AH, 0Ch
MOV AL, COLOR
MOV BH, 0
MOV CX, X
MOV DX, Y
INT 10h

Nested Loop Template:
MOV CX, X_START
MOV DX, Y_START
MOV AL, COLOR
MOV SI, HEIGHT

ROW:
    PUSH CX
    MOV DI, WIDTH
    
    COL:
        MOV AH, 0Ch
        INT 10h
        INC CX
        DEC DI
        JNZ COL
    
    POP CX
    INC DX
    DEC SI
    JNZ ROW

Complete Program Template:
.MODEL SMALL
.STACK 100h

.CODE
START:
    MOV AX, 13h
    INT 10h
    
    ; YOUR DRAWING CODE HERE
    
    MOV AH, 00h
    INT 16h
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h
END START

Common Colors:
0 = Black
1 = Blue
2 = Green
3 = Cyan
4 = Red
5 = Magenta
6 = Brown
7 = Light Gray
8 = Dark Gray
14 = Yellow
15 = White