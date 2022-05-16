#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
fourth_hit:

    ldi r2, HIT_CELL3
    ld r2, r2
    ldi r3, DIR_OF_HITS   // 0 - up, 1 - right, 2 - down, 3 - left
    ld r3, r3
    ldi r0, HIT_X_COORD3
    ld r0, r0
    ldi r1, HIT_Y_COORD3
    ld r1, r1
    if
        tst r3
    is z
        if
            ldi r3, 28
            cmp r1, r3
        is lt, and
            ldi r3, -10
            add r3, r2
            ld r2, r3
            shla r3
        is cc
            inc r1
            inc r1
            inc r1
            br hit_proccessing
        else
            ldi r3, 2 // change up -> down
            jsr change_direction
            br fourth_hit
        fi
    fi

    if
        dec r3
    is z
        if
            ldi r3, 28
            cmp r0, r3
        is lt, and
            inc r2
            ld r2, r3
            shla r3
        is cc
            inc r0
            inc r0
            inc r0
            br hit_proccessing
        else 
            ldi r3, 3 // change right -> left
            jsr change_direction
            br fourth_hit
        fi
    fi

    if
        dec r3
    is z
        if 
            ldi r3, 1
            cmp r1, r3
        is gt, and
            ldi r3, 10
            add r3, r2
            ld r2, r3
            shla r3
        is cc
            dec r1
            dec r1
            dec r1
            br hit_proccessing
        else
            ldi r3, 0 // change down -> up
            jsr change_direction
            br fourth_hit
        fi
    fi

    if
        dec r3
    is z
        if 
            ldi r3, 1
            cmp r0, r3
        is gt, and
            dec r2
            ld r2, r3
            shla r3
        is cc
            dec r0 
            dec r0
            dec r0
            br hit_proccessing
        else
            ldi r3, 1 // change left -> right
            jsr change_direction
            br fourth_hit
        fi
    fi






hit_proccessing:
    ldi r3, HIT_X_COORD4
    st r3, r0
    ldi r3, HIT_Y_COORD4
    st r3, r1

    ld r2, r3                        // addr of a selected cell in r2
    if                              //  selected cell in r3
        shra r3                    //
    is cc                         //
        ldi r3, H_EMP_CELL       //
        st r2, r3               // check if a selected cell belongs to a ship or not
        ldi r2, COLOR_OF_SQUARE
        ldi r3, 0b11100100
        st r2, r3
        jsr print_square      
        ldi r3, DIR_OF_HITS
        ld r3, r3
        ldi r2, 0b00000010
        xor r2, r3
        jsr change_direction  
        mret                  
    fi                     


    ldi r3, PREVIOUS_HIT
    ldi r0, HIT_CELL4
    st r3, r0
    st r0, r2

    ldi r3, K_CELL     //
    st r2, r3         // mark cell as a killed ship cell
    
    ldi r2, COLOR_OF_SQUARE
    ldi r3, 0b11100001
    st r2, r3
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

change_direction:
    ldi r2, DIR_OF_HITS
    st r2, r3

    ldi r1, HIT_CELL1
    ld r1, r0
    ldi r3, HIT_CELL3
    ld r3, r2
    st r1, r2
    st r3, r0

    ldi r2, HIT_X_COORD1
    ldi r3, HIT_X_COORD3
    ld r2, r0
    ld r3, r1
    st r2, r1
    st r3, r0

    ldi r2, HIT_Y_COORD1
    ldi r3, HIT_Y_COORD3
    ld r2, r0
    ld r3, r1
    st r2, r1
    st r3, r0
    
    rts
    

print_square:
    ldi r2, HIT_X_COORD4
    ld r2, r0
    ldi r2, HIT_Y_COORD4
    ld r2, r1
    dec r0
    dec r1

    ldi r2, DISP_A_ADDR
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, COLOR_OF_SQUARE
    ld r3, r3
    st r2, r3

    inc r0
    ldi r3, 0b00000101
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, COLOR_OF_SQUARE
    ld r3, r3
    st r2, r3

    inc r0
    ldi r3, 0b00000111
    st r2, r3
    st r2, r0
    st r2, r1
    ldi r3, COLOR_OF_SQUARE
    ld r3, r3
    st r2, r3
    rts

end.
