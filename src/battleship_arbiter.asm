#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r2, COMP_SHIPS   // 
    ldi r3, 20          //
    st r2, r3          // saving the number of ships in RAM
    inc r2            //
    st r2, r3        //
    
    ldi r2, RANDOM_GEN_ADDR       // Determining whose turn is first by random
    ld r2, r3                    // First player in r3
    ldi r0, 0b00000001          // 0 - Computer, 1 - Player
    and r0, r3                 //  
// start of loop //    
loop:
    if
        tst r3                               //
    is z                                    // 
        jsr indicate_computers_turn        //
        rcall 1, 0                        //
        jsr turnoff_comp_ind             // if (r3==0) then (call Computer's turn module) else (call Players's turn module)
        ldi r3, 1                       //
    else                               //
        jsr indicate_players_turn     //
        rcall 6, 0                   //
        jsr turnoff_pl_ind          //
        ldi r3, 0
    fi

    ldi r2, COMP_SHIPS     //
    ld r2, r0             // Number of Computer's ships in r0
    inc r2               // Number of Player's ships in r1
    ld r2, r1           // 

    if
        tst r1             //
    is nz, and            //
        tst r0           // if (Player's ships!=0) && (Computer's ships!=0) then (br loop)
    is nz               //
    then               //
        br loop       //
    fi               
    
// end of loop //

    if
        tst r0
    is z
        halt
    else
        halt
    fi
    mret
    

indicate_players_turn:
    ldi r2, DISP_B_ADDR
    ldi r3, 0b10100111
    jsr printpixels
    rts


indicate_computers_turn:
    ldi r2, DISP_A_ADDR
    ldi r3, 0b10100111
    jsr printpixels
    rts

turnoff_pl_ind:
    ldi r2, DISP_B_ADDR
    ldi r3, 0b10100000
    jsr printpixels
    rts

turnoff_comp_ind:
    ldi r2, DISP_A_ADDR
    ldi r3, 0b10100000
    jsr printpixels
    rts


printpixels:
    ldi r0, 13
    ldi r1, 31
    jsr printpix
    inc r0
    jsr printpix
    inc r0
    jsr printpix
    inc r0
    jsr printpix
    rts


printpix:
    st r2, r0
    st r2, r1
    st r2, r3
    rts
end
