#include <devices.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r2, RAM_CONTROLLER_ADDR  //
    st r2, r0                    // map number in r0

    ldi r2, 0x80  // first map cell //задефайнить
    ldi r0, 27
    ldi r1, 27
loop:
    ld r2, r3 // address of cell in r2, type of cell in r1
    if
        dec r3
    is z
        jsr drawShip
    fi

    if
        dec r3
    is z
        jsr drawDeadShip
    fi

    if
        dec r3
    is z
        jsr drawDeadShipArea
    fi
    inc r2
    




drawShip:

drawDeadShip:

drawDeadShipArea:
