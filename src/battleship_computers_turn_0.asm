#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
ldi r2, RAM_CONTROLLER_ADDR           //
ldi r1, 1                            // Selecting 1 (Player's) map
st r2, r1                           //

ldi r2, CUR_DISPLAY
ldi r1, DISP_A_ADDR
st r2, r1

start:
    ldi r0, NUM_OF_HITS        //
    ld r0, r0                 //
    if                       // check if any ship is already found and hit
        tst r0              // 
    is z                   //
first_hit:                      // in case NUM_OF_HITS==0 Computer need to make a first hit
        rcall 1, DEFAULT_ENTRY
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 1
        if
            cmp r3, r0    // check if previous hit damaged a ship
        is eq
            ldi r3, SIZE_OF_SHIP
            ld r3, r3
            if
                cmp r0, r3  // check if damaged ship is fully destroyed
            is eq
                br kill_and_return_default_state  // paints a cells around a ship
            else
                br second_hit // if not, make a second hit
            fi
        else
            mret
        fi
    fi

    if
        dec r0
    is z
second_hit:            
        rcall 2, DEFAULT_ENTRY
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 2
        if
            cmp r3, r0
        is eq
            ldi r3, SIZE_OF_SHIP
            ld r3, r3
            if
                cmp r0, r3
            is eq
                br kill_and_return_default_state
            else
                br third_hit
            fi
        else
            mret
        fi
    fi
    
    if
        dec r0
    is z
third_hit:
        rcall 3, DEFAULT_ENTRY
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 3
        if
            cmp r3, r0
        is eq
            ldi r3, SIZE_OF_SHIP
            ld r3, r3
            if
                cmp r0, r3
            is eq
                br kill_and_return_default_state
            else
                br fourth_hit
            fi
        else
            mret
        fi
    fi

    if
        dec r0
    is z
fourth_hit:
        rcall 4, DEFAULT_ENTRY
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 4
        if
            cmp r3, r0
        is eq
            br kill_and_return_default_state
        else
            mret
        fi
    fi
kill_and_return_default_state:
    jsr copy_cursor_posititon  // copying X_CURSOR, Y_CURSOR and NUM_CELL to a safe place to not reset them, because they are used by Player 
    rcall 6, DEFAULT_ENTRY 
    jsr copy_cursor_posititon
    ldi r0, NUM_OF_HITS
    ldi r1, 0
    st r0, r1
    ldi r2, PLAYER_SHIPS
    ld r2, r2
    if 
        tst r2
    is nz
        br start
    else
        mret
    fi

copy_cursor_posititon:
    ldi r2, X_CURSOR
    ldi r3, X_CURSOR_COPY
    ld r2,r0
    ld r3,r1
    st r2, r1
    st r3, r0
    ldi r2, Y_CURSOR
    ldi r3, Y_CURSOR_COPY
    ld r2,r0
    ld r3,r1
    st r2, r1
    st r3, r0
    ldi r2, NUM_CELL
    ldi r3, NUM_CELL_COPY
    ld r2,r0
    ld r3,r1
    st r2, r1
    st r3, r0
    rts
    
end.
