'
' Super exciting program that moves a coloured box
' around the screen AND bounces a circle up and down!
'

'Set a nice friendly window title
_TITLE "Bouncy Circle"

'Set screen mode to 640x480
SCREEN 12

'Constants
SCREEN_WIDTH = _WIDTH
SCREEN_HEIGHT = _HEIGHT
PIXELS_TO_MOVE = 1
COLOUR_BLACK = 0

'Variables
x = 50
y = 100
width = 150
height = 50
colour = 12

circle_radius = 10
circle_x = 500
circle_y = 10
circle_colour = 8
circle_direction = 0

CALL draw_a_box(x, y, width, height, colour)
CALL draw_a_circle(circle_radius, circle_x, circle_y, circle_colour)

DO
    CLS
    _LIMIT 90

    'cover up the old circle
    'CALL draw_a_circle(circle_radius, circle_x, circle_y, COLOUR_BLACK)
    '_DISPLAY

    'if moving down
    IF circle_direction = 0 THEN circle_y = circle_y + 1
    'if moving up
    IF circle_direction = 1 THEN circle_y = circle_y - 1

    'change circle direction if we are at the edge of the screen
    IF circle_direction = 0 AND circle_y + circle_radius = SCREEN_HEIGHT THEN circle_direction = 1
    IF circle_direction = 1 AND circle_y - circle_radius = 0 THEN circle_direction = 0

    'draw the new circle
    CALL draw_a_circle(circle_radius, circle_x, circle_y, circle_colour)

    IF _KEYDOWN(CVI(CHR$(0) + "H")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        y = y - PIXELS_TO_MOVE
        IF y < 0 THEN y = 0
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "P")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        y = y + PIXELS_TO_MOVE
        IF y + height > SCREEN_HEIGHT THEN y = SCREEN_HEIGHT - height
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "K")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        x = x - PIXELS_TO_MOVE
        IF x < 0 THEN x = 0
    END IF
    IF _KEYDOWN(CVI(CHR$(0) + "M")) THEN
        CALL draw_a_box(x, y, width, height, 0)
        x = x + PIXELS_TO_MOVE
        IF x + width > SCREEN_WIDTH THEN x = SCREEN_WIDTH - width
    END IF
    CALL draw_a_box(x, y, width, height, colour)
    _DISPLAY

LOOP UNTIL kbd$ = CHR$(27) '27 is escape key

SUB draw_a_box (x, y, width, height, colour)
LINE (x, y)-(x + width, y + height), colour, BF
END SUB

SUB draw_a_circle (radius, cx, cy, colour)
CIRCLE (cx, cy), radius, colour
PAINT (cx, cy), colour, colour
END SUB
