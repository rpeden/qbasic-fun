'
' Super exciting program that moves a coloured box
' around the screen.
'

'Set a nice friendly window title
_TITLE "Box Mover"

'Set screen mode to 640x480
SCREEN 12

'Constants
SCREEN_WIDTH = _WIDTH
SCREEN_HEIGHT = _HEIGHT
CONST PIXELS_TO_MOVE = 1
CONST COLOUR_BLACK = 0
CONST COLOUR_RED = 12

'Variables
x = 50
y = 100
width = 150
height = 50
colour = 12

DO
    _LIMIT 180

    'obliterate old box
    CALL draw_a_box(x, y, width, height, COLOUR_BLACK)

    'update box position if arrow keys pressed
    IF _KEYDOWN(CVI(CHR$(0) + "H")) THEN
        y = y - PIXELS_TO_MOVE
        IF y < 0 THEN y = 0
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "P")) THEN
        y = y + PIXELS_TO_MOVE
        IF y + height > SCREEN_HEIGHT THEN y = 480 - height
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "K")) THEN
        x = x - PIXELS_TO_MOVE
        IF x < 0 THEN x = 0
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "M")) THEN
        x = x + PIXELS_TO_MOVE
        IF x + width > SCREEN_WIDTH THEN x = 640 - width
    END IF

    'draw the new box
    CALL draw_a_box(x, y, width, height, COLOUR_RED)
    _DISPLAY

LOOP UNTIL _KEYDOWN(27) '27 is escape key

SUB draw_a_box (x, y, width, height, colour)
LINE (x, y)-(x + width, y + height), colour, BF
END SUB

