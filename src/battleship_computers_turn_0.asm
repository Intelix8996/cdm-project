#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
ldi r2, RAM_CONTROLLER_ADDR           //
ldi r1, 1                            // Selecting 1 (Player's) map
st r2, r1                           //

start:
    ldi r0, NUM_OF_HITS        //
    ld r0, r0                 //
    if                       // check if any ship is already found and hit
        tst r0              // 
    is z                   //
first_hit:                    
        rcall 1, 0
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 1
        if
            cmp r3, r0
        is eq
            br second_hit
        else
            mret
        fi
    fi

    if
        dec r0
    is z
second_hit:
        rcall 2, 0
        halt
        ldi r0, NUM_OF_HITS       
        ld r0, r0
        ldi r3, 2
        if
            cmp r3, r0
        is eq
            br second_hit
        else
            mret
        fi
    fi






end.
