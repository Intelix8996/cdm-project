#include <devices.h>
#include "battleship/map_constants.h"
#include <devices/terminal.h>

asect 0

main:
    ldi r2, RAM_CONTROLLER_ADDR  //
    st r2, r1                    // page number in r1
    ldi r0, 10     // counter
    ldi r2, 0x80   // address of 1st cell

loop:
        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2

        ldc r2, r1
        st r2, r1
        inc r2
        push r2
        printc "."
        pop r2
        dec r0
        bnz loop
        
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, 0x80
    st r2, r3
    rts

asect 0x80
dc E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL 
dc E_CELL, E_CELL, E_CELL, S4_CELL, S4_CELL, S4_CELL, S4_CELL, E_CELL, E_CELL, S1_CELL
dc E_CELL, S1_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL
dc E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, S2_CELL, S2_CELL, E_CELL, E_CELL, E_CELL
dc E_CELL, S3_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, S2_CELL, S2_CELL
dc E_CELL, S3_CELL, E_CELL, E_CELL, S1_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL
dc E_CELL, S3_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL
dc E_CELL, E_CELL, E_CELL, S2_CELL, E_CELL, E_CELL, S3_CELL, E_CELL, S1_CELL, E_CELL
dc E_CELL, E_CELL, E_CELL, S2_CELL, E_CELL, E_CELL, S3_CELL, E_CELL, E_CELL, E_CELL
dc E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, E_CELL, S3_CELL, E_CELL, E_CELL, E_CELL
end.  
