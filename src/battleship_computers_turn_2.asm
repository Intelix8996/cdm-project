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
        tst r1
    is z
        if
            ldi r3, -10
            add r3, r2
            push r2
            ldi r3, 128
            cmp r2, r3 
        is ge, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            ldi r1, 0
            st r3, r1
            pop r2
            jsr load_coord
            inc r1
            inc r1
            inc r1
            br end_of_generating_random_direction
        else
            pop r2
            br generating_random_direction
        fi
    fi

    if
        dec r1    // 1 - right
    is z
        if
            inc r2
            push r2
            ldi r3, HIT_X_COORD1
            ld r3, r3
            ldi r2, 28
            cmp r2, r3
        is gt, and
            pop r2
            push r2
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            ldi r1, 1
            st r3, r1
            pop r2
            jsr load_coord
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
            ldi r3, 227
            cmp r3, r2
        is ge, and
            ld r2, r2
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            ldi r1, 2
            st r3, r1
            pop r2
            jsr load_coord
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
            ldi r3, HIT_X_COORD1
            ld r3, r3
            
            ldi r2, 1
            cmp r3, r2
        is gt, and
            pop r2
            push r2
            ld r2, r2    
            shla r2
        is cc
            ldi r3, DIR_OF_HITS
            ldi r1, 3
            st r3, r1
            pop r2
            jsr load_coord
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
    // r2 points to a selected cell
    // r0 and r1 contain coordinates of a selected cell
    

    ldi r3, HIT_X_COORD2
    st r3, r0
    ldi r3, HIT_Y_COORD2
    st r3, r1

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


    ldi r3, PREVIOUS_HIT
    ldi r0, HIT_CELL2
    st r3, r0
    st r0, r2

    ldi r3, K_CELL     //
    st r2, r3         // mark cell as a killed ship cell

    ldi r3, 0b11100001    
    jsr print_square

    ldi r3, NUM_OF_HITS
    ld r3, r2
    inc r2
    st r3, r2

    ldi r3, PLAYER_SHIPS //
    ld r3, r0           //
    dec r0             // decreasing a number of Player's ships
    st r3, r0         //

    mret





load_coord:
    ldi r3, HIT_X_COORD1
    ld r3, r0
    ldi r3, HIT_Y_COORD1
    ld r3, r1
    rts

print_square:
    ldi r2, HIT_X_COORD2
    ld r2, r0
    ldi r2, HIT_Y_COORD2
    ld r2, r1
    dec r0
    dec r1

    ldi r2, DISP_A_ADDR

    jsr label1

    inc r0
    push r3
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    pop r3
    st r2, r3

    inc r0

    jsr label1
    
    rts
label1:    
    push r3
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    pop r3
    st r2, r3
    rts

end.
