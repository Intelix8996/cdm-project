#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
second_hit:
    ldi r0, PREVIOUS_HIT  //
    ld r0, r0            // previously selected cell in r0
    ld r0, r0           //

generating_random_direction:
    ldi r2, RANDOM_GEN_ADDR
    ld r2, r1

    move r0, r2              
    if
        ldi r3, 0b00000011
        and r3, r1    // 0 - up, 1 - right, 2 - down, 3 - left
    is z
        if
            ldi r3, -10
            add r3, r2
            push r2
            ldi r3, 138
            cmp r2, r3 
        is ge, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            st r3, r1
            pop r2
            ldi r3, X_COMP_PTR
            ld r3, r0
            inc r3
            inc r3
            inc r3
            inc r3
            ld r3, r1
            inc r1
            inc r1
            inc r1
            br end_of_generating_random_direction
        else
            pop r2
            br generating_random_direction
        fi
    fi

    move r0, r2 
    if
        dec r1    // 1 - right
    is z
        if
            inc r2
            push r2
            move r2, r3
            shra r3
        is cs, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            st r3, r1
            pop r2
            ldi r3, X_COMP_PTR
            ld r3, r0
            inc r3
            inc r3
            inc r3
            inc r3
            ld r3, r1
            inc r0
            inc r0
            inc r0
            br end_of_generating_random_direction
        else
            pop r2
            br generating_random_direction
        fi
    fi

    move r0, r2
    if
        dec r1     // 2 - down
    is z
        if
            ldi r3, 10
            add r3, r2
            push r2
            ldi r3, 217
            cmp r3, r2
        is ge, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            st r3, r1
            pop r2
            ldi r3, X_COMP_PTR
            ld r3, r0
            inc r3
            inc r3
            inc r3
            inc r3
            ld r3, r1
            dec r1
            dec r1
            dec r1
            br end_of_generating_random_direction
        else
            pop r2
            br generating_random_direction
        fi
    fi

    move r0, r2 
    if
        dec r1    // 3 - left
    is z
        if
            dec r2
            push r2
            move r2, r3
            shra r3
        is cc, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            st r3, r1
            pop r2
            ldi r3, X_COMP_PTR
            ld r3, r0
            inc r3
            inc r3
            inc r3
            inc r3
            ld r3, r1
            dec r0
            dec r0
            dec r0
            br end_of_generating_random_direction
        else
            pop r2
            br generating_random_direction
        fi
    fi

end_of_generating_random_direction:
    ld r2, r3
    if
        tst r3
    is z
        ldi r3, H_EMP_CELL
        st r2, r3
        ldi r3, 0b11100100    
        jsr print_square
        mret
    fi
    halt






print_square:
    dec r0
    dec r1

    ldi r2, DISP_A_ADDR
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
