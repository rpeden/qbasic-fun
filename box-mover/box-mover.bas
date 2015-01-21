'
' Super exciting program that moves a coloured box
' around the screen.
'

'Set a nice friendly window title
_TITLE "Box Mover"

'Set screen mode to 640x480
SCREEN 12

'Constants
SCREEN_WIDTH = 640
SCREEN_HEIGHT = 480
PIXELS_TO_MOVE = 1

'Variables
x = 50
y = 100
width = 150
height = 50
colour = 12

CALL draw_a_box(x, y, width, height, colour)

DO
    _LIMIT 180
    IF _KEYDOWN(CVI(CHR$(0) + "H")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        y = y - PIXELS_TO_MOVE
        IF y < 0 THEN y = 0
        CALL draw_a_box(x, y, width, height, colour)
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "P")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        y = y + PIXELS_TO_MOVE
        IF y + height > SCREEN_HEIGHT THEN y = 480 - height
        CALL draw_a_box(x, y, width, height, colour)
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "K")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        x = x - PIXELS_TO_MOVE
        IF x < 0 THEN x = 0
        CALL draw_a_box(x, y, width, height, colour)
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "M")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        x = x + PIXELS_TO_MOVE
        IF x + width > SCREEN_WIDTH THEN x = 640 - width
        CALL draw_a_box(x, y, width, height, colour)
    END IF

LOOP UNTIL kbd$ = CHR$(27) '27 is escape key

SUB draw_a_box (x, y, width, height, colour)
LINE (x, y)-(x + width, y + height), colour, BF
END SUB

