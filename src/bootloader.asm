#include <devices.h>
#include "util.h"

asect 0

    addsp STACK_OFFSET

    ldi r0, IR_BUFFER_ADDR  // Init IR buffer
    ldi r1, 0
    st r0, r1

    ei                      // Enable interrupts

loop:
    br loop

    halt

end.
