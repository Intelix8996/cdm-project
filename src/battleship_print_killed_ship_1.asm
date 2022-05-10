#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r2, 0                                    //
    ld r2, r0 // x-coordinate in r0             //
    inc r2                                     //
    ld r2, r1 // y-coordinate in r1           //
    ldi r2, DISP_B_ADDR                      // clears current cursor position
    st r2, r0                               //
    st r2, r1                              //
    ldi r3, 0b10100000                    //
    st r2, r3                            //
    
    ldi r0, NUM_OF_HITS
    ld r0, r0
loop:
    ldi r1, HIT_X_COORD1
    add r0, r1
    dec r1
    ld r1, r1
    ldi r2, X_CURSOR
    st r2, r1

    ldi r1, HIT_Y_COORD1
    add r0, r1
    dec r1
    ld r1, r1
    inc r2
    st r2, r1

    ldi r2, NUM_CELL
    ldi r3, PREVIOUS_HIT
    ld r3, r1
    dec r1
    st r3, r1
    inc r1
    ld r1, r1
    st r2, r1

    push r0

    ldi r1, X_CURSOR
    ld r1, r2   

    ldi r3, 28
    if
        cmp r3, r2
    is gt, and
        ldi r3, NUM_CELL
        ld r3, r3
        inc r3
        ld r3, r3
        ldi r0, 0x81
        and r0, r3
        tst r3
    is z
        inc r2
        inc r2
        inc r2
        st r1, r2
        pushall
        ldi r3, NUM_CELL
        ld r3, r3
        inc r3
        ldi r0, H_EMP_CELL
        st r3, r0
        jsr print_square
        popall
        dec r2
        dec r2
        dec r2
        st r1, r2
    fi

    ldi r3, 1
    if
        cmp r2, r3
    is gt, and
        ldi r3, NUM_CELL
        ld r3, r3
        dec r3
        ld r3, r3
        ldi r0, 0x81
        and r2, r0
        tst r3
    is z
        dec r2
        dec r2
        dec r2
        st r1, r2
        pushall
        ldi r3, NUM_CELL
        ld r3, r3
        dec r3
        ldi r0, H_EMP_CELL
        st r3, r0
        jsr print_square
        popall
        inc r2
        inc r2
        inc r2
        st r1, r2
    fi

    ldi r1, Y_CURSOR
    ld r1, r0

    ldi r3, 28
    if
        cmp r3, r0
    is gt, and
        ldi r3, NUM_CELL
        ld r3, r3
        ldi r2, -10
        add r2, r3
        ld r3, r3
        ldi r2, 0x81
        and r2, r3
        tst r3
    is z
        inc r0
        inc r0
        inc r0
        st r1, r0
        pushall
        ldi r3, NUM_CELL
        ld r3, r3
        ldi r0, -10
        add r0, r3
        ldi r0, H_EMP_CELL
        st r3, r0
        jsr print_square
        popall
        dec r0
        dec r0
        dec r0
        st r1, r0
    fi

    ldi r3, 1
    if
        cmp r0, r3
    is gt, and
        ldi r3, NUM_CELL
        ld r3, r3
        ldi r2, 10
        add r2, r3
        ld r3, r3
        ldi r2, 0x81
        and r2, r3
        tst r3
    is z
        dec r0
        dec r0
        dec r0
        st r1, r0
        pushall
        ldi r3, NUM_CELL
        ld r3, r3
        ldi r0, 10
        add r0, r3
        ldi r0, H_EMP_CELL
        st r3, r0
        jsr print_square
        popall
        inc r0
        inc r0
        inc r0
        st r1, r0
    fi

    rcall 1, 0
    
    pop r0
    dec r0
    if 
        tst r0
    is gt
        br loop
    fi

mret
        

print_square:
    ldi r2, X_CURSOR
    ld r2, r0
    inc r2
    ld r2, r1
    dec r0
    dec r1

    ldi r2, DISP_B_ADDR
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100110
    st r2, r3

    inc r0
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100110
    st r2, r3

    inc r0
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, 0b11100110
    st r2, r3
    rts

end.
