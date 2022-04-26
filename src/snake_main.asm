#include <devices.h>
#include <call.h>

#include "snake/vars.h"
#include "devices/display.h"

asect 0
    
main:

    ldi r0, IR_PAGE_REG_ADDR
    ldi r1, ROM_CONTROLLER_ADDR
    ld r1, r1
    inc r1
    st r0, r1

    ldi r0, IR_BUFFER_ADDR
    ldi r1, 0x0f
    st r0, r1

    ldi r0, USER_DISP_A_ADDR
    ldi r1, 0
    st r0, r1

    jsr apple_gen

    ldi r0, HEAD_PTR
    ldi r1, 0x82
    st r0, r1

    ldi r3, 15
    st r1, r3
    inc r1
    st r1, r3

    ldi r0, TAIL_PTR
    ldi r1, 0x80
    st r0, r1

    ldi r3, 14
    st r1, r3
    inc r1
    inc r3
    st r1, r3

    ldi r0, 15
    ldi r1, 15

loop:

    ldi r2, DIRECTION
    ld r2, r2

    if
        tst r2
    is z
        inc r0
        br mkmove
    fi

    if
        dec r2
    is z
        dec r0
        br mkmove
    fi

    if
        dec r2
    is z
        inc r1
        br mkmove
    fi

    if
        dec r2
    is z
        dec r1
        br mkmove
    fi

mkmove:

    ldi r2, HEAD_PTR
    ld r2, r3
    st r3, r0
    inc r3
    st r3, r1
    if
        inc r3
    is cs
        ldi r3, 0x80
    fi
    st r2, r3

    ldi r2, DISP_A_ADDR
    ldi r3, CMD_WRITE_RGB

    st r2, r0
    st r2, r1
    st r2, r3

    ldi r2, APPLE_X
    ldi r3, APPLE_Y
    ld r2, r2
    ld r3, r3

    if
        cmp r0, r2
    is eq
        if
            cmp r1, r3
        is eq

            ldi r2, USER_DISP_A_ADDR
            ld r2, r3
            inc r3
            st r2, r3

            jsr apple_gen

            br loop
        fi
    fi

    push r0
    push r1

    ldi r2, TAIL_PTR
    ld r2, r3
    ld r3, r0
    inc r3
    ld r3, r1
    if
        inc r3
    is cs
        ldi r3, 0x80
    fi
    st r2, r3

    ldi r2, DISP_A_ADDR
    ldi r3, CMD_WRITE_BLACK

    st r2, r0
    st r2, r1
    st r2, r3

    pop r1
    pop r0

    br loop

    mret

apple_gen:

    pushall

    ldi r0, RANDOM_GEN_ADDR
    ld r0, r1
    ld r0, r0

    ldi r2, 0b00011111
    and r2, r0
    and r2, r1

    ldi r2, DISP_A_ADDR
    ldi r3, CMD_WRITE_G

    st r2, r0
    st r2, r1
    st r2, r3

    ldi r3, APPLE_X
    st r3, r0

    ldi r3, APPLE_Y
    st r3, r1

    popall

    rts

end.
