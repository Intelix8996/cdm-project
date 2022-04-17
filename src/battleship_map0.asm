#include <devices.h>
#include <battleship/map_constants.h>
asect 0
main:
    ldi r2, RAM_CONTROLLER_ADDR  //
    ldi r3, 0                    // set page 0 in RAM
    st r2, r3                    //
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

        dec r0
        bnz loop
    halt

asect 0x80
dc E_CELL, E_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL // https://ibb.co/TPtKbZJ
dc N_CELL, N_CELL, N_CELL, S_CELL, S_CELL, S_CELL, S_CELL, N_CELL, N_CELL, S_CELL
dc N_CELL, S_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL
dc N_CELL, N_CELL, N_CELL, E_CELL, N_CELL, S_CELL, S_CELL, N_CELL, N_CELL, N_CELL
dc N_CELL, S_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, S_CELL, S_CELL
dc N_CELL, S_CELL, N_CELL, N_CELL, S_CELL, N_CELL, E_CELL, N_CELL, N_CELL, N_CELL
dc N_CELL, S_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL, N_CELL
dc N_CELL, N_CELL, N_CELL, S_CELL, N_CELL, N_CELL, S_CELL, N_CELL, S_CELL, N_CELL
dc E_CELL, E_CELL, N_CELL, S_CELL, N_CELL, N_CELL, S_CELL, N_CELL, N_CELL, N_CELL
dc E_CELL, E_CELL, N_CELL, N_CELL, N_CELL, N_CELL, S_CELL, N_CELL, E_CELL, E_CELL
end.  