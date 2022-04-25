#ifndef CALL_H
#define CALL_H

#include <devices.h>
#include <devices/rom_controller.h>

/*

Call a module by number

call {module}, {entry}

*/
macro call/2
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, $1
    st r2, r3
    jsr $2
mend

/*

Call a module by offstet

call {offset}, {entry}

*/

macro rcall/2
    ldi r2, ROM_CONTROLLER_ADDR
    ld r2, r3
    push r2
    ldi r2, $1
    add r2, r3
    pop r2
    st r2, r3
    jsr $2
mend

/*

Return from module

mret

*/
macro mret/0
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, SHORT_RETURN
    st r2, r3
    rts
mend

/*

Return from interrupt without restoring registers

iret

*/
macro iret/0
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, SHORT_RETURN
    st r2, r3
    rti
mend

/*

Return from interrupt and restore registers

iret

*/
macro iretp/0
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, LONG_RETURN
    st r2, r3
    popall
    rti
mend

#endif
