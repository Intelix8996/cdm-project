#include <devices.h>
#include <call.h>
#include "battleship/map_constants.h"
#include "battleship/global_vars.h"

asect 0
main:
    ldi r2, RAM_CONTROLLER_ADDR  //
    st r2, r0                   // map number in r0

    ldi r2, 0x89
    ldi r0, 27  // X - coordinate
    ldi r1, 27 //  Y - coordinate
    
loop:
    ld r2, r3 // address of cell in r2, type of cell in r1
    if
        tst r3
    is nz
        push r2
        jsr drawShip
        pop r2
    fi

    dec r2

    if
        dec r0
        dec r0
        dec r0
    is lt
        ldi r0, 27
        dec r1
        dec r1
        dec r1
        push r1
        ldi r1, 20
        add r1, r2
        pop r1
    fi
    
    if
        tst r1
    is pl
        br loop
    fi

mret

drawShip:

    ldi r2, DISP_A_ADDR
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100010
    st r2, r3
   
    inc r0
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100010
    st r2, r3

    inc r0
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100010
    st r2, r3
    dec r0
    dec r0
    rts

end
