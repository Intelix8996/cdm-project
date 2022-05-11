#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>
/* add checking if cursor is near to bounds of screen */
asect 0
up:
    pushall 
    jsr clear_cursor

    ldi r2, X_CURSOR     //
    ld r2, r0           // x-coordinate in r0
    inc r2             // y-coordinate in r1
    ld r2, r1         //

    ldi r3, 28                 //
    if                        //
        cmp r3, r1           //
    is z                    //
        ldi r1, 1          // checking boundaries
    else                  //
        inc r1           //
        inc r1          //
        inc r1         //
    fi                //
    st r2, r1

    ldi r2, DISP_B_ADDR         //
    st r2, r0                  //
    st r2, r1                 // print new cursor position
    ldi r3, 0b10100111       //
    st r2, r3               //

    ldi r2, NUM_CELL
    ld r2, r3
    ldi r0, -10
    add r0, r3
    st r2, r3

    br exit

down:    
    pushall 
    jsr clear_cursor

    ldi r2, X_CURSOR     //
    ld r2, r0           // x-coordinate in r0
    inc r2             // y-coordinate in r1
    ld r2, r1         // 
    
    ldi r3, 1                  //
    if                        //
        cmp r3, r1           //
    is z                    //
        ldi r1, 28         // checking boundaries
    else                  //
        dec r1           //
        dec r1          //
        dec r1         //
    fi                //
    st r2, r1

    ldi r2, DISP_B_ADDR         //
    st r2, r0                  //
    st r2, r1                 // print new cursor position
    ldi r3, 0b10100111       //
    st r2, r3               //

    ldi r2, NUM_CELL
    ld r2, r3
    ldi r0, 10
    add r0, r3
    st r2, r3

    br exit

left:
    pushall 
    jsr clear_cursor

    ldi r2, X_CURSOR     //
    ld r2, r0           // x-coordinate in r0
    inc r2             // y-coordinate in r1
    ld r2, r1         // 
    dec r2
    
    ldi r3, 1                  //
    if                        //
        cmp r3, r0           //
    is z                    //
        ldi r0, 28         // checking boundaries
    else                  //
        dec r0           //
        dec r0          //
        dec r0         //
    fi                //
    st r2, r0
       
    ldi r2, DISP_B_ADDR         //
    st r2, r0                  //
    st r2, r1                 // print new cursor position
    ldi r3, 0b10100111       //
    st r2, r3               //

    ldi r2, NUM_CELL
    ld r2, r3
    dec r3
    st r2, r3

    br exit

right:
    pushall 
    jsr clear_cursor

    ldi r2, X_CURSOR     //
    ld r2, r0           // x-coordinate in r0
    inc r2             // y-coordinate in r1
    ld r2, r1         // 
    dec r2

    ldi r3, 28                 //
    if                        //
        cmp r3, r0           //
    is eq                   //
        ldi r0, 1          // checking boundaries
    else                  //
        inc r0           //
        inc r0          //
        inc r0         //
    fi                //
    st r2, r0

    ldi r2, DISP_B_ADDR         //
    st r2, r0                  //
    st r2, r1                 // print new cursor position
    ldi r3, 0b10100111       //
    st r2, r3               //

    ldi r2, NUM_CELL
    ld r2, r3
    inc r3
    st r2, r3
    
    br exit

hit:
    pushall
    ldi r2, PLAYERS_TURN
    ldi r3, NUM_CELL
    ld r3, r3
    st r2, r3

    br exit
    
exit:
    iretp

clear_cursor:
    ldi r2, 0                                    //
    ld r2, r0 // x-coordinate in r0             //
    inc r2                                     //
    ld r2, r1 // y-coordinate in r1           //
    ldi r2, DISP_B_ADDR                      // clears current cursor position
    st r2, r0                               //
    st r2, r1                              //
    ldi r3, 0b10100000                    //
    st r2, r3                            //
    rts                                 //

asect 0xf0
dc up, 0, down, 0, left, 0, right, 0, hit

end.
