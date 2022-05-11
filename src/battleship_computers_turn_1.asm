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
        ldi r2, RANDOM_GEN_ADDR
        ld r2, r0               
        ld r2, r1               
        ldi r3, 0b00011111
        and r3, r0
        and r3, r1
        ldi r3, 10
        while
            cmp r0, r3
        stays ge
            sub r3, r0
            neg r0
        wend
        while
            cmp r1, r3
        stays ge
            sub r3, r1
            neg r1
        wend
        // random X coordinate in r0
        // random Y coordinate in r1
        br first_hit
    else
        ldi r1, SIZE_OF_SHIP
        ld r1, r1
        if
            cmp r1, r0
        is eq
            //killed
            br start
        fi
    fi
    dec r0
    if 
        tst r0
    is z
        rcall 1, 0          // go to second hit module
        mret
    fi
    
first_hit:
/* calculating number of cell by known coordinates */
    push r1
    ldi r3, 9
    sub r3, r1
    ldi r2, 0x80
    ldi r3, 10                                            
    while                                               
        dec r1
    stays ge
        add r3, r2
    wend
    add r0, r2   // Addr of a selected cell in r2
    pop r1
/* end of calculating number of cell by known coordinates */

/* check if this cell is already hit */
    ld r2, r3
    if
        shla r3
    is cs
        br start
    fi

    move r1, r3
    add r3, r1
    add r3, r1
    inc r1
    move r0, r3
    add r3, r0
    add r3, r0
    inc r0

    push r2
    ldi r2, X_COMP_PTR
    st r2, r0
    inc r2
    st r2, r1
    pop r2

    ld r2, r3                        // addr of a selected cell in r2
    if                              //
        shra r3                    //
    is cc                         //
        ldi r3, H_EMP_CELL       //
        st r2, r3               // check if a selected cell belongs to a ship
        ldi r3, 0b11100100     //
        jsr print_square      //
        mret                 //
    fi                      //
    
    ldi r3, PLAYER_SHIPS //
    ld r3, r0           //
    dec r0             // decreasing a number of Player's ships
    st r3, r0         //

    ldi r3, NUM_OF_HITS       //
    ldi r0, 1                //
    st r3, r0               //
    ldi r3, PREVIOUS_HIT   // updating global vars
    ldi r0, HIT_CELL1     //
    st r3, r0            //
    st r0, r2           //

    ldi r3, K_CELL     //
    st r2, r3         // mark cell as a killed ship cell

    ld r2, r0                     //
    shra r0                      //
    shra r0                     //
    shra r0                    // saving a size of a hit ship
    shra r0                   //
    ldi r3, SIZE_OF_SHIP     //
    st r3, r0               //

    ldi r2, HIT_X_COORD1          //
    ldi r3, X_COMP_PTR           //
    ld r3, r0                   //
    st r2, r0                  //
    inc r3                    //
    inc r2                   // saving coordinates of a hit cell
    inc r2                  //
    inc r2                 //
    inc r2                //
    ld r3, r1            //
    st r2, r1           //

    ldi r3, 0b11100001
    jsr print_square
    
    br start


print_square:
    ldi r2, X_COMP_PTR
    ld r2, r0
    inc r2
    ld r2, r1
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
