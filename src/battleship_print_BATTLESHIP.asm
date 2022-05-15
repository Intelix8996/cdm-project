#include <devices.h>
#include <call.h>
#include <display_print.h>

asect 0

ldi r2, DISP_B_ADDR  //
ldi r3, 0b10010000  // Clear B display
st r2, r3          //

ldi r0, DISP_B_ADDR
ldi r1, "B"
ldi r2, 17
push r2
ldi r2, 4
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "A"
ldi r2, 17
push r2
ldi r2, 8
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "T"
ldi r2, 17
push r2
ldi r2, 12
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "T"
ldi r2, 17
push r2
ldi r2, 16
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "L"
ldi r2, 17
push r2
ldi r2, 20
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "E"
ldi r2, 17
push r2
ldi r2, 24
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "S"
ldi r2, 10
push r2
ldi r2, 8
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "H"
ldi r2, 10
push r2
ldi r2, 12
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "I"
ldi r2, 10
push r2
ldi r2, 16
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_B_ADDR
ldi r1, "P"
ldi r2, 10
push r2
ldi r2, 20
push r2
call DISP_BANK, DISP_PRINTC

mret

end.
