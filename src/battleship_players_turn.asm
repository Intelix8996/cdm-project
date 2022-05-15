#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
start:
    ldi r2, RAM_CONTROLLER_ADDR           //
    ldi r1, 0                            // Selecting 0 (Computer's) map
    st r2, r1                           //  

    ldi r2, CUR_DISPLAY
    ldi r1, DISP_B_ADDR
    st r2, r1

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
        ldi r3, 0b11100100         // print blue square and return from module
        jsr print_square          //
        ldi r2, PLAYERS_TURN     //
        ldi r3, 0               //
        st r2, r3              //
        mret
    else
        if
            move r0, r1
            shla r1
        is cs
            ldi r2, PLAYERS_TURN     
            ldi r3, 0               
            st r2, r3              
            br waiting_for_turn
        else
            br hit_proccessing
        fi 
    fi

hit_proccessing:
    pushall 
    ldi r3, 0b11100001 
    jsr print_square
    popall

    ldi r1, NUM_OF_HITS
    ld r1, r1
    if
        tst r1
    is z
        ldi r1, PREVIOUS_HIT      //
        ldi r2, PREVIOUS_HIT     // global vars initialisation
        st r1, r2               //

        shra r0                        //
        shra r0                       //
        shra r0                      // save a size of attacked ship in SIZE_OF_SHIP
        shra r0                     //
        ldi r2, SIZE_OF_SHIP       // 
        st r2, r0                 //

    fi

    ldi r3, COMP_SHIPS      //
    ld r3, r0              //
    dec r0                // decrease a number of Computer's ship
    st r3, r0            //

    ldi r2, PREVIOUS_HIT             //
    ld r2, r1                       //
    inc r1                         // update PREVIOUS_HIT
    st r2, r1                     //

    ldi r2, PLAYERS_TURN        //
    ld r2, r2                  // saving selected cell in HIT_CELLx 
    st r1, r2                 // 

    inc r1                      //
    inc r1                     //
    inc r1                    //
    inc r1                   // save X coordinate of a hit cell
    ldi r2, X_CURSOR        //
    ld r2, r2              //
    st r1, r2             //

    inc r1                      //
    inc r1                     //
    inc r1                    //
    inc r1                   // save Y coordinate of a hit cell
    ldi r2, Y_CURSOR        //
    ld r2, r2              //
    st r1, r2             //

    ldi r1, NUM_OF_HITS        //
    ld r1, r2                 //
    inc r2                   // increase a number of hit cells
    st r1, r2               //
    
    ldi r3, SIZE_OF_SHIP                   //
    ld r3, r3                             //
    if                                   //
        cmp r2, r3                      // 
    is eq                              //
        jsr disable_interrupts        //
        rcall 1, 0                   //   if (SIZE_OF_SHIP==NUM_OF_HITS) then (call print_killed_ship and return defualt state of global vars)
        ldi r0, NUM_OF_HITS         //
        ldi r1, 0                  //
        st r0, r1                 //
        ldi r2, DISP_B_ADDR
        ldi r1, X_CURSOR
        ld r1, r0
        inc r1
        ld r1, r1
        ldi r3, 0b10100111
        st r2, r0
        st r2, r1
        st r2, r3
        jsr enable_interrupts
    fi                            //
    ldi r0, PLAYERS_TURN
    ldi r1, 0
    st r0, r1
    br waiting_for_turn

enable_interrupts:
    ldi r2, IR_BUFFER_ADDR   
    ldi r3, 0xff           
    st r2, r3        
    rts
disable_interrupts:
    ldi r2, IR_BUFFER_ADDR   
    ldi r3, 0x00           
    st r2, r3        
    rts 

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
