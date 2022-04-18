#include <devices.h>
#include <battleship/map_constants.h>
#include <battleship/global_vars.h>

asect 0
main:
    ldi r2, RAM_CONTROLLER_ADDR  //
    st r2, r0                   // map number in r0

    ldi r2, M_CELL
    ldi r0, 27  // X - coordinate
    ldi r1, 27 //  Y - coordinate
loop:
    ld r2, r3 // address of cell in r2, type of cell in r1
    if
        dec r3
    is z
        push r2
        jsr drawShip
        pop r2
        br jump1
    fi

    if
        dec r3
    is z
        push r2
        jsr drawDeadShip
        pop r2
        br jump1
    fi

    if
        dec r3
    is z
        push r2
        jsr drawDeadShipArea
        pop r2
    fi

jump1:
    inc r2

    if
        dec r0
        dec r0
        dec r0
    is mi
        ldi r0, 27
        dec r1
        dec r1
        dec r1
    fi
    
    if
        tst r1
    is pl
        br loop
    fi
ldi r2, ROM_CONTROLLER_ADDR
ldi r3, 0x80
st r2, r3
rts

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

drawDeadShip:
    ldi r2, DISP_A_ADDR
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100001
    st r2, r3
   
    inc r0
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100001
    st r2, r3

    inc r0
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100001
    st r2, r3
    dec r0
    dec r0
    rts

drawDeadShipArea:
    rts

end
