#include <devices.h>
#include <call.h>
#include <display_print.h>

asect 0

ldi r2, DISP_A_ADDR  //
ldi r3, 0b10010000  // Clear A display
st r2, r3          //

ldi r0, DISP_A_ADDR
ldi r1, "W"
ldi r2, 14
push r2
ldi r2, 9
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_A_ADDR
ldi r1, "I"
ldi r2, 14
push r2
ldi r2, 13
push r2
call DISP_BANK, DISP_PRINTC

ldi r0, DISP_A_ADDR
ldi r1, "N"
ldi r2, 14
push r2
ldi r2, 17
push r2
call DISP_BANK, DISP_PRINTC

mret

end.
