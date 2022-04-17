#include <devices.h>
#include "util.h"
asect 0
main:
    addsp STACK_OFFSET
    ei                       // Enable interrupts
    ldi r0, IR_BUFFER_ADDR  // Init IR buffer
    ldi r1, 0xff
    st r0, r1

    

    ldi r2, ROM_CONTROLLER_ADDR  //
    ldi r3, 10                   //
    st r2, r3                    // jump to 10st ROM bank (map0)
    jsr 0                        //
    halt                        

end.
