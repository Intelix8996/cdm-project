#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
start:
    ldi r2, RAM_CONTROLLER_ADDR           //
    ldi r1, 0                            // Selecting 0 (Computer's) map
    st r2, r1                           //  

    br waiting_for_turn


waiting_for_turn:
    ldi r2, PLAYERS_TURN                  
    ld r2, r3                            
    if                                  
        tst r3    // r3 contains information about Player's turn
    is z                              
        br waiting_for_turn
    else
        br check                     
    fi  

check:
    ld r3, r0                  // selected cell is in r0!
    if
        tst r0
    is z
        ldi r0, H_EMP_CELL           //
        st r3, r0                   //
        ldi r3, 0b11100110         // print blue square and return from module
        jsr print_square          //
        ldi r2, PLAYERS_TURN     //
        ldi r3, 0               //
        st r2, r3              //
        mret
    else
        br hit_proccessing 
    fi

hit_proccessing:
    ldi r1, LAST_HIT
    ld r1, r1
    if
        tst r1
    is z
        ldi r2, HIT_CELL1
        st r1, r2           // save addr of HIT_CELL1 in LAST_HIT
        st r2, r3          // save selected cell in HIT_CELL1
        shra r0
        shra r0
        shra r0
        shra r0
        ldi r2, SIZE_OF_SHIP
        st r2, r0

print_square:
    ldi r2, X_CURSOR
    ld r2, r0
    inc r2
    ld r2, r1
    dec r0
    dec r1

    ldi r2, DISP_B_ADDR
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