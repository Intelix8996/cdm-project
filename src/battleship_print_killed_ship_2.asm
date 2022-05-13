#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r1, X_CURSOR
    ld r1, r2
    inc r1
    ld r1, r0
    dec r1

    ldi r3, 28
    if 
        cmp r3, r2
    is gt, and
        cmp r3, r0
    is gt, and
        push r2
        push r0
        ldi r2, -10
        ldi r0, 1
        jsr check_if_printed
        pop r0
        pop r2
        tst r3
    is z
        ldi r3, 3
        add r3, r0
        add r3, r2
        st r1, r2
        inc r1
        st r1, r0
        pushall
        ldi r1, 1
        ldi r0, -10
        jsr print_square
        popall
        sub r3, r0
        neg r0
        sub r3, r2
        neg r2
        st r1, r0
        dec r1
        st r1, r2
    fi

    ldi r3, 1
    if 
        cmp r2, r3
    is gt, and
        cmp r0, r3
    is gt, and
        push r2
        push r0
        ldi r2, 10
        ldi r0, -1
        jsr check_if_printed
        pop r0
        pop r2
        tst r3
    is z
        ldi r3, 3
        sub r3, r0
        neg r0
        sub r3, r2
        neg r2
        st r1, r2
        inc r1
        st r1, r0
        pushall
        ldi r0, 10
        ldi r1, -1
        jsr print_square
        popall
        add r3, r2
        add r3, r0
        st r1, r0
        dec r1
        st r1, r2
    fi

    if 
        ldi r3, 1
        cmp r2, r3
    is gt, and
        ldi r3, 28
        cmp r0, r3
    is lt, and
        push r2
        push r0
        ldi r2, -10
        ldi r0, -1
        jsr check_if_printed
        pop r0
        pop r2
        tst r3
    is z
        ldi r3, 3
        add r3, r0
        sub r3, r2
        neg r2
        st r1, r2
        inc r1
        st r1, r0
        pushall
        ldi r0, -10
        ldi r1, -1
        jsr print_square
        popall
        sub r3, r0
        neg r0
        add r3, r2
        st r1, r0
        dec r1
        st r1, r2
    fi

    if 
        ldi r3, 28
        cmp r2, r3
    is lt, and
        ldi r3, 1
        cmp r0, r3
    is gt, and
        push r2
        push r0
        ldi r2, 10
        ldi r0, 1
        jsr check_if_printed
        pop r0
        pop r2
        tst r3
    is z
        ldi r3, 3
        sub r3, r0
        neg r0
        add r3, r2
        st r1, r2
        inc r1
        st r1, r0
        pushall
        ldi r0, 10
        ldi r1, 1
        jsr print_square
        popall
        add r3, r0
        sub r3, r2
        neg r2
        st r1, r0
        dec r1
        st r1, r2
    fi

    mret


check_if_printed:
    ldi r3, NUM_CELL
    ld r3, r3
    add r0, r3
    add r2, r3
    ld r3, r3
    ldi r2, 0x81
    and r2, r3
    rts


print_square:

    ldi r3, NUM_CELL
    ld r3, r3
    add r0, r3
    add r1, r3
    ldi r0, H_EMP_CELL
    st r3, r0


    ldi r2, X_CURSOR
    ld r2, r0
    inc r2
    ld r2, r1
    dec r0
    dec r1

    ldi r2, CUR_DISPLAY
    ld r2, r2
    ldi r3, 0b11100110
    push r3
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    pop r3
    st r2, r3

    inc r0
    push r3
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    pop r3
    st r2, r3

    inc r0
    push r3
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    pop r3
    st r2, r3
    rts

end.
