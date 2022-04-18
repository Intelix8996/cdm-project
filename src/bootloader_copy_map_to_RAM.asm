#include <devices.h>
#include <battleship/global_vars.h>
#include "util.h"

asect LEN_GLOB
ldi r0, 0
ldi r1, X_CURSOR
st r0, r1
inc r0
ldi r1, Y_CURSOR
st r0, r1
main:
    addsp STACK_OFFSET
    ei                       // Enable interrupts
    ldi r0, IR_BUFFER_ADDR  // Init IR buffer
    ldi r1, 0xff
    st r0, r1
    
    ldi r0, 0
    ldi r2, ROM_CONTROLLER_ADDR  //
    ldi r3, 10                   //
    st r2, r3                    // jump to 10st ROM bank (map0)
    jsr 0                        //

    ldi r0, 0
    ldi r2, ROM_CONTROLLER_ADDR //
    ldi r3, 1                   //  
    st r2, r3                   // jump to Draw_map module
    jsr 0                       //
    halt                       

end.
