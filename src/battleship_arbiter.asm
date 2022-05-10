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
    ldi r3, 1 //del
// start of loop //    
loop:
    if
        tst r3                 //
    is z                      // 
        rcall 1, 0           //
        ldi r3, 1           // if (r3==0) then (call Computer's turn module) else (call Players's turn module)
    else                   //
        rcall 2, 0        //
        //ldi r3, 0
        ldi r3, 1        //
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
        //print("LOSE")
    fi
    mret
    
end. 